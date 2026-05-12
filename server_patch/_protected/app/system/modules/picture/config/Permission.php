<?php
/**
 * SharedChemistry privacy gate for photo pages.
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
            if (!$this->checkMembership() || !$this->group->view_pictures) {
                $this->paymentRedirect();
            } elseif (($this->registry->action === 'addalbum' || $this->registry->action === 'addphoto') &&
                !$this->group->upload_pictures) {
                $this->paymentRedirect();
            }
        }
    }
}
