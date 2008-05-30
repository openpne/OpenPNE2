<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_login2_change_mail extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $sid = $requests['sid'];
        $password = $requests['password'];
        // ----------

        //--- 権限チェック
        //セッションが正しい
        //パスワードが正しい

        // メールアドレスが登録できるかどうか
        $c_pc_address_pre = do_common_c_pc_address_pre4sid($sid);
        if (!util_is_regist_mail_address($c_pc_address_pre['pc_address'], $c_pc_address_pre['c_member_id'])) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        if (!db_member_change_mail($sid, $password)) {
            $msg = "パスワードが違います";
            $p = array('sid' => $sid, 'msg' => $msg);
            openpne_redirect('pc', 'page_o_login2', $p);
        }
        //---

        $p = array('msg_code' => 'change_mailaddress');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
