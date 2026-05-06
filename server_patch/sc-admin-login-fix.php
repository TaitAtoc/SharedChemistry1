<?php
declare(strict_types=1);

header('Content-Type: text/plain; charset=utf-8');

const SC_ADMIN_EMAIL = 'tait@anzsbs.com';
const SC_ADMIN_USERNAME = 'Tait';
const SC_ADMIN_PASSWORD = '123456789';

function sc_out(string $message): void
{
    echo $message . PHP_EOL;
}

function sc_q(string $name): string
{
    return '`' . str_replace('`', '``', $name) . '`';
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

function sc_columns(PDO $pdo, string $table): array
{
    $stmt = $pdo->query('SHOW COLUMNS FROM ' . sc_q($table));
    $columns = [];

    foreach ($stmt->fetchAll() as $row) {
        $columns[] = (string)$row['Field'];
    }

    return $columns;
}

function sc_first_existing(array $columns, array $candidates)
{
    foreach ($candidates as $candidate) {
        if (in_array($candidate, $columns, true)) {
            return $candidate;
        }
    }

    return null;
}

function sc_hash_password(string $password): array
{
    $securityPathCandidates = [
        __DIR__ . '/_protected/framework/Security/Security.class.php',
        __DIR__ . '/framework/Security/Security.class.php',
        __DIR__ . '/app/framework/Security/Security.class.php',
    ];

    if (!defined('PH7')) {
        define('PH7', true);
    }

    foreach ($securityPathCandidates as $candidate) {
        if (is_file($candidate) && is_readable($candidate)) {
            require_once $candidate;

            if (class_exists('\\PH7\\Framework\\Security\\Security')) {
                return [
                    'hash' => \PH7\Framework\Security\Security::hashPwd($password),
                    'method' => 'PH7\\Framework\\Security\\Security::hashPwd',
                ];
            }
        }
    }

    return [
        'hash' => password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]),
        'method' => 'password_hash bcrypt cost 12 fallback',
    ];
}

function sc_reset_admin(PDO $pdo, string $adminTable): array
{
    if (!sc_table_exists($pdo, $adminTable)) {
        throw new RuntimeException('Admin table was not found.');
    }

    $columns = sc_columns($pdo, $adminTable);
    $idColumn = sc_first_existing($columns, ['profileId', 'adminId', 'id']);

    foreach (['email', 'username', 'password'] as $requiredColumn) {
        if (!in_array($requiredColumn, $columns, true)) {
            throw new RuntimeException('Admin table is missing required login column: ' . $requiredColumn);
        }
    }

    if ($idColumn === null) {
        throw new RuntimeException('Admin table is missing a supported ID column.');
    }

    $hash = sc_hash_password(SC_ADMIN_PASSWORD);
    $select = $pdo->query(
        'SELECT ' . sc_q($idColumn) . ' FROM ' . sc_q($adminTable) .
        ' ORDER BY ' . sc_q($idColumn) . ' ASC LIMIT 1'
    );
    $adminId = $select->fetchColumn();

    if ($adminId === false) {
        throw new RuntimeException('No admin row was found to update.');
    }

    $update = $pdo->prepare(
        'UPDATE ' . sc_q($adminTable) .
        ' SET email = :email, username = :username, password = :password' .
        ' WHERE ' . sc_q($idColumn) . ' = :admin_id LIMIT 1'
    );
    $update->execute([
        'email' => SC_ADMIN_EMAIL,
        'username' => SC_ADMIN_USERNAME,
        'password' => $hash['hash'],
        'admin_id' => $adminId,
    ]);

    return [
        'table' => $adminTable,
        'id_column' => $idColumn,
        'login_columns' => ['email', 'username', 'password'],
        'updated' => $update->rowCount() >= 0,
        'hash_method' => $hash['method'],
    ];
}

