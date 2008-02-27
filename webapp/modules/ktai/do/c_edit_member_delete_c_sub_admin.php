<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ副管理者から降格
 */
class ktai_do_c_edit_member_delete_c_sub_admin extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //--- 権限チェック
        // 自分がコミュニティ管理者
        // 自分がコミュニティ副管理者でない
        // targetがコミュニティメンバー
        // targetが副管理者

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        if ($status['is_commu_sub_admin']) {
            handle_kengen_error();
        }

        $status = db_common_commu_status($target_c_member_id, $target_c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        if (!$status['is_commu_sub_admin']) {
            handle_kengen_error();
        }
        //---

        db_commu_update_c_commu_c_member_id_sub_admin($target_c_commu_id, 0);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('ktai', 'page_c_edit_member', $p);
    }
}
?>
