<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_invite_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (!IS_USER_INVITE) {
            openpne_forward('pc', 'page', 'h_err_invite');
            exit;
        }

        // --- リクエスト変数
        $form_val = $requests;
        // ----------

        $msg = "";
        if(count($_POST)>0){
            if(!(isset($_SESSION['captcha_keystring']) && $_SESSION['captcha_keystring'] ==  $form_val['captcha'])){
                $msg = "確認キーワードが誤ってぁE��ぁE;
            }
        }
        unset($_SESSION['captcha_keystring']);
        if (!db_common_is_mailaddress($form_val['mail'])) {
            $msg = "メールアドレスを正しく入力してください";
        } elseif (p_is_sns_join4mail_address($form_val['mail'])) {
            $msg = "そ�Eアドレスは既に登録済みでぁE;
        } else {
            if(is_ktai_mail_address($form_val['mail'])) {
                //<PCKTAI
                if (defined('OPENPNE_REGIST_FROM') &&
                        !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
                    $msg = "携帯アドレスには招征E��送ることができません";
                }
                //>
            } else {
                //<PCKTAI
                if (defined('OPENPNE_REGIST_FROM') &&
                        !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
                    $msg = "PCアドレスには招征E��送ることができません";
                }
                //>
            }
        }

        if ($msg) {
            $_REQUEST['msg'] = $msg;
            openpne_forward('pc', 'page', "h_invite");
            exit;
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        $this->set('form_val', $form_val);
        $this->set('SNS_NAME', SNS_NAME);

        return 'success';
    }
}

?>
