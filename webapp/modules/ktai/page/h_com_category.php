<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_com_category extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_category_id = $requests['target_c_commu_category_id'];
        $page = $requests['page'];
        $search_word = $requests['search_word'];
        // ----------

        $page_size = 10;

        //ページ
        $this->set("page", $page);

        $this->set("search_word", $search_word);

        //カテゴリ内のコミュニティリスト
        $list= db_commu_c_commu_list4c_commu_category_id_search($target_c_commu_category_id, $page_size, $page, $search_word);
        $this->set("c_commu_list", $list[0]);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);
        $this->set("count_total", $list[3]);

        //カテゴリ名
        $this->set("c_commu_category_name", db_commu_c_commu_category_name4c_commu_category_id($target_c_commu_category_id));
        //カテゴリID
        $this->set("c_commu_category_id", $target_c_commu_category_id);

        //parent
        $this->set("c_commu_category_parent_id", db_commu_c_commu_category_parent_id4c_commu_category_id($target_c_commu_category_id));

        return 'success';
    }
}

?>
