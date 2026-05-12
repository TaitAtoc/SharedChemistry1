<?php
/**
 * SharedChemistry privacy gate for chat.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

class Permission extends PermissionCore
{
    public function __construct()
    {
        parent::__construct();

        if (!UserCore::auth() && !AdminCore::auth()) {
            $this->signInRedirect();
        }

        if ($this->isNotAdmin()) {
            if (!$this->checkMembership() || !$this->group->chat) {
                $this->paymentRedirect();
            }
        }
    }
}
