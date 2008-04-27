<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_f_com_list_common extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        // ----------

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        // メンバー情報
        $this->set("target_c_member", db_member_c_member4c_member_id_LIGHT($target_c_member_id));

        // 参加コミュニティリスト
        $page_size = 10;

        list($list, $pager) = db_common_commu_common_commu_list4c_member_id($target_c_member_id, $u, $page, $page_size);

        $this->set("common_commu_list", $list);
        $this->set("page", $page);
        $this->set("is_prev", $pager[prev_page]);
        $this->set("is_next", $pager[next_page]);
        $this->set('start_num', $pager['start_num']);
        $this->set('end_num', $pager['end_num']);

        // 共通コミュニティ数
        $this->set("common_commu_count", $pager[total_num]);

        return 'success';
    }
}

?>
