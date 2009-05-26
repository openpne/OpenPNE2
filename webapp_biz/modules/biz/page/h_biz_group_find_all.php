<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_h_biz_group_find_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $keyword = $requests['keyword'];
        $page = $requests['page'];
        // ----------

        //バグ回避のため半角空白を全角に統一
        $keyword = str_replace(" ", "　", $keyword);

        do_common_insert_search_log($u, $keyword);

        $this->set('inc_navi',fetch_inc_navi("h"));

        $page_size = 20;
        $this->set('page', $page);
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = biz_getGroupList($keyword, $page, $page_size);

        $this->set('c_commu_search_list', $result);
        $this->set('is_prev', $is_prev);
        $this->set('is_next', $is_next);
        $this->set('total_num', $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        $this->set('keyword', $keyword);


        return 'success';
    }
}

?>
