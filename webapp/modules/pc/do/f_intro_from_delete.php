<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * フレンド紹介文削除
 */
class pc_do_f_intro_from_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //-- 権限チェック
        //フレンド

        $status = db_friend_status($u, $target_c_member_id);
        if (!$status['is_friend']) {
            handle_kengen_error();
        }
        //---

        db_friend_update_c_friend_intro($target_c_member_id, $u, "");

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
