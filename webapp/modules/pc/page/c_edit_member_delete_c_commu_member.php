<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_edit_member_delete_c_commu_member extends OpenPNE_Action
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
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        // 削除対象がコミュニティ管理者
        if (db_commu_is_c_commu_admin($target_c_commu_id, $target_c_member_id)) {
            handle_kengen_error();
        }


        $this->set('inc_navi', fetch_inc_navi("c", $target_c_commu_id));

        $member = db_member_c_member_with_profile($target_c_member_id);
        $member['last_login'] = p_f_home_last_login4access_date($member['access_date']);

        $this->set("member", $member);
        $this->set("c_commu", db_commu_c_commu4c_commu_id($target_c_commu_id));

        return 'success';
    }
}

?>
