<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メンバーをコミュニティからの削除
 */
class pc_do_c_edit_member_delete_c_commu_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        //targetメンバーが管理者(＝自分)でない

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }

        if ($target_c_member_id == $u) {
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_taikai_err_admin', $p);
        }

        // 削除対象がコミュニティ管理者
        if (db_commu_is_c_commu_admin($target_c_commu_id, $target_c_member_id)) {
            handle_kengen_error();
        }
        //---

        db_commu_delete_c_commu_member($target_c_commu_id, $target_c_member_id);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_edit_member', $p);
    }
}

?>
