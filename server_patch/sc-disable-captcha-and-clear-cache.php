<?php
declare(strict_types=1);

header('Content-Type: text/plain; charset=utf-8');

function sc_out(string $message): void
{
    echo $message . PHP_EOL;
}

function sc_find_config_file(): string
{
    $candidates = [
        __DIR__ . '/_protected/app/configs/config.ini',
        __DIR__ . '/app/configs/config.ini',
        __DIR__ . '/app/app/configs/config.ini',
    ];

    foreach ($candidates as $candidate) {
        if (is_file($candidate) && is_readable($candidate)) {
            return $candidate;
        }
    }

    throw new RuntimeException('config.ini was not found in expected pH7 locations.');
}

function sc_db_from_config(string $configFile): array
{
    $config = parse_ini_file($configFile, true, INI_SCANNER_TYPED);

    if (!is_array($config) || empty($config['database']) || !is_array($config['database'])) {
        throw new RuntimeException('Could not read database settings from config.ini.');
    }

    $db = $config['database'];
    foreach (['type', 'hostname', 'name', 'username', 'password'] as $requiredKey) {
        if (!array_key_exists($requiredKey, $db)) {
            throw new RuntimeException('config.ini is missing a required database setting.');
        }
    }

    return [
        'type' => (string)$db['type'],
        'host' => (string)$db['hostname'],
        'port' => (int)($db['port'] ?? 3306),
        'name' => (string)$db['name'],
        'user' => (string)$db['username'],
        'pass' => (string)$db['password'],
        'charset' => (string)($db['charset'] ?? 'utf8mb4'),
        'prefix' => (string)($db['prefix'] ?? ''),
    ];
}

function sc_connect(array $db): PDO
{
    $dsn = sprintf(
        '%s:host=%s;port=%d;dbname=%s;charset=%s',
        $db['type'],
        $db['host'],
        $db['port'],
        $db['name'],
        $db['charset']
    );

    return new PDO(
        $dsn,
        $db['user'],
        $db['pass'],
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
    );
}

function sc_table_exists(PDO $pdo, string $table): bool
{
    $stmt = $pdo->prepare('SHOW TABLES LIKE :table_name');
    $stmt->execute(['table_name' => $table]);

    return $stmt->fetchColumn() !== false;
}

function sc_disabled_value(string $value)
{
    $trimmed = trim($value);
    $lower = strtolower($trimmed);

    $map = [
        '1' => '0',
        'yes' => 'no',
        'true' => 'false',
        'on' => 'off',
        'enable' => 'disable',
        'enabled' => 'disabled',
        'active' => 'inactive',
        'activate' => 'deactivate',
        'activated' => 'deactivated',
    ];

    return $map[$lower] ?? null;
}

function sc_disable_captcha_settings(PDO $pdo, string $settingsTable): array
{
    $select = $pdo->query(
        'SELECT settingName, settingValue FROM `' . str_replace('`', '``', $settingsTable) . '` ' .
        "WHERE settingName LIKE '%captcha%' OR settingName LIKE '%Captcha%' OR settingName LIKE '%CAPTCHA%' " .
        'ORDER BY settingName ASC'
    );
    $rows = $select->fetchAll();
    $update = $pdo->prepare(
        'UPDATE `' . str_replace('`', '``', $settingsTable) . '` ' .
        'SET settingValue = :new_value WHERE settingName = :setting_name LIMIT 1'
    );

    $changed = [];
    $unchanged = [];
    $skipped = [];

    foreach ($rows as $row) {
        $name = (string)$row['settingName'];
        $oldValue = (string)$row['settingValue'];
        $newValue = sc_disabled_value($oldValue);

        if ($newValue === null) {
            $skipped[] = [
                'name' => $name,
                'value' => $oldValue,
                'reason' => 'not a boolean-style captcha setting',
            ];
            continue;
        }

        if ($newValue === $oldValue) {
            $unchanged[] = [
                'name' => $name,
                'value' => $oldValue,
            ];
            continue;
        }

        $update->execute([
            'new_value' => $newValue,
            'setting_name' => $name,
        ]);

        $changed[] = [
            'name' => $name,
            'old' => $oldValue,
            'new' => $newValue,
        ];
    }

    return [
        'changed' => $changed,
        'unchanged' => $unchanged,
        'skipped' => $skipped,
        'found' => count($rows),
    ];
}

