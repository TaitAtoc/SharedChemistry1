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

        // SC_FORUM_MODULE_MEMBER_ONLY_V1_ACTIVE
        if (!UserCore::auth() && !$bAdminAuth) {
            $this->signInRedirect();
        }

        if (!$bAdminAuth || UserCore::isAdminLoggedAs()) {
            if (!$this->checkMembership() || !$this->group->forum_access) {
                $this->paymentRedirect();
            } elseif ($this->registry->action === 'addtopic' && !$this->group->create_forum_topics) {
                $this->paymentRedirect();
            } elseif ($this->registry->action === 'reply' && !$this->group->answer_forum_topics) {
                $this->paymentRedirect();
            }
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
