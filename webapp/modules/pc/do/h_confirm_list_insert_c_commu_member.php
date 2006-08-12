<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュ参加承認
 */
class pc_do_h_confirm_list_insert_c_commu_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_member_confirm_id = $requests['target_c_commu_member_confirm_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ参加承認を受けた人

        $cmc = _do_c_commu_member_confirm4c_commu_member_confirm_id($target_c_commu_member_confirm_id);

        if ($cmc['c_member_id_admin'] != $u) {
            handle_kengen_error();
        }
        // -----


        db_commu_insert_c_commu_member($target_c_commu_member_confirm_id);

        $msg = '承認が完了しました';
        $p = array('msg' => $msg);
        openpne_redirect('pc', 'page_h_confirm_list', $p);
    }
}

?>
