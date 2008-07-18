<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_member_review_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------
        $page_size = 30;
        $c_member_id= $u;

        //--- 権限チェック
        //コミュニティメンバー
        if (!db_commu_is_c_commu_member($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $this->set('c_member', db_member_c_member4c_member_id($c_member_id));

        list($c_review_list, $is_prev, $is_next, $total_num, $start_num, $end_num) = db_review_list_product_c_review_list4c_member_id($c_member_id, $page, $page_size);
        $this->set('c_review_list', $c_review_list);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);
        $this->set('c_commu', $c_commu);

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));
        return 'success';
    }
}

?>
