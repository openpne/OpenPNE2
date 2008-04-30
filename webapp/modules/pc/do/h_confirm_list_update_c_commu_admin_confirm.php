<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュ管理者交代承認
 */
class pc_do_h_confirm_list_update_c_commu_admin_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $target_c_commu_admin_confirm_id = $requests['target_c_commu_admin_confirm_id'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者交代を受けているメンバー

        $admin_confirm = db_c_commu_admin_confirm4c_commu_admin_confirm_id($target_c_commu_admin_confirm_id);

        if ($admin_confirm['c_member_id_to'] != $u) {
            handle_kengen_error();
        }
        // -----

        //副管理者なら副管理者から昇格
        if (db_commu_is_c_commu_sub_admin($admin_confirm['c_commu_id'], $u)) {
            db_commu_update_c_commu_c_member_id_sub_admin($admin_confirm['c_commu_id'], 0);
        }

        db_commu_delete_c_commu_sub_admin_confirm4c_commu_id($admin_confirm['c_commu_id']);
        db_commu_update_c_commu_c_member_id_admin($admin_confirm['c_commu_id'], $u);

        $msg = '承認が完了しました';
        $p = array('msg' => $msg);
        openpne_redirect('pc', 'page_h_confirm_list', $p);
    }
}

?>
