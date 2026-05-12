<?php
/**
 * SharedChemistry privacy gate for private messages.
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

        if (!UserCore::auth() && !$bAdminAuth) {
            $this->signInRedirect();
        }

        if (!$bAdminAuth || UserCore::isAdminLoggedAs()) {
            if (!$this->checkMembership() || ($this->registry->action === 'inbox' && !$this->group->read_mails)) {
                $this->paymentRedirect();
            } elseif ($this->registry->action === 'compose' && !$this->group->send_mails) {
                $this->paymentRedirect();
            }
        }

        if (!$bAdminAuth && $this->registry->controller === 'AdminController') {
            Header::redirect(
                Uri::get('user', 'main', 'login'),
                $this->adminSignInMsg(),
                Design::ERROR_TYPE
            );
        }
    }
}
