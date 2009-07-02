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

        // --- リクエスト変数
        $ktai_address = $requests['ktai_address'];
        $q_id = $requests['c_password_query_id'];
        $q_answer = $requests['password_query_answer'];
        // ----------

        if (!$ktai_address) {
            $p = array('msg' => 25);
            openpne_redirect('ktai', 'page_o_password_query', $p);
        }
        if (!is_ktai_mail_address($ktai_address)) {
            $p = array('msg' => 31);
            openpne_redirect('ktai', 'page_o_password_query', $p);
        }
        if (IS_PASSWORD_QUERY_ANSWER) {
            if (!$q_id) {
                $p = array('msg' => 22);
                openpne_redirect('ktai', 'page_o_password_query', $p);
            }
            if (is_null($q_answer) || $q_answer === '') {
                $p = array('msg' => 23);
                openpne_redirect('ktai', 'page_o_password_query', $p);
            }
        }

        //--- 権限チェック
        if (IS_PASSWORD_QUERY_ANSWER) {
            $c_member_id = db_member_is_password_query_complete2($ktai_address, $q_id, $q_answer);
            if (!$c_member_id) {
                $p = array('msg' => 25);
                openpne_redirect('ktai', 'page_o_password_query', $p);
            }
        } else {
            $c_member_id = db_member_c_member_id4ktai_address($ktai_address);
            // メールアドレスが一致しない場合でも正常に完了した時と同じ画面にする
            if (!$c_member_id) {
                $p = array('msg' => 26);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
        }
        //---

        // パスワード再発行
        $session = create_hash();
        db_member_update_c_member_config($c_member_id, 'password_reset_sid', $session);
        db_member_update_c_member_config($c_member_id, 'password_reset_sid_time', time());

        db_mail_send_m_ktai_password_reset_query($c_member_id, $session);

        $p = array('msg' => 26);
        openpne_redirect('ktai', 'page_o_login', $p);
    }
}

?>
