<?php
/**
 * SharedChemistry privacy gate for member-only user/community controllers.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

class Permission extends PermissionCore
{
    private const MEMBER_ONLY_CONTROLLERS = [
        'AccountController',
        'BrowseController',
        'ProfileController',
        'SearchController',
        'SettingController',
        'VisitorController',
    ];

    public function __construct()
    {
        parent::__construct();

        $bUserAuth = User::auth();
        $bAdminAuth = AdminCore::auth();
        $bRequiresMemberAccess = $this->requiresMemberAccess();

        /***** Levels for members *****/

        if (!$bUserAuth && !$bAdminAuth && $bRequiresMemberAccess) {
            $this->signInRedirect();
        }

        if (!$bUserAuth && $this->registry->action === 'logout') {
            $this->signInRedirect();
        }

        if ($bUserAuth && ($this->registry->controller === 'SignupController' || $this->registry->action === 'activate'
            || $this->registry->action === 'resendactivation' || $this->registry->action === 'login')) {
            $this->alreadyConnectedRedirect();
        }

        // Options and Memberships ...
        /*
         * If the admin is not logged (but can be if the admin use "login as user" feature)
         * and not redirect to payment page if the user wants to logout
        */
        if ($bUserAuth && $bRequiresMemberAccess && (!$bAdminAuth || User::isAdminLoggedAs()) && $this->registry->action !== 'logout') {
            if (!$this->checkMembership() || ($bUserAuth && !$this->group->member_site_access)) {
                $this->paymentRedirect();
            } elseif ($this->registry->controller === 'SearchController') {
                if (!$this->group->quick_search_profiles || !$this->group->advanced_search_profiles) {
                    $this->paymentRedirect();
                }
            }
        }
    }

    private function requiresMemberAccess()
    {
        if ($this->registry->controller === 'AccountController' && $this->registry->action === 'activate') {
            return false;
        }

        return in_array($this->registry->controller, self::MEMBER_ONLY_CONTROLLERS, true);
    }
}
