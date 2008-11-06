<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $keyword = $requests['keyword'];
        $category_id = $requests['category_id'];
        $page = $requests['page'];
        $search_flag = $requests['search_flag'];
        // ----------
        $page_size = 10; //固定

        $this->set('inc_navi', fetch_inc_navi("h"));
        $this->set('category_disp', do_review_review_add_category_disp());
        $this->set('category_id', $category_id);
        $this->set('keyword', $keyword);

        if ($search_flag) {
            if (empty($keyword) || empty($category_id)) {
                if (empty($keyword)) $err_msg[] = 'キーワードを入力してください';
                if (empty($category_id)) $err_msg[] = 'カテゴリを選択してください';
            } else {
                list($search_result, $page, $pages, $total_num)
                    = do_review_add_search_result($keyword, $category_id, $page);
            }
        }

        $this->set('search_result', $search_result);
        $this->set('page', $page);
        $this->set('is_prev', (bool)($pages && $page > 1));
        $this->set('is_next', (bool)($pages && $page < $pages));
        $this->set('err_msg', $err_msg);

        $start_num = ($page - 1) * $page_size + 1;
        $end_num = $page * $page_size;
        if ($page_size > count($search_result)) {
            $end_num = ($page - 1) * $page_size + count($search_result);
        }

        $this->set('total_num', $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        return 'success';
    }
}

?>
