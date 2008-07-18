<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_password_update_password extends OpenPNE_Action
{
    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $old_password = $requests['old_password'];
        $new_password = $requests['new_password'];
        // ----------

        // 現在のパスワードが正しいか
        if (!db_common_authenticate_password($u, $old_password, true)) {
            $p = array('msg' => 18);
            openpne_redirect('ktai', 'page_h_config_password', $p);
        }

        // 新しいパスワードは有効な文字列か
        if (   !ctype_alnum($new_password)
            || (strlen($new_password) < 6)
            || (strlen($new_password) > 12)) {
            $p = array('msg' => 20);
            openpne_redirect('ktai', 'page_h_config_password', $p);
        }

        db_member_update_password($u, $new_password);

        $p = array('msg' => 21);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
