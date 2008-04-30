<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_diary_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $page = $requests['page'];
        $year = $requests['year'];
        $month = $requests['month'];
        $day = $requests['day'];
        $category_id = $requests['category_id'];
        $keyword = $requests['keyword'];
        // ----------

        if (!$target_c_member_id || !is_null($keyword)) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
            $is_diary_admin = true;
        } else {
            $type = 'f';
            $is_diary_admin = false;
            $target_c_member = db_member_c_member4c_member_id($target_c_member_id);
            $is_friend = db_friend_is_friend($u, $target_c_member_id);

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }

            //あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $this->set('type', $type);

        $page_size = 20;

        $target_member = db_member_c_member4c_member_id($target_c_member_id);
        $this->set('target_member', $target_member);
        //年月日で一覧表示、日記数に制限なし
        if ($year && $month) {
            $list_set = p_fh_diary_list_diary_list_date4c_member_id($target_c_member_id, $page_size, $page ,$year, $month, $day, $u);
            $rss_list = db_rss_list_c_rss_cache_list_date($target_c_member_id, $year, $month, $day);
        } elseif($category_id) {
            $year = date('Y');
            $month = date('n');
            $list_set = db_diary_list4c_diary_category_id($target_c_member_id, $category_id, $u, $page_size, $page);
            $this->set('category_name', db_diary_get_category_name4category_id($category_id));
            $this->set('category_id', $category_id);
        } else {
            $year = date('Y');
            $month = date('n');
            $this->set('all', 1);

            //検索する場合
            if ($keyword) {
                $list_set = p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page, $u);
            } else {
                $list_set = p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $page_size, $page, $u);
                $rss_list = db_rss_list_c_rss_cache_list($target_c_member_id, $page_size, $page);
            }
        }

        $this->set('c_rss_cache_list', $rss_list);

        $this->set('target_diary_list', $list_set[0]);
        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $list_set[1]);
        $this->set('is_next', $list_set[2]);
        $this->set("total_num", $list_set[3]);

        $this->set('diary_list_count', count($list_set[0]));

        //日記一覧、カレンダー用変数
        $date_val = array(
            'year'  => $year,
            'month' => $month,
            'day'   => $day,
        );
        $this->set('date_val', $date_val);

        //日記のカレンダー
        $calendar = db_common_diary_monthly_calendar($year, $month, $target_c_member_id, $u);

        $this->set('calendar', $calendar['days']);
        $this->set('ym', $calendar['ym']);

        //各月の日記
        $this->set('date_list', p_fh_diary_list_date_list4c_member_id($target_c_member_id));

        if (USE_DIARY_CATEGORY) {
            //カテゴリ一覧
            $this->set('category_list', db_diary_category_list4c_member_id($target_c_member_id));
        }

        //検索ワード
        $this->set('keyword', $keyword);
        $this->set("url_keyword", urlencode($keyword));

        return 'success';
    }
}

?>
