<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_com_find_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_category_parent_id = $requests['target_c_commu_category_parent_id'];
        $keyword = $requests['keyword'];
        $page = $requests['page'];
        $val_order = $requests['val_order'];
        $category_id = $requests['category_id'];
        // ----------

        //バグ回避のため全角空白を半角空白に統一
        $keyword = str_replace("　", " ", $keyword);

        do_common_insert_search_log($u, $keyword);

        $this->set('inc_navi', fetch_inc_navi('h'));

        $page_size = 20;
        $this->set('page', $page);

        //検索結果
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = db_commu_search_c_commu4c_commu_category(
                $keyword,
                $target_c_commu_category_parent_id,
                $page_size,
                $page,
                $val_order,
                $category_id);

        $this->set('c_commu_search_list', $result);
        $this->set('is_prev', $is_prev);
        $this->set('is_next', $is_next);
        $this->set('total_num', $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        $this->set('keyword', $keyword);
        $search_val_list = array(
            'val_order' => $val_order,
            'category_id' => $category_id,
        );
        $this->set('search_val_list', $search_val_list);

        $this->set('c_commu_category_list', db_commu_c_commu_category_list4null());
        $this->set('c_commu_category_parent_list', db_commu_c_commu_category_parent_list4null());
        $this->set('c_commu_category_is_create_commu', db_commu_c_commu_category4is_create_commu());

        // 作成可コミュニティの有無
        $c_commu_category4createflag_num = count(db_commu_c_commu_category4is_create_commu());
        $is_created_commu = ( $c_commu_category4createflag_num > 0 ) ? true : false;
        $this->set('is_created_commu', $is_created_commu);

        return 'success';
    }
}

?>
