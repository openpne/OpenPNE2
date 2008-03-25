<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_ktai_address_confirm extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        $sid = $requests['sid'];
        $ktai_address = $requests['ktai_address'];
        $ktai_address = str_replace('"', '', $ktai_address);

        if (!db_member_is_active_sid($sid)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        //携帯メールアドレスチェック
        if (!db_common_is_mailaddress($ktai_address)) {
            $msg = "メールアドレスを正しく入力してください";
        } elseif (db_member_is_sns_join4mail_address($ktai_address, 0, true)) {
            $msg = "そのメールアドレスは既に登録済みです";
        } elseif (!is_ktai_mail_address($ktai_address)) {
            $msg = "携帯メールアドレスを入力してください";
        }

        if (!empty($msg)) {
            $p = array('msg' => $msg, 'sid' => $sid, 'ktai_address' => $ktai_address);
            openpne_redirect('pc', 'page_o_regist_ktai_address', $p);
        }

        $pre = db_member_c_member_pre4sid($sid);

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('regist'));

        $this->set('ktai_address', $ktai_address);
        $this->set('sid', $sid);

        return 'success';
    }
}

?>
