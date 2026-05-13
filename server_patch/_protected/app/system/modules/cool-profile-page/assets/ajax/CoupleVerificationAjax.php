<?php
/**
 * SharedChemistry couple verification AJAX endpoint.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\Http\Http;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Security\CSRF\Token;
use PH7\JustHttp\StatusCode;
use PDO;

class CoupleVerificationAjax extends Core
{
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const MAX_NOTE_LENGTH = 500;

    public function __construct()
    {
        parent::__construct();

        if (!(new Token)->check('couple_verification')) {
            exit(jsonMsg(0, Form::errorTokenMsg()));
        }

        $this->save();
    }

    private function save(): void
    {
        $iVerifierProfileId = (int)$this->session->get('member_id');
        $iVerifiedProfileId = (int)$this->httpRequest->post('verified_profile_id', 'int');
        $sNote = $this->cleanNote((string)$this->httpRequest->post('verification_note'));

        if ($iVerifierProfileId <= 0) {
            echo jsonMsg(0, t('Please sign in to verify this couple.'));
            return;
        }

        if ($iVerifiedProfileId <= 0) {
            echo jsonMsg(0, t('The couple could not be found.'));
            return;
        }

        if ($iVerifierProfileId === $iVerifiedProfileId) {
            echo jsonMsg(0, t('You cannot verify your own profile.'));
            return;
        }

        if ($sNote === '') {
            echo jsonMsg(0, t('Please add a short note about your experience.'));
            return;
        }

        if ($this->getNoteLength($sNote) > self::MAX_NOTE_LENGTH) {
            echo jsonMsg(0, t('Please keep your note under 500 characters.'));
            return;
        }

        $oUserModel = new UserCoreModel;
        $oVerifiedProfile = $oUserModel->readProfile($iVerifiedProfileId);
        unset($oUserModel);

        if (!$oVerifiedProfile || (int)$oVerifiedProfile->ban === UserCore::BAN_STATUS) {
            echo jsonMsg(0, t('The couple could not be found.'));
            return;
        }

        if (!$this->doesVerificationTableExist()) {
            echo jsonMsg(0, t('Verification storage is not installed yet.'));
            return;
        }

        $bExisting = $this->verificationExists($iVerifierProfileId, $iVerifiedProfileId);

        if (!$this->saveVerification($iVerifierProfileId, $iVerifiedProfileId, $sNote)) {
            echo jsonMsg(0, t('Unable to save verification. Please try again.'));
            return;
        }

        echo jsonMsg(1, $bExisting ? t('Verification updated.') : t('Verification saved.'));
    }

    private function cleanNote(string $sNote): string
    {
        $sNote = trim(str_replace(["\r\n", "\r"], "\n", $sNote));
        $sNote = trim(strip_tags($sNote));

        return $sNote;
    }

    private function getNoteLength(string $sNote): int
    {
        return function_exists('mb_strlen') ? mb_strlen($sNote, 'UTF-8') : strlen($sNote);
    }

    private function doesVerificationTableExist(): bool
    {
        try {
            $rStmt = Db::getInstance()->prepare('SHOW TABLES LIKE :tableName');
            $rStmt->bindValue(':tableName', Db::prefix(self::COUPLE_VERIFICATION_TABLE, false), PDO::PARAM_STR);
            $rStmt->execute();
            $bExists = (bool)$rStmt->fetchColumn();
            Db::free($rStmt);

            return $bExists;
        } catch (\Exception $oException) {
            return false;
        }
    }

    private function verificationExists(int $iVerifierProfileId, int $iVerifiedProfileId): bool
    {
        $rStmt = Db::getInstance()->prepare(
            'SELECT id FROM' .
            Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
            'WHERE verifier_profile_id = :verifierProfileId AND verified_profile_id = :verifiedProfileId LIMIT 1'
        );
        $rStmt->bindValue(':verifierProfileId', $iVerifierProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':verifiedProfileId', $iVerifiedProfileId, PDO::PARAM_INT);
        $rStmt->execute();
        $bExists = (bool)$rStmt->fetchColumn();
        Db::free($rStmt);

        return $bExists;
    }

    private function saveVerification(int $iVerifierProfileId, int $iVerifiedProfileId, string $sNote): bool
    {
        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' .
            Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
            '(verifier_profile_id, verified_profile_id, note, status, created_at, updated_at)
            VALUES (:verifierProfileId, :verifiedProfileId, :note, :status, NOW(), NOW())
            ON DUPLICATE KEY UPDATE note = VALUES(note), status = VALUES(status), updated_at = NOW()'
        );
        $rStmt->bindValue(':verifierProfileId', $iVerifierProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':verifiedProfileId', $iVerifiedProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':note', $sNote, PDO::PARAM_STR);
        $rStmt->bindValue(':status', 'active', PDO::PARAM_STR);
        $bSaved = $rStmt->execute();
        Db::free($rStmt);

        return $bSaved;
    }
}

if (UserCore::auth()) {
    new CoupleVerificationAjax;
} else {
    Http::setHeadersByCode(StatusCode::UNAUTHORIZED);
    echo jsonMsg(0, t('Please sign in to verify this couple.'));
}
