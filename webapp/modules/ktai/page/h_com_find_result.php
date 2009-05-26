<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_com_find_result extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $search_word = $requests['search_word'];
        $target_c_commu_category_id = $requests['target_c_commu_category_id'];
        $page = $requests['page'];
        // ----------

        //search log
        do_common_insert_search_log($u, $search_word);

        $page_size = 10;

        //ページ
        $this->set("page", $page);

        //search_word
        $this->set("search_word", $search_word);

        //検索に用いたカテゴリ
        $this->set("target_c_commu_category_id", $target_c_commu_category_id);

        //カテゴリのリスト
        $this->set("c_commu_category_list", db_commu_c_commu_category4null());

        //検索結果
        $list = db_commu_c_commu_list4c_commu_category_id_search($target_c_commu_category_id, $page_size, $page, $search_word);

        $this->set("c_commu_search_result", $list[0]);
        $this->set("count_total", $list[3]);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);

        return 'success';
    }
}

?>
