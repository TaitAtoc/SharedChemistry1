<?php
/**
 * Temporary live route diagnostic for /photo-gallery.
 *
 * Usage:
 *   /sc-photo-gallery-route-debug.php?confirm=route-debug
 *
 * This script only reads route/config/cache files and prints diagnostics.
 */

declare(strict_types=1);

if (($_GET['confirm'] ?? '') !== 'route-debug') {
    http_response_code(403);
    header('Content-Type: text/plain; charset=UTF-8');
    echo "Add ?confirm=route-debug to run this diagnostic.\n";
    exit;
}

header('Content-Type: text/plain; charset=UTF-8');

$siteRoot = __DIR__;

function out(string $text = ''): void
{
    echo $text . "\n";
}

function status(bool $value): string
{
    return $value ? 'YES' : 'NO';
}

function relPath(string $path, string $root): string
{
    $root = rtrim(str_replace('\\', '/', $root), '/');
    $path = str_replace('\\', '/', $path);

    if (strpos($path, $root . '/') === 0) {
        return substr($path, strlen($root) + 1);
    }

    return $path;
}

function routeTarget(string $line): string
{
    if (stripos($line, 'module="sc-gallery"') !== false || stripos($line, "module='sc-gallery'") !== false) {
        return 'sc-gallery';
    }

    if (stripos($line, 'module="picture"') !== false || stripos($line, "module='picture'") !== false) {
        return 'picture';
    }

    if (stripos($line, 'sc-gallery') !== false) {
        return 'sc-gallery';
    }

    if (stripos($line, 'picture') !== false) {
        return 'picture';
    }

    return 'unknown';
}

function linesContaining(string $path, string $needle): array
{
    if (!is_file($path) || !is_readable($path)) {
        return [];
    }

    $lines = @file($path, FILE_IGNORE_NEW_LINES);
    if ($lines === false) {
        return [];
    }

    $matches = [];
    foreach ($lines as $index => $line) {
        if (stripos($line, $needle) !== false) {
            $matches[] = [
                'number' => $index + 1,
                'line' => trim($line),
                'target' => routeTarget($line),
            ];
        }
    }

    return $matches;
}

function looksLikeDatabaseConfig(string $path): bool
{
    $normalized = strtolower(str_replace('\\', '/', $path));
    $basename = strtolower(basename($normalized));

    return strpos($normalized, '/database') !== false
        || strpos($normalized, '/db/') !== false
        || strpos($basename, 'database') !== false
        || strpos($basename, 'db') !== false;
}

function readSmallTextFile(string $path): ?string
{
    if (!is_file($path) || !is_readable($path)) {
        return null;
    }

    $size = @filesize($path);
    if ($size === false || $size > 1048576) {
        return null;
    }

    $content = @file_get_contents($path);
    if ($content === false || strpos($content, "\0") !== false) {
        return null;
    }

    return $content;
}

function snippetAround(string $content, string $needle, int $radius = 180): string
{
    $position = stripos($content, $needle);
    if ($position === false) {
        return '';
    }

    $start = max(0, $position - $radius);
    $length = strlen($needle) + ($radius * 2);
    $snippet = substr($content, $start, $length);
    $snippet = preg_replace('/\s+/', ' ', (string) $snippet);
    $snippet = trim((string) $snippet);

    if ($start > 0) {
        $snippet = '...' . $snippet;
    }

    if (($start + $length) < strlen($content)) {
        $snippet .= '...';
    }

    return $snippet;
}

function termFound(string $content, string $term): bool
{
    return stripos($content, $term) !== false;
}

out('SharedChemistry photo-gallery route diagnostic');
out('Generated: ' . gmdate('c'));
out('');

out('Site root path: ' . $siteRoot);
out('');

$routeFiles = [
    $siteRoot . '/_protected/app/configs/routes/en.xml',
    $siteRoot . '/app/configs/routes/en.xml',
];

out('Route files');
foreach ($routeFiles as $routeFile) {
    out('- ' . $routeFile);
    out('  exists: ' . status(is_file($routeFile)));

    $matches = linesContaining($routeFile, 'photo-gallery');
    if ($matches === []) {
        out('  photo-gallery line: NOT FOUND');
        continue;
    }

    foreach ($matches as $match) {
        out('  line ' . $match['number'] . ' points to: ' . $match['target']);
        out('  ' . $match['line']);
    }
}

out('');
out('sc-gallery deployed module files');
$moduleFiles = [
    '_protected/app/system/modules/sc-gallery/config/Permission.php',
    '_protected/app/system/modules/sc-gallery/config/config.ini',
    '_protected/app/system/modules/sc-gallery/controllers/MainController.php',
    '_protected/app/system/modules/sc-gallery/models/GalleryModel.php',
    '_protected/app/system/modules/sc-gallery/views/base/tpl/main/index.tpl',
];

foreach ($moduleFiles as $moduleFile) {
    $fullPath = $siteRoot . '/' . $moduleFile;
    out('- ' . $moduleFile . ': ' . status(is_file($fullPath)));
}

out('');
out('Safe cache/config search');
$searchDirs = [
    'data/cache',
    '_protected/data/cache',
    '_protected/data/tmp',
    '_protected/data/config',
    'app/configs',
    '_protected/app/configs',
];
$terms = [
    'photo-gallery',
    'module="picture"',
    'module="sc-gallery"',
];

foreach ($searchDirs as $searchDir) {
    $fullDir = $siteRoot . '/' . $searchDir;
    out('');
    out('Directory: ' . $searchDir . ' exists: ' . status(is_dir($fullDir)));

    if (!is_dir($fullDir)) {
        continue;
    }

    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($fullDir, FilesystemIterator::SKIP_DOTS)
    );

    $foundAny = false;
    foreach ($iterator as $fileInfo) {
        if (!$fileInfo->isFile()) {
            continue;
        }

        $path = $fileInfo->getPathname();
        $content = readSmallTextFile($path);
        if ($content === null) {
            continue;
        }

        $foundTerms = [];
        foreach ($terms as $term) {
            if (termFound($content, $term)) {
                $foundTerms[] = $term;
            }
        }

        if ($foundTerms === []) {
            continue;
        }

        $foundAny = true;
        out('- ' . relPath($path, $siteRoot));
        out('  found: ' . implode(', ', $foundTerms));

        if (looksLikeDatabaseConfig($path)) {
            out('  database-like config: snippet suppressed');
            continue;
        }

        if (termFound($content, 'photo-gallery')) {
            out('  snippet: ' . snippetAround($content, 'photo-gallery'));
        }
    }

    if (!$foundAny) {
        out('- no matches');
    }
}

