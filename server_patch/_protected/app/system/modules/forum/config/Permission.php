<?php
/**
 * SharedChemistry privacy gate for forums.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\Layout\Html\Design;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Url\Header;

class Permission extends PermissionCore
{
    public function __construct()
    {
        parent::__construct();

        $bAdminAuth = AdminCore::auth();
        $bUserAuth = UserCore::auth();

        // SC_FORUM_MODULE_MEMBER_ONLY_V1_ACTIVE
        // SC_FORUM_PERMISSION_ALLOW_SIGNED_IN_MEMBERS_V1_ACTIVE
        if (!$bUserAuth && !$bAdminAuth) {
            $this->signInRedirect();
        }

        if (!$bAdminAuth && $this->registry->controller === 'AdminController') {
            Header::redirect(
                Uri::get('forum', 'forum', 'index'),
                $this->adminSignInMsg(),
                Design::ERROR_TYPE
            );
        }
    }
}
