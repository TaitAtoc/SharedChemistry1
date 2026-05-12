<?php
/**
 * SharedChemistry privacy gate for video pages.
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

        if (!UserCore::auth() && !AdminCore::auth()) {
            $this->signInRedirect();
        }

        if ($this->isNotAdmin()) {
            if (!$this->checkMembership() || !$this->group->view_videos) {
                $this->paymentRedirect();
            } elseif (($this->registry->action === 'addalbum' || $this->registry->action === 'addvideo') && !$this->group->upload_videos) {
                $this->paymentRedirect();
            }

            if ($this->registry->controller === 'AdminController') {
                Header::redirect(
                    Uri::get('user', 'main', 'login'),
                    $this->adminSignInMsg(),
                    Design::ERROR_TYPE
                );
            }
        }
    }
}
