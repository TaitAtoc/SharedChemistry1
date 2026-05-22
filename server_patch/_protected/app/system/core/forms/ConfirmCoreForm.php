<?php
/**
 * SharedChemistry confirmation popup styling override.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PFBC\Element\Button;
use PFBC\Element\Hidden;
use PFBC\Element\HTMLExternal;
use PFBC\Element\Token;
use PH7\Framework\Mvc\Router\Uri;

class ConfirmCoreForm
{
    /**
     * @param array $aParam The parameters
     *
     * @return void
     */
    public static function display(array $aParam)
    {
        $sUrl = Uri::get($aParam['module'], $aParam['controller'], $aParam['action']);

        $oForm = new \PFBC\Form('form_confirm');
        $oForm->configure(['action' => $sUrl]);
        $oForm->addElement(new Hidden('submit_confirm', 'form_confirm'));
        $oForm->addElement(new Token(substr($sUrl, -14, -6)));
        $oForm->addElement(new Hidden('id', $aParam['id']));
        $oForm->addElement(
            new HTMLExternal(
                '<style>
                    /* SC_CONFIRM_POPUP_SHARED_STYLE_V1_ACTIVE */
                    html,
                    body {
                        min-height: 100%;
                        margin: 0;
                        background: #100b10;
                        color: #fff8ef;
                        font-family: Arial, Helvetica, sans-serif;
                    }

                    body {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 24px;
                    }

                    body > .center {
                        width: min(100%, 680px);
                        margin: 0 auto;
                        text-align: left;
                    }

                    .sc-confirm-page,
                    #form_confirm {
                        box-sizing: border-box;
                    }

                    .sc-confirm-page {
                        width: 100%;
                    }

                    #form_confirm {
                        width: 100%;
                        max-width: 620px;
                        margin: 0 auto;
                        padding: 32px;
                        border: 1px solid rgba(233, 187, 99, .24);
                        border-radius: 8px;
                        background:
                            radial-gradient(circle at top left, rgba(224, 88, 121, .22), transparent 34%),
                            linear-gradient(135deg, rgba(233, 187, 99, .12), rgba(22, 17, 23, .98) 58%, rgba(10, 8, 12, .98));
                        box-shadow: 0 24px 80px rgba(0, 0, 0, .44);
                    }

                    .sc-confirm-card {
                        width: 100%;
                    }

                    #form_confirm h2 {
                        margin: 0;
                        color: #fff8ef;
                        font-size: 30px;
                        font-weight: 800;
                        line-height: 1.18;
                        letter-spacing: 0;
                    }

                    #form_confirm p,
                    #form_confirm .err_msg {
                        margin: 14px 0 0;
                        color: #f0e8df !important;
                        font-size: 16px;
                        line-height: 1.65;
                    }

                    #form_confirm .pfbc-buttons,
                    #form_confirm .buttons,
                    #form_confirm .form-actions,
                    #form_confirm .sc-confirm-actions,
                    #form_confirm p:last-child {
                        display: flex;
                        flex-wrap: wrap;
                        align-items: center;
                        justify-content: flex-start;
                        gap: 12px;
                        margin-top: 26px;
                        text-align: left;
                    }

                    #form_confirm button,
                    #form_confirm input[type="submit"],
                    #form_confirm input[type="button"],
                    #form_confirm input[type="reset"] {
                        display: inline-flex;
                        min-height: 42px;
                        align-items: center;
                        justify-content: center;
                        margin: 0 10px 0 0;
                        padding: 10px 16px;
                        border-radius: 8px;
                        border: 1px solid rgba(236, 47, 145, .72);
                        background: #ec2f91;
                        color: #fff8ef;
                        font-size: 14px;
                        font-weight: 900;
                        line-height: 1.2;
                        cursor: pointer;
                        box-shadow: 0 12px 28px rgba(236, 47, 145, .22);
                    }

                    #form_confirm button[type="button"],
                    #form_confirm input[type="button"],
                    #form_confirm button[name="cancel"],
                    #form_confirm input[name="cancel"] {
                        border-color: rgba(233, 187, 99, .34);
                        background: rgba(0, 0, 0, .26);
                        color: #fff8ef;
                        box-shadow: none;
                    }

                    @media (max-width: 560px) {
                        body {
                            padding: 14px;
                        }

                        .sc-confirm-card,
                        #form_confirm {
                            padding: 24px;
                        }

                        #form_confirm h2 {
                            font-size: 24px;
                        }
                    }
                </style>
                <div class="sc-confirm-page">
                    <div class="sc-confirm-card">
                        <h2>' . t('Are you sure you want to do this?') . '</h2>
                        <p>' . t('This action cannot be undone.') . '</p>
                    </div>
                    <div class="sc-confirm-actions">'
            )
        );
        $oForm->addElement(new Button($aParam['label'], 'submit'));
        $oForm->addElement(
            new Button(
                t('Cancel'),
                'cancel',
                [
                    'onclick' => '$("form").attr("action", "");parent.$.colorbox.close();return false',
                    'icon' => 'cancel'
                ]
            )
        );
        $oForm->addElement(new HTMLExternal('</div></div>'));
        $oForm->render();
    }
}
