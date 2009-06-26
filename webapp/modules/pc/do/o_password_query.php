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

        if (OPENPNE_USE_CAPTCHA) {
            @session_start();
            if (empty($_SESSION['captcha']) || $_SESSION['captcha_keystring'] !== $requests['captcha']) {
                unset($_SESSION['captcha']);
                $p = array('msg' => "確認キーワードが誤っています");
                openpne_redirect('pc', 'page_o_password_query', $p);
            }
            unset($_SESSION['captcha']);
        }

        if (!$pc_address) {
            $p = array('msg' => "メールアドレスを入力してください");
            openpne_redirect('pc', 'page_o_password_query', $p);
        }
        if (IS_PASSWORD_QUERY_ANSWER) {
            if (!$q_id) {
                $p = array('msg' => "秘密の質問を選択してください");
                openpne_redirect('pc', 'page_o_password_query', $p);
            }
            if (!$q_answer) {
                $p = array('msg' => "秘密の質問の答えを入力してください");
                openpne_redirect('pc', 'page_o_password_query', $p);
            }
        }

        //--- 権限チェック
        if (IS_PASSWORD_QUERY_ANSWER) {
            $c_member_id = db_member_is_password_query_complete($pc_address, $q_id, $q_answer);
            $msg = '正しい値を入力してください';
            if (!$c_member_id) {
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_o_password_query', $p);
            }
        } else {
            $c_member_id = db_member_c_member_id4pc_address($pc_address);
            if (!$c_member_id) {
                $p = array('msg_code' => 'password_query');
                openpne_redirect('pc', 'page_o_tologin', $p);
            }
        }
        //---

        // パスワード再発行用のハッシュをDBに登録し再設定用のメールを送信
        $session = create_hash();
        db_member_update_c_member_config($c_member_id, 'update_password_ssid', $session);
        db_member_update_c_member_config($c_member_id, 'password_ssid_query_time', time());
        do_password_query_mail_send($c_member_id, $pc_address, $session);

        $p = array('is_send' => true);
        openpne_redirect('pc', 'page_o_password_query', $p);
    }
}

?>
