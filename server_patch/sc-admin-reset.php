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

define('PH7', 1);

try {
    $rootPath = __DIR__ . DIRECTORY_SEPARATOR;
    $constantsFile = $rootPath . '_constants.php';

    if (!is_file($constantsFile)) {
        sc_admin_reset_fail('bootstrap');
        exit;
    }

    require $constantsFile;
    require PH7_PATH_FRAMEWORK . 'Loader/Autoloader.php';
    require PH7_PATH_APP . 'includes/classes/DbTableName.php';

    \PH7\Framework\Loader\Autoloader::getInstance()->init();

    \PH7\Framework\File\Import::file(PH7_PATH_APP . 'configs/environment/all.env');
    \PH7\Framework\File\Import::file(
        PH7_PATH_APP . 'configs/environment/' . \PH7\Framework\Server\Environment::getFileName(
            \PH7\Framework\Config\Config::getInstance()->values['mode']['environment']
        )
    );

    $config = \PH7\Framework\Config\Config::getInstance();
    $driverOptions = [
        \PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . $config->values['database']['charset']
    ];

    \PH7\Framework\Mvc\Model\Engine\Db::getInstance(
        $config->values['database']['type'] . ':host=' . $config->values['database']['hostname'] . ';port=' . $config->values['database']['port'] . ';dbname=' . $config->values['database']['name'],
        $config->values['database']['username'],
        $config->values['database']['password'],
        $driverOptions,
        $config->values['database']['prefix']
    );

    $db = \PH7\Framework\Mvc\Model\Engine\Db::getInstance();
    $adminTable = \PH7\Framework\Mvc\Model\Engine\Db::prefix(\PH7\DbTableName::ADMIN);
    $profileId = 1;
    $email = 'tait@anzsbs.com';
    $username = 'Tait';

    $emailStmt = $db->prepare(
        'SELECT COUNT(profileId) FROM' . $adminTable .
        'WHERE profileId <> :profileId AND email = :email'
    );
    $emailStmt->bindValue(':profileId', $profileId, \PDO::PARAM_INT);
    $emailStmt->bindValue(':email', $email, \PDO::PARAM_STR);
    $emailStmt->execute();
    $emailDuplicateCount = (int)$emailStmt->fetchColumn();
    \PH7\Framework\Mvc\Model\Engine\Db::free($emailStmt);

    if ($emailDuplicateCount > 0) {
        sc_admin_reset_fail('duplicate email');
    }

    $usernameStmt = $db->prepare(
        'SELECT COUNT(profileId) FROM' . $adminTable .
        'WHERE profileId <> :profileId AND username = :username'
    );
    $usernameStmt->bindValue(':profileId', $profileId, \PDO::PARAM_INT);
    $usernameStmt->bindValue(':username', $username, \PDO::PARAM_STR);
    $usernameStmt->execute();
    $usernameDuplicateCount = (int)$usernameStmt->fetchColumn();
    \PH7\Framework\Mvc\Model\Engine\Db::free($usernameStmt);

    if ($usernameDuplicateCount > 0) {
        sc_admin_reset_fail('duplicate username');
    }

    $passwordHash = \PH7\Framework\Security\Security::hashPwd('123456789');
    $updateStmt = $db->prepare(
        'UPDATE' . $adminTable .
        'SET email = :email, username = :username, password = :password WHERE profileId = :profileId LIMIT 1'
    );
    $updateStmt->bindValue(':email', $email, \PDO::PARAM_STR);
    $updateStmt->bindValue(':username', $username, \PDO::PARAM_STR);
    $updateStmt->bindValue(':password', $passwordHash, \PDO::PARAM_STR);
    $updateStmt->bindValue(':profileId', $profileId, \PDO::PARAM_INT);
    $updated = $updateStmt->execute();
    $rowCount = $updateStmt->rowCount();
    \PH7\Framework\Mvc\Model\Engine\Db::free($updateStmt);

    if (!$updated || $rowCount < 1) {
        sc_admin_reset_fail('update');
    }

    try {
        (new \PH7\Framework\Cache\Cache())
            ->start('db/sys/mod/admin', 'readProfile' . $profileId . \PH7\DbTableName::ADMIN, null)
            ->clear();
    } catch (\Throwable $cacheException) {
        // Cache clearing is best-effort only; the database update above is the reset.
    }

    echo "SharedChemistry admin reset: success\n";
} catch (\Throwable $exception) {
    sc_admin_reset_fail('exception');
}