function sc_clear_cache_files(string $cacheDir): array
{
    $deleted = 0;
    $failed = [];

    if (!is_dir($cacheDir)) {
        return [
            'cache_dir' => $cacheDir,
            'deleted' => 0,
            'failed' => ['cache directory not found'],
        ];
    }

    $root = realpath($cacheDir);
    if ($root === false) {
        return [
            'cache_dir' => $cacheDir,
            'deleted' => 0,
            'failed' => ['cache directory could not be resolved'],
        ];
    }

    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($root, FilesystemIterator::SKIP_DOTS),
        RecursiveIteratorIterator::CHILD_FIRST
    );

    foreach ($iterator as $item) {
        $path = $item->getPathname();
        $realPath = realpath($path);

        if ($realPath === false || strpos($realPath, $root . DIRECTORY_SEPARATOR) !== 0) {
            $failed[] = $path . ' (outside cache root)';
            continue;
        }

        if ($item->isDir()) {
            continue;
        }

        if ($item->getFilename() === '.keep' || stripos($realPath, DIRECTORY_SEPARATOR . 'log') !== false) {
            continue;
        }

        if (@unlink($realPath)) {
            $deleted++;
        } else {
            $failed[] = $realPath;
        }
    }

    return [
        'cache_dir' => $root,
        'deleted' => $deleted,
        'failed' => $failed,
    ];
}

try {
    sc_out('SharedChemistry captcha/cache maintenance');
    sc_out('Reading pH7 config.ini database settings...');

    $configFile = sc_find_config_file();
    $db = sc_db_from_config($configFile);
    $pdo = sc_connect($db);
    $settingsTable = $db['prefix'] . 'settings';

    if (!sc_table_exists($pdo, $settingsTable)) {
        throw new RuntimeException('Settings table was not found.');
    }

    sc_out('Connected to database.');
    sc_out('Scanning captcha settings...');
    $result = sc_disable_captcha_settings($pdo, $settingsTable);

    sc_out('Captcha settings found: ' . $result['found']);
    sc_out('Changed settings:');
    if (count($result['changed']) === 0) {
        sc_out('- none');
    } else {
        foreach ($result['changed'] as $change) {
            sc_out(sprintf('- %s: %s -> %s', $change['name'], $change['old'], $change['new']));
        }
    }

    sc_out('Already disabled settings:');
    if (count($result['unchanged']) === 0) {
        sc_out('- none');
    } else {
        foreach ($result['unchanged'] as $setting) {
            sc_out(sprintf('- %s: %s', $setting['name'], $setting['value']));
        }
    }

    sc_out('Skipped captcha settings:');
    if (count($result['skipped']) === 0) {
        sc_out('- none');
    } else {
        foreach ($result['skipped'] as $setting) {
            sc_out(sprintf('- %s: %s (%s)', $setting['name'], $setting['value'], $setting['reason']));
        }
    }

    sc_out('Clearing pH7 cache files...');
    $cache = sc_clear_cache_files(__DIR__ . '/_protected/data/cache');
    sc_out('Cache files deleted: ' . $cache['deleted']);

    if (count($cache['failed']) > 0) {
        sc_out('Cache files not deleted:');
        foreach ($cache['failed'] as $failedPath) {
            sc_out('- ' . $failedPath);
        }
    }

    sc_out('Done.');
} catch (Throwable $e) {
    http_response_code(500);
    sc_out('ERROR: ' . $e->getMessage());
}
