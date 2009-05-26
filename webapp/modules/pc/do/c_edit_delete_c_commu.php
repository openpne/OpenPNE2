<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティの削除
 */
class pc_do_c_edit_delete_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        //コミュニティ副管理者でない

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }

        if ($status['is_commu_sub_admin']) {
            handle_kengen_error();
        }
        //---

        db_common_delete_c_commu($target_c_commu_id);
        openpne_redirect('pc', 'page_h_com_find_all');
    }
}

?>
