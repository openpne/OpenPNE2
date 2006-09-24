<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
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
        $page = $page + $direc;
        $this->set('page', $page);

        $list = biz_getGroupList($keyword, $page, $page_size);

        $this->set('c_commu_search_list', $list);
        $this->set('start_num', $page);
        $this->set('end_num', ($page+$page_size));
        $this->set('total_num', count($list));

        $this->set('keyword', $keyword);


        return 'success';
    }
}

?>
