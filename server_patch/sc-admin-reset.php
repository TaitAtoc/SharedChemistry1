<?php
declare(strict_types=1);

header('Content-Type: text/plain; charset=utf-8');

function sc_admin_reset_fail(string $reason): void
{
    echo 'SharedChemistry admin reset: failed - ' . $reason . "\n";
    exit;
}

if (!hash_equals('reset-admin', (string)($_GET['confirm'] ?? ''))) {
    echo "SharedChemistry admin reset: confirmation required\n";
    exit;
}

try {
    $rootPath = __DIR__ . DIRECTORY_SEPARATOR;
    $configFiles = [
        $rootPath . '_protected' . DIRECTORY_SEPARATOR . 'app' . DIRECTORY_SEPARATOR . 'configs' . DIRECTORY_SEPARATOR . 'config.ini',
        $rootPath . 'app' . DIRECTORY_SEPARATOR . 'configs' . DIRECTORY_SEPARATOR . 'config.ini',
    ];

    $configFile = null;

    foreach ($configFiles as $candidateFile) {
        if (is_file($candidateFile)) {
            $configFile = $candidateFile;
            break;
        }
    }

    if ($configFile === null) {
        sc_admin_reset_fail('config');
    }

    $config = parse_ini_file($configFile, true);

    if (!is_array($config) || !isset($config['database']) || !is_array($config['database'])) {
        sc_admin_reset_fail('config');
    }

    $databaseConfig = $config['database'];
    $requiredKeys = ['type', 'hostname', 'port', 'name', 'username', 'password', 'prefix', 'charset'];

    foreach ($requiredKeys as $requiredKey) {
        if (!array_key_exists($requiredKey, $databaseConfig)) {
            sc_admin_reset_fail('config');
        }
    }

    $databaseType = (string)$databaseConfig['type'];
    $databaseHost = (string)$databaseConfig['hostname'];
    $databasePort = (string)$databaseConfig['port'];
    $databaseName = (string)$databaseConfig['name'];
    $databaseUser = (string)$databaseConfig['username'];
    $databasePassword = (string)$databaseConfig['password'];
    $databasePrefix = (string)$databaseConfig['prefix'];
    $databaseCharset = (string)$databaseConfig['charset'];

    if ($databaseType !== 'mysql' || !preg_match('/^[A-Za-z0-9_]+$/', $databasePrefix)) {
        sc_admin_reset_fail('config');
    }

    $adminTable = $databasePrefix . 'admins';

    if (!preg_match('/^[A-Za-z0-9_]+$/', $adminTable)) {
        sc_admin_reset_fail('config');
    }

    try {
        $pdo = new PDO(
            'mysql:host=' . $databaseHost . ';port=' . $databasePort . ';dbname=' . $databaseName . ';charset=' . $databaseCharset,
            $databaseUser,
            $databasePassword,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]
        );
    } catch (PDOException $connectException) {
        sc_admin_reset_fail('connect');
    }

    $profileId = 1;
    $email = 'tait@anzsbs.com';
    $username = 'Tait';
    $quotedAdminTable = '`' . $adminTable . '`';

    $emailStmt = $pdo->prepare(
        'SELECT COUNT(profileId) FROM ' . $quotedAdminTable .
        ' WHERE profileId <> :profileId AND email = :email'
    );
    $emailStmt->bindValue(':profileId', $profileId, PDO::PARAM_INT);
    $emailStmt->bindValue(':email', $email, PDO::PARAM_STR);
    $emailStmt->execute();

    if ((int)$emailStmt->fetchColumn() > 0) {
        sc_admin_reset_fail('duplicate email');
    }

    $usernameStmt = $pdo->prepare(
        'SELECT COUNT(profileId) FROM ' . $quotedAdminTable .
        ' WHERE profileId <> :profileId AND username = :username'
    );
    $usernameStmt->bindValue(':profileId', $profileId, PDO::PARAM_INT);
    $usernameStmt->bindValue(':username', $username, PDO::PARAM_STR);
    $usernameStmt->execute();

    if ((int)$usernameStmt->fetchColumn() > 0) {
        sc_admin_reset_fail('duplicate username');
    }

    $passwordHash = password_hash('123456789', PASSWORD_BCRYPT);

    if ($passwordHash === false) {
        sc_admin_reset_fail('exception');
    }

    $updateStmt = $pdo->prepare(
        'UPDATE ' . $quotedAdminTable .
        ' SET email = :email, username = :username, password = :password WHERE profileId = :profileId LIMIT 1'
    );
    $updateStmt->bindValue(':email', $email, PDO::PARAM_STR);
    $updateStmt->bindValue(':username', $username, PDO::PARAM_STR);
    $updateStmt->bindValue(':password', $passwordHash, PDO::PARAM_STR);
    $updateStmt->bindValue(':profileId', $profileId, PDO::PARAM_INT);
    $updated = $updateStmt->execute();

    if (!$updated || $updateStmt->rowCount() < 1) {
        sc_admin_reset_fail('update');
    }

    echo "SharedChemistry admin reset: success\n";
} catch (Throwable $exception) {
    sc_admin_reset_fail('exception');
}
