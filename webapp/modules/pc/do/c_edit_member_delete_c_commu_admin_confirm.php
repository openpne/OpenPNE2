<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ管理者交代要請を取り消し
 */
class pc_do_c_edit_member_delete_c_commu_admin_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_admin_confirm_id = $requests['target_c_commu_admin_confirm_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        //コミュニティ副管理者ではない

        $c_commu_admin_confirm = db_c_commu_admin_confirm4c_commu_admin_confirm_id($target_c_commu_admin_confirm_id);
        $target_c_commu_id = $c_commu_admin_confirm['c_commu_id'];

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        if ($status['is_commu_sub_admin']) {
            handle_kengen_error();
        }
        //---


        db_commu_delete_c_commu_admin_confirm4id($target_c_commu_admin_confirm_id);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_edit_member', $p);
    }
}

?>
