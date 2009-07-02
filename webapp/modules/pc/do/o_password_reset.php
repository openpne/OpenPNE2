<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * パスワード再設定
 */
class pc_do_o_password_reset extends OpenPNE_Action
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
        $session = $requests['session'];
        $id = $requests['id'];
        $new_password = $requests['new_password'];
        $new_password2 = $requests['new_password2'];
        // ----------

        // ハッシュ化されたIDを戻す
        $c_member_id = t_decrypt($id);

        // 権限チェック
        if (!db_member_c_member_config4name($c_member_id, 'password_reset_sid')) {
            handle_kengen_error();
        }
        if (!db_member_c_member_config4name($c_member_id, 'password_reset_sid_time')) {
            handle_kengen_error();
        }

        $c_member_config = db_member_c_member_config4c_member_id($c_member_id);

        // 権限チェック
        if ($c_member_config['password_reset_sid'] != $session) {
            handle_kengen_error();
        }

        // 有効期限は24時間
        $one_day_time = 86400;
        $limit_password_reset_sid_time
            = $c_member_config['password_reset_sid_time'] + $one_day_time;

        // 権限チェック
        if (time() > $limit_password_reset_sid_time) {
            $p = array('msg_code' => 'password_reset_timeout');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $msg_list = array();
        if (!$new_password) $msg_list[] = "パスワードを入力してください";
        if (!$new_password2) $msg_list[] = "パスワード(確認)を入力してください";

        if ($new_password !== $new_password2) $msg_list[] = "パスワードが一致しません";
        if (!ctype_alnum($new_password) ||
            strlen($new_password) < 6 ||
            strlen($new_password) > 12) {
            $msg_list[] = "パスワードは6～12文字の半角英数で入力してください";
        }

        // error
        if ($msg_list) {
            $p = array('msg' => array_shift($msg_list), 'session' => $session, 'id' => $id);
            openpne_redirect('pc', 'page_o_password_reset', $p);
            exit;
        }

        db_member_update_password($c_member_id, $new_password);
        db_member_delete_c_member_config($c_member_id, 'password_reset_sid_time');
        db_member_delete_c_member_config($c_member_id, 'password_reset_sid');

        $p = array('msg_code' => 'change_password');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
