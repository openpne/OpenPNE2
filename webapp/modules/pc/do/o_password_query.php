<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_password_query extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(false);

        // --- リクエスト変数
        $pc_address = $requests['pc_address'];
        $q_id = $requests['c_password_query_id'];
        $q_answer = $requests['c_password_query_answer'];
        // ----------

        //--- 権限チェック
        //パスワード確認の質問と答えがあっている
        if (IS_PASSWORD_QUERY_ANSWER) {
            if (!$pc_address || !$q_id || !$q_answer ||
                !$c_member_id = db_member_is_password_query_complete($pc_address, $q_id, $q_answer)
               ) {
                $msg = '正しい値を入力してください';
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_o_password_query', $p);
            }
        } else {
            if (!$pc_address || !$c_member_id = db_member_c_member_id4pc_address($pc_address)) {
                $msg = '登録したメールアドレスを入力してください';
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_o_password_query', $p);
            }
        }
        //---

        // パスワード再発行
        $new_password = do_common_create_password();
        db_member_update_password($c_member_id, $new_password);
        do_password_query_mail_send($c_member_id, $pc_address, $new_password);

        $p = array('msg_code' => 'password_query');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
