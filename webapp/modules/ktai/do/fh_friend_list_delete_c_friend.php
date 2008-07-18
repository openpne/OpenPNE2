<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * フレンドリンクを削除
 */
class ktai_do_fh_friend_list_delete_c_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //--- 権限チェック
        //フレンド
        //フレンドでなくても特に影響はないのでチェックしない
        //---

        db_friend_delete_c_friend($u, $target_c_member_id);

        openpne_redirect('ktai', 'page_h_manage_friend');
    }
}

?>
