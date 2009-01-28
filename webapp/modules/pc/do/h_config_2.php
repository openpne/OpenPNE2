<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * パスワード変更
 */
class pc_do_h_config_2 extends OpenPNE_Action
{
    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(false);

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $old_password = $requests['old_password'];
        $new_password = $requests['new_password'];
        $new_password2 = $requests['new_password2'];
        // ----------

        $msg_list = array();
        if (!$new_password) $msg_list[] = "パスワードを入力してください";
        if (!$new_password2) $msg_list[] = "パスワード(確認)を入力してください";

        if ($new_password !== $new_password2) $msg_list[] = "パスワードが一致しません";
        if (!ctype_alnum($new_password) ||
            strlen($new_password) < 6 ||
            strlen($new_password) > 12) {
            $msg_list[] = "パスワードは6～12文字の半角英数で入力してください";
        }

        if (!$msg_list && !db_common_authenticate_password($u, $old_password)) {
            $msg_list[] = "現在のパスワードが違います";
        }

        // error
        if ($msg_list) {
            $_REQUEST['msg'] = array_shift($msg_list);
            openpne_forward('pc', 'page', "h_config");
            exit;
        }

        db_member_update_password($u, $new_password);

        $GLOBALS['AUTH']->logout();

        $p = array('msg_code' => 'change_password');
        openpne_redirect('pc', 'page_o_tologin', $p);
    }
}

?>