function sc_disabled_value(string $value)
{
    $lower = strtolower(trim($value));
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

function sc_disable_admin_captcha_settings(PDO $pdo, string $settingsTable): array
{
    if (!sc_table_exists($pdo, $settingsTable)) {
        return ['found' => 0, 'changed' => [], 'skipped' => []];
    }

    $select = $pdo->query(
        'SELECT settingName, settingValue FROM ' . sc_q($settingsTable) . ' ' .
        "WHERE settingName LIKE '%captcha%' OR settingName LIKE '%Captcha%' OR settingName LIKE '%CAPTCHA%' " .
        "OR settingName LIKE '%admin%' OR settingName LIKE '%Admin%' OR settingName LIKE '%login%' OR settingName LIKE '%Login%' " .
        'ORDER BY settingName ASC'
    );
    $rows = $select->fetchAll();
    $update = $pdo->prepare(
        'UPDATE ' . sc_q($settingsTable) .
        ' SET settingValue = :new_value WHERE settingName = :setting_name LIMIT 1'
    );
    $changed = [];
    $skipped = [];

    foreach ($rows as $row) {
        $name = (string)$row['settingName'];
        $oldValue = (string)$row['settingValue'];
        $nameLower = strtolower($name);
        $isAdminCaptcha = strpos($nameLower, 'captcha') !== false &&
            (strpos($nameLower, 'admin') !== false || strpos($nameLower, 'login') !== false);
        $isGlobalCaptcha = in_array($name, ['isCaptcha', 'captcha', 'enableCaptcha', 'captchaEnabled'], true);

        if (!$isAdminCaptcha && !$isGlobalCaptcha) {
            $skipped[] = $name . ' (not admin/global captcha)';
            continue;
        }

        $newValue = sc_disabled_value($oldValue);
        if ($newValue === null) {
            $skipped[] = $name . ' (not boolean-style)';
            continue;
        }

        if ($newValue === $oldValue) {
            $skipped[] = $name . ' (already disabled)';
            continue;
        }

        $update->execute([
            'new_value' => $newValue,
            'setting_name' => $name,
        ]);
        $changed[] = $name . ': ' . $oldValue . ' -> ' . $newValue;
    }

    return ['found' => count($rows), 'changed' => $changed, 'skipped' => $skipped];
}

function sc_clear_cache_files(string $cacheDir): array
{
    $deleted = 0;
    $failed = [];
    $allowedDirs = ['pH7tpl_compile', 'pH7tpl_cache', 'pH7_cache'];

    if (!is_dir($cacheDir)) {
        return ['deleted' => 0, 'failed' => ['cache directory not found']];
    }

    $root = realpath($cacheDir);
    if ($root === false) {
        return ['deleted' => 0, 'failed' => ['cache directory could not be resolved']];
    }

    foreach ($allowedDirs as $allowedDir) {
        $target = realpath($root . DIRECTORY_SEPARATOR . $allowedDir);
        if ($target === false || !is_dir($target) || strpos($target, $root . DIRECTORY_SEPARATOR) !== 0) {
            continue;
        }

        $iterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($target, FilesystemIterator::SKIP_DOTS),
            RecursiveIteratorIterator::CHILD_FIRST
        );

        foreach ($iterator as $item) {
            if ($item->isDir()) {
                continue;
            }

            $path = $item->getPathname();
            $realPath = realpath($path);
            if ($realPath === false || strpos($realPath, $target . DIRECTORY_SEPARATOR) !== 0) {
                $failed[] = $path . ' (outside cache target)';
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
    }

    return ['deleted' => $deleted, 'failed' => $failed];
}

try {
    sc_out('SharedChemistry admin login maintenance');
    sc_out('Reading pH7 config.ini database settings...');

    $db = sc_db_from_config(sc_find_config_file());
    $pdo = sc_connect($db);
    $adminTable = $db['prefix'] . 'admins';
    $settingsTable = $db['prefix'] . 'settings';

    sc_out('Connected to database.');
    $admin = sc_reset_admin($pdo, $adminTable);
    sc_out('Detected admin table: ' . $admin['table']);
    sc_out('Detected admin ID column: ' . $admin['id_column']);
    sc_out('Detected login columns: ' . implode(', ', $admin['login_columns']));
    sc_out('Admin row updated: ' . ($admin['updated'] ? 'yes' : 'no'));
    sc_out('Password hash method: ' . $admin['hash_method']);

    $captcha = sc_disable_admin_captcha_settings($pdo, $settingsTable);
    sc_out('Captcha/admin/login settings scanned: ' . $captcha['found']);
    sc_out('Captcha settings changed:');
    if (count($captcha['changed']) === 0) {
        sc_out('- none');
    } else {
        foreach ($captcha['changed'] as $change) {
            sc_out('- ' . $change);
        }
    }

    sc_out('Captcha settings skipped:');
    if (count($captcha['skipped']) === 0) {
        sc_out('- none');
    } else {
        foreach ($captcha['skipped'] as $skip) {
            sc_out('- ' . $skip);
        }
    }

    $cache = sc_clear_cache_files(__DIR__ . '/_protected/data/cache');
    sc_out('Cache files cleared: ' . $cache['deleted']);
    if (count($cache['failed']) > 0) {
        sc_out('Cache files not cleared:');
        foreach ($cache['failed'] as $failedPath) {
            sc_out('- ' . $failedPath);
        }
    }

    sc_out('Admin login credentials after reset:');
    sc_out('- email: ' . SC_ADMIN_EMAIL);
    sc_out('- username: ' . SC_ADMIN_USERNAME);
    sc_out('- password: ' . SC_ADMIN_PASSWORD);
    sc_out('Done.');
} catch (Throwable $e) {
    http_response_code(500);
    sc_out('ERROR: ' . $e->getMessage());
}
