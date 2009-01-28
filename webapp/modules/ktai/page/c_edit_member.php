<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        if ($c_commu['c_member_id_admin'] !=$u && $c_commu['c_member_id_sub_admin'] != $u) {
            ktai_display_error('閲覧権限がありません');
        }
        //---

        $page_size = 5;

        //ページ
        $this->set("page", $page);

        //メンバーリスト
        $list = db_commu_c_member_list4c_commu_id($target_c_commu_id, $page_size, $page);
        $total_num = $list[3];
        $c_member_list = $list[0];

        // 管理者交代メッセージ送信先メンバーリスト
        foreach ($c_member_list as $key => $c_member) {
            if ($c_member['c_member_id'] != $c_commu['c_member_id_admin']
                && $c_member['c_commu_admin_confirm_id'] <= 0
                && $c_member['c_commu_sub_admin_confirm_id'] <= 0) {
                $c_member_list[$key]['is_display_admin'] = true;
            } else {
                $c_member_list[$key]['is_display_admin'] = false;
            }
        }

        // 副管理者要請メッセージ送信先メンバーリスト
        foreach ($c_member_list as $key => $c_member) {
            if ($c_member['c_member_id'] != $c_commu['c_member_id_admin']  && $c_member['c_member_id'] != $c_commu['c_member_id_sub_admin']
                && $c_member['c_commu_admin_confirm_id'] <= 0
                && $c_member['c_commu_sub_admin_confirm_id'] <= 0) {
                $c_member_list[$key]['is_display_sub_admin'] = true;
            } else {
                $c_member_list[$key]['is_display_sub_admin'] = false;
            }
        }

        $this->set("c_member_list", $c_member_list);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        $pager = array();
        $pager['start'] = ($page_size * ($page - 1)) + 1;
        $pager['end'] = $pager['start'] + count($c_member_list) - 1;
        $this->set('pager', $pager);

        //コミュニティのメンバー数
        $this->set("count_member", db_commu_count_c_commu_member_list4c_commu_id($target_c_commu_id));

        $this->set("c_commu", $c_commu);
        return 'success';
    }
}

?>
