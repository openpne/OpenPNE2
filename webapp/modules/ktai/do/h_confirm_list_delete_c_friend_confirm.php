<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * リンク拒否
 */
class ktai_do_h_confirm_list_delete_c_friend_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_friend_confirm_id = $requests['target_c_friend_confirm_id'];
        // ----------

        //--- 権限チェック
        //リンク承認を受けている or 送った人

        $cfc = db_friend_c_friend_confirm4c_friend_confirm_id($target_c_friend_confirm_id);

        if ($cfc['c_member_id_to'] != $u
            && $cfc['c_member_id_from'] != $u) {
            handle_kengen_error();
        }
        //---

        db_friend_delete_c_friend_confirm($target_c_friend_confirm_id, $u);

        $p = array('msg' => 4);
        openpne_redirect('ktai', 'page_h_confirm_list', $p);
    }
}

?>
