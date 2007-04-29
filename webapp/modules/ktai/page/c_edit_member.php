<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        if ($c_commu['c_member_id_admin'] !=$u && $c_commu['c_member_id_sub_admin'] != $u) {
            ktai_display_error('閲覧権限がありません');
        }
        //---

        $page_size = 20;
        $page += $direc;

        //ページ
        $this->set("page", $page);

        //メンバーリスト
        $list = k_p_c_member_list_c_members_disp4c_commu_id($target_c_commu_id, $page_size, $page);
        $this->set("c_member_list", $list[0]);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        //コミュニティのメンバー数
        $this->set("count_member", db_commu_count_c_commu_member_list4c_commu_id($target_c_commu_id));

        $this->set("c_commu", $c_commu);
        return 'success';
    }
}

?>
