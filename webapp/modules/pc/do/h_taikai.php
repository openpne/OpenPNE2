<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 退会する
 */
class pc_do_h_taikai extends OpenPNE_Action
{
    function execute($requests)
    {
        $password = $requests['password'];
        $reason = $requests['reason'];
        $u = $GLOBALS['AUTH']->uid();

        if ($u == 1) {
            openpne_redirect('pc', 'page_h_config');
        }

        //退会理由は必須
        if (!$reason) {
            $msg = "退会理由を入力して下さい";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_taikai_confirm', $p);
        }

        if (!db_common_authenticate_password($u, $password)) {
            $msg = "パスワードが間違っています";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_taikai_confirm', $p);
        }

        //退会完了メール送信
        do_common_send_mail_taikai_end_pc($u);

        if (SEND_USER_DATA) {
            //退会完了メール送信(管理者宛)
            do_common_send_mail_taikai4admin($u, $reason);
        }

        //退会処理
        db_common_delete_c_member($u);

        //ログアウト
        $GLOBALS['AUTH']->logout();
        $p = array('msg_code' => 'taikai');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
