<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_list_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));

        //日記一覧
        $page_size = 20;

        //検索結果
        $result = p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page);

        //$this->set('c_commu_search_list', test());
        $this->set('new_diary_list', $result[0]);
        $this->set('is_prev', $result[1]);
        $this->set('is_next', $result[2]);
        //検索に一致したコミュニティ数
        $this->set('c_diary_search_list_count', $result[3]);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $result[3]) {
            $pager['end'] = $result[3];
        }
        $this->set('page', $page);
        $this->set('pager', $pager);

        //バグ回避のため半角空白を全角に統一
        $keyword = str_replace(" ", "　", $keyword);

        $search_val_list = array('val_order'=> null, // $val_order,
                                 'search_word'=> null, // $search_word,
                                 'category_id'=> null, // $category_id,
                                 'c_commu_search_list_count'=>$result[3]);

        $this->set('keyword', $keyword);

        if (!$keyword) {
            // rss_cache
            $limit = 20;
            $this->set('c_rss_cache_list', db_rss_list_all_c_rss_cache_list($limit));
        }

        //---- ページ表示 ----//
        return 'success';
    }
}

?>
