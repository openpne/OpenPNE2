<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュ参加拒否
 */
class pc_do_h_confirm_list_delete_c_commu_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $target_c_commu_member_confirm_id = $requests['target_c_commu_member_confirm_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ参加承認を受けた人 or 送った人

        $cmc = db_commu_c_commu_member_confirm4c_commu_member_confirm_id($target_c_commu_member_confirm_id);

        if ($cmc['c_member_id'] != $u
            && $cmc['c_member_id_admin'] != $u
            && $cmc['c_member_id_sub_admin'] != $u) {
            handle_kengen_error();
        }
        // -----


        db_commu_delete_c_commu_member_confirm($target_c_commu_member_confirm_id);

        $msg = '承認依頼を削除しました';
        $p = array('msg' => $msg);
        openpne_redirect('pc', 'page_h_confirm_list', $p);
    }
}

?>
