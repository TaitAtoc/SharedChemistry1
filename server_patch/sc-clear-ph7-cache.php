<?php
declare(strict_types=1);

header('Content-Type: text/plain; charset=UTF-8');

$requiredConfirm = 'clear-ph7-cache';

if (($_GET['confirm'] ?? '') !== $requiredConfirm) {
    http_response_code(403);
    echo "SharedChemistry pH7 cache clear\n";
    echo "Run this temporary script with: ?confirm={$requiredConfirm}\n";
    echo "Delete this script from the server after the cache has been cleared.\n";
    exit;
}

$root = realpath(__DIR__);

if ($root === false) {
    http_response_code(500);
    echo "Unable to resolve site root.\n";
    exit;
}

$cacheDirectories = [
    'data/cache/pH7tpl_compile',
    'data/cache/pH7tpl_cache',
    'data/cache/pH7_static',
    '_protected/data/cache/pH7tpl_compile',
    '_protected/data/cache/pH7tpl_cache',
    '_protected/data/cache/pH7_static',
];

function scNormalizePath(string $path): string
{
    return str_replace(['/', '\\'], DIRECTORY_SEPARATOR, $path);
}

function scIsInsideRoot(string $path, string $root): bool
{
    $rootPrefix = rtrim($root, DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR;
    return $path === $root || strpos($path, $rootPrefix) === 0;
}

function scClearDirectoryContents(string $directory): array
{
    $result = [
        'files' => 0,
        'dirs' => 0,
        'skipped' => 0,
        'errors' => [],
    ];

    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($directory, FilesystemIterator::SKIP_DOTS),
        RecursiveIteratorIterator::CHILD_FIRST
    );

    foreach ($iterator as $item) {
        $path = $item->getPathname();
        $name = $item->getBasename();

        if ($name === '.keep' || $item->isLink()) {
            $result['skipped']++;
            continue;
        }

        if ($item->isDir()) {
            if (@rmdir($path)) {
                $result['dirs']++;
            } else {
                $result['errors'][] = "Unable to remove directory: {$path}";
            }
            continue;
        }

        if (@unlink($path)) {
            $result['files']++;
        } else {
            $result['errors'][] = "Unable to remove file: {$path}";
        }
    }

    return $result;
}

echo "SharedChemistry pH7 cache clear\n";
echo "Site root: {$root}\n\n";

$totalFiles = 0;
$totalDirs = 0;
$totalSkipped = 0;
$totalErrors = 0;

foreach ($cacheDirectories as $relativeDirectory) {
    $target = $root . DIRECTORY_SEPARATOR . scNormalizePath($relativeDirectory);
    $realTarget = realpath($target);

    echo "- {$relativeDirectory}: ";

    if ($realTarget === false || !is_dir($realTarget)) {
        echo "missing, skipped\n";
        continue;
    }

    if (!scIsInsideRoot($realTarget, $root)) {
        echo "outside site root, skipped\n";
        $totalSkipped++;
        continue;
    }

    $result = scClearDirectoryContents($realTarget);

    $totalFiles += $result['files'];
    $totalDirs += $result['dirs'];
    $totalSkipped += $result['skipped'];
    $totalErrors += count($result['errors']);

    echo "cleared {$result['files']} files, {$result['dirs']} directories";

    if ($result['skipped'] > 0) {
        echo ", skipped {$result['skipped']} protected entries";
    }

    echo "\n";

    foreach ($result['errors'] as $error) {
        echo "  ERROR: {$error}\n";
    }
}

echo "\nSummary: cleared {$totalFiles} files and {$totalDirs} directories";

if ($totalSkipped > 0) {
    echo "; skipped {$totalSkipped} protected entries";
}

if ($totalErrors > 0) {
    echo "; {$totalErrors} errors";
}

echo ".\n";
echo "Delete sc-clear-ph7-cache.php from the server after use.\n";

if ($totalErrors > 0) {
    http_response_code(500);
}
