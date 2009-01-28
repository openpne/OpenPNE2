<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * フレンドへの紹介文を削除
 */
class ktai_do_f_intro_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //--- 権限チェック
        //フレンド

        $status = db_friend_status($u, $target_c_member_id);
        if (!$status['is_friend']) {
            handle_kengen_error();
        }
        //---

        db_friend_update_c_friend_intro($u, $target_c_member_id, '');

        $p = array('target_c_member_id' => $target_c_member_id);
        openpne_redirect('ktai', 'page_f_home', $p);
    }
}

?>
