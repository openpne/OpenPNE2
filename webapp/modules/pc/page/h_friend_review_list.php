<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_friend_review_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        // ----------

        $page_size = 30;

        $this->set('inc_navi', fetch_inc_navi('h'));

        list($c_friend_review_list, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_review_c_friend_review_list_more4c_member_id($u, $page, $page_size);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);
        $this->set('c_friend_review_list', $c_friend_review_list);

        return 'success';
    }
}

?>
