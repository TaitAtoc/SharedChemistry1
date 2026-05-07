<?php
declare(strict_types=1);

header('Content-Type: text/plain; charset=UTF-8');

echo "SharedChemistry couple profile data field maintenance\n\n";

$configPaths = [
    __DIR__ . '/_protected/app/configs/config.ini',
    __DIR__ . '/app/configs/config.ini',
];

$configPath = null;
foreach ($configPaths as $path) {
    if (is_file($path) && is_readable($path)) {
        $configPath = $path;
        break;
    }
}

if ($configPath === null) {
    echo "Detected table: not checked\n";
    echo "Column existed: not checked\n";
    echo "Column added: no\n";
    echo "Done\n";
    exit(1);
}

$config = parse_ini_file($configPath, true);
if (!is_array($config) || empty($config['database']) || !is_array($config['database'])) {
    echo "Detected table: not checked\n";
    echo "Column existed: not checked\n";
    echo "Column added: no\n";
    echo "Done\n";
    exit(1);
}

$db = $config['database'];
$requiredKeys = ['type', 'hostname', 'username', 'password', 'name', 'prefix', 'charset'];
foreach ($requiredKeys as $key) {
    if (!array_key_exists($key, $db)) {
        echo "Detected table: not checked\n";
        echo "Column existed: not checked\n";
        echo "Column added: no\n";
        echo "Done\n";
        exit(1);
    }
}

$driver = (string)$db['type'];
$host = (string)$db['hostname'];
$database = (string)$db['name'];
$username = (string)$db['username'];
$password = (string)$db['password'];
$prefix = (string)$db['prefix'];
$charset = (string)$db['charset'];
$port = isset($db['port']) ? (int)$db['port'] : 3306;

$table = $prefix . 'members_info';
$column = 'couple_profile_data';

$quoteIdentifier = static function (string $identifier): string {
    return '`' . str_replace('`', '``', $identifier) . '`';
};

try {
    $dsn = sprintf(
        '%s:host=%s;port=%d;dbname=%s;charset=%s',
        $driver,
        $host,
        $port,
        $database,
        $charset
    );

    $pdo = new PDO(
        $dsn,
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
    );

    $tableCheck = $pdo->prepare('SHOW TABLES LIKE :table_name');
    $tableCheck->execute(['table_name' => $table]);
    $tableExists = (bool)$tableCheck->fetchColumn();

    echo 'Detected table: ' . ($tableExists ? $table : 'not found') . "\n";

    if (!$tableExists) {
        echo "Column existed: not checked\n";
        echo "Column added: no\n";
        echo "Done\n";
        exit(1);
    }

    $columnCheck = $pdo->prepare('SHOW COLUMNS FROM ' . $quoteIdentifier($table) . ' LIKE :column_name');
    $columnCheck->execute(['column_name' => $column]);
    $columnExists = (bool)$columnCheck->fetchColumn();

    echo 'Column existed: ' . ($columnExists ? 'yes' : 'no') . "\n";

    if ($columnExists) {
        echo "Column added: no\n";
        echo "Done\n";
        exit(0);
    }

    $pdo->exec('ALTER TABLE ' . $quoteIdentifier($table) . ' ADD ' . $quoteIdentifier($column) . ' MEDIUMTEXT NULL');

    echo "Column added: yes\n";
    echo "Done\n";
} catch (Throwable $e) {
    echo "Column existed: unknown\n";
    echo "Column added: no\n";
    echo "Done\n";
    exit(1);
}
