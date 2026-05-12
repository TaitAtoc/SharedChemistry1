<?php
/**
 * SharedChemistry privacy gate for member profile pages.
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
    }
}
