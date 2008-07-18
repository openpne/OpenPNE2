<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_o_password_query extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        //--- 権限チェック
        //パスワード確認の質問と答えがあっている

        if (!$c_member_id = db_member_is_password_query_complete2(
                        $requests['ktai_address'],
                        $requests['c_password_query_id'],
                        $requests['password_query_answer'])) {
            $p = array('msg' => 25);
            openpne_redirect('ktai', 'page_o_password_query', $p);
        }
        //---

        // パスワード再発行
        $new_password = do_common_create_password();
        db_member_update_password($c_member_id, $new_password);

        db_mail_send_m_ktai_password_query($c_member_id, $new_password);

        $p = array('msg' => 26);
        openpne_redirect('ktai', 'page_o_login', $p);
    }
}

?>
