<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2012-2019, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / Invite / Form / Processing
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\Mail\Mail;
use PH7\Framework\Mail\Mailable;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Security\Validate\Validate;

class InviteFormProcess extends Form
{
    private const MAX_EMAIL_ADDRESSES = 10;
    private const EMAIL_DELIMITER = ',';

    public function __construct()
    {
        parent::__construct();

        $aTo = $this->getEmails();
        if (count($aTo) > self::MAX_EMAIL_ADDRESSES) {
            \PFBC\Form::setError(
                'form_invite',
                t('To prevent spam, you cannot put more than %0% email addresses at a time.', self::MAX_EMAIL_ADDRESSES)
            );
        } else {
            $oMail = new Mail;
            foreach ($aTo as $sEmailAddress) {
                if (!(new Validate)->email($sEmailAddress)) {
                    \PFBC\Form::setError('form_invite', t('One or more email addresses are invalid!'));
                } else {
                    if (!$this->sendMail($sEmailAddress, $oMail)) {
                        \PFBC\Form::setError('form_invite', Form::errorSendingEmail());
                    } else {
                        \PFBC\Form::setSuccess('form_invite', t('Cool! We have sent that.'));
                    }
                }
            }
            unset($oMail);
        }
    }

    /**
     * Send the confirmation email.
     *
     * @param string $sEmailAddress The user email.
     * @param Mailable $oMailEngine
     *
     * @return int Number of recipients who were accepted for delivery.
     *
     * @throws Framework\Layout\Tpl\Engine\PH7Tpl\Exception
     * @throws Framework\Mvc\Request\WrongRequestMethodException
     */
    private function sendMail(string $sEmailAddress, Mailable $oMailEngine): bool
    {
        $sSenderName = escape($this->httpRequest->post('first_name'));
        $sInviteMessage = nl2br(escape($this->httpRequest->post('message')));
        $sSharedChemistryUrl = 'https://sharedchemistry.com/';
        $sSignupUrl = Uri::get('user', 'signup', 'step1', '?ref=invitation');

        $this->view->content = t('Hello,') . '<br /><br />' .
            t('%0% has invited you to discover SharedChemistry, a private adult couples community built for real couple-to-couple connection.', $sSenderName) . '<br /><br />' .
            t('SharedChemistry is designed for adult couples who want a more private, social, and chemistry-focused way to meet other couples.') . '<br /><br />' .
            t('Message from %0%:', $sSenderName) . '<br />"<em>' . $sInviteMessage . '</em>"<br /><br />' .
            t('You can visit SharedChemistry here:') . '<br />' .
            '<a href="' . $sSharedChemistryUrl . '">' . $sSharedChemistryUrl . '</a><br /><br />' .
            '<strong><a href="' . $sSignupUrl . '">' . t('Visit SharedChemistry') . '</a></strong>';
        $this->view->footer = t(
            'You received this invitation because %0% entered your email address using the SharedChemistry invite form.',
            $sSenderName
        );

        $sMessageHtml = $this->view->parseMail(
            PH7_PATH_SYS . 'global/' . PH7_VIEWS . PH7_TPL_MAIL_NAME . '/tpl/mail/sys/mod/invite/invitation.tpl',
            $sEmailAddress
        );

        $aInfo = [
            'to' => $sEmailAddress,
            'subject' => "You've been invited to SharedChemistry"
        ];

        return $oMailEngine->send($aInfo, $sMessageHtml);
    }

    /**
     * @throws Framework\Mvc\Request\WrongRequestMethodException
     */
    private function getEmails(): array
    {
        return explode(
            self::EMAIL_DELIMITER,
            $this->httpRequest->post('to')
        );
    }
}
