<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_password_query_update_password_query extends OpenPNE_Action
{
    function execute($requests)
    {
        // 外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        if (!IS_PASSWORD_QUERY_ANSWER) {
            handle_kengen_error();
        }

        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $password = $requests['password'];
        // ----------

        //--- 権限チェック
        // 必要なし

        //---

        // 現在のパスワードが正しいか
        if (!db_common_authenticate_password($u, $password, true)) {
            $p = array('msg' => 18);
            openpne_redirect('ktai', 'page_h_config_password_query', $p);
        }

        if (!$requests['c_password_query_id']) {
            $p = array('msg' => 22);
            openpne_redirect('ktai', 'page_h_config_password_query', $p);
        }
        if (!$requests['password_query_answer']) {
            $p = array('msg' => 23);
            openpne_redirect('ktai', 'page_h_config_password_query', $p);
        }

        db_member_update_password_query($u, $requests['c_password_query_id'], $requests['password_query_answer']);

        $p = array('msg' => 24);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
