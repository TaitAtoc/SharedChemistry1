<?php
declare(strict_types=1);

header('Content-Type: text/plain; charset=utf-8');

if (!hash_equals('reset-admin', (string)($_GET['confirm'] ?? ''))) {
    echo "SharedChemistry admin reset: confirmation required\n";
    exit;
}

define('PH7', 1);

try {
    $rootPath = __DIR__ . DIRECTORY_SEPARATOR;
    $constantsFile = $rootPath . '_constants.php';

    if (!is_file($constantsFile)) {
        echo "SharedChemistry admin reset: failed\n";
        exit;
    }

    require $constantsFile;
    require PH7_PATH_FRAMEWORK . 'Loader/Autoloader.php';

    \PH7\Framework\Loader\Autoloader::getInstance()->init();

    \PH7\Framework\File\Import::file(PH7_PATH_APP . 'configs/environment/all.env');
    \PH7\Framework\File\Import::file(
        PH7_PATH_APP . 'configs/environment/' . \PH7\Framework\Server\Environment::getFileName(
            \PH7\Framework\Config\Config::getInstance()->values['mode']['environment']
        )
    );
    \PH7\Framework\File\Import::pH7App('includes.classes.Loader.Autoloader');
    \PH7\App\Includes\Classes\Loader\Autoloader::getInstance()->init();

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

    $duplicateStmt = $db->prepare(
        'SELECT COUNT(profileId) FROM' . $adminTable .
        'WHERE profileId <> :profileId AND (email = :email OR username = :username)'
    );
    $duplicateStmt->bindValue(':profileId', $profileId, \PDO::PARAM_INT);
    $duplicateStmt->bindValue(':email', $email, \PDO::PARAM_STR);
    $duplicateStmt->bindValue(':username', $username, \PDO::PARAM_STR);
    $duplicateStmt->execute();
    $duplicateCount = (int)$duplicateStmt->fetchColumn();
    \PH7\Framework\Mvc\Model\Engine\Db::free($duplicateStmt);

    if ($duplicateCount > 0) {
        echo "SharedChemistry admin reset: failed\n";
        exit;
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
    \PH7\Framework\Mvc\Model\Engine\Db::free($updateStmt);

    if ($updated) {
        (new \PH7\UserCore())->clearReadProfileCache($profileId, \PH7\DbTableName::ADMIN);
        echo "SharedChemistry admin reset: success\n";
    } else {
        echo "SharedChemistry admin reset: failed\n";
    }
} catch (\Throwable $exception) {
    echo "SharedChemistry admin reset: failed\n";
}
