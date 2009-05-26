<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_member_review extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        // ----------
        $page_size=20;

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));
        list($c_member_review, $is_prev, $is_next, $total_num, $start_num, $end_num)
             = db_review_c_member_review_c_member_review4c_commu_id($c_commu_id, $page, $page_size);
        $this->set('c_member_review', $c_member_review);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);
        $this->set('c_commu', $c_commu);
        $this->set("is_c_commu_member", db_commu_is_c_commu_member($c_commu_id, $u));

        return 'success';
    }
}

?>
