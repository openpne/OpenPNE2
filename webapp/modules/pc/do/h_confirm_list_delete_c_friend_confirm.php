<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * リンク拒否
 */
class pc_do_h_confirm_list_delete_c_friend_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_friend_confirm_id = $requests['target_c_friend_confirm_id'];
        // ----------

        //--- 権限チェック
        //リンク承認を送った人 or 受けた人

        $cfc = db_friend_c_friend_confirm4c_friend_confirm_id($target_c_friend_confirm_id);

        if ($cfc['c_member_id_to'] != $u
            && $cfc['c_member_id_from'] != $u) {
            handle_kengen_error();
        }
        //---


        db_friend_delete_c_friend_confirm($target_c_friend_confirm_id, $u);

        $msg = '承認依頼を削除しました';
        $p = array('msg' => $msg);
        openpne_redirect('pc', 'page_h_confirm_list', $p);
    }
}

?>
