<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_search extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $keyword = $requests['keyword'];
        $category = $requests['category'];
        $orderby = $requests['orderby'];
        $page = $requests['page'];
        // ----------
        $page_size=20;

        $this->set('inc_navi', fetch_inc_navi("h"));
        $this->set('category_disp', do_review_review_add_category_disp());
        $this->set('category', $category);
        $this->set('keyword', $keyword);
        $this->set('orderby', $orderby);

        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
             = db_review_search_result4keyword_category($keyword, $category, $orderby, $page, $page_size);
        $this->set('result', $result);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        return 'success';
    }
}

?>
