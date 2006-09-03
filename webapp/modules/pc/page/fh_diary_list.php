<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_diary_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        $year = $requests['year'];
        $month = $requests['month'];
        $day = $requests['day'];
        // ----------

        if (!$target_c_member_id) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
            $is_diary_admin = true;
        } else {
            $type = 'f';
            $is_diary_admin = false;
            $target_c_member = db_common_c_member4c_member_id($target_c_member_id);

            //日記の公開範囲設定
            if (   $target_c_member['public_flag_diary'] == 'friend'
                && !db_friend_is_friend($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_err_diary_access');
            }

            // アクセスブロック
            if (p_common_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }

            //あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $this->set('type', $type);

        $page += $direc;
        $page_size = 30;

        $target_member = db_common_c_member4c_member_id($target_c_member_id);
        $this->set('target_member', $target_member);
        //年月日で一覧表示、日記数に制限なし
        if ($year && $month) {
            $list_set = p_fh_diary_list_diary_list_date4c_member_id($target_c_member_id, $year, $month, $day);
            $rss_list = p_fh_diary_list_c_rss_cache_list_date($target_c_member_id, $year, $month, $day);
        } else {
            $year = date('Y');
            $month = date('n');
            $this->set('all', 1);

            $list_set = p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $page_size, $page);
            $rss_list = p_fh_diary_list_c_rss_cache_list($target_c_member_id, $page_size, $page);
        }

        $this->set('c_rss_cache_list', $rss_list);

        $this->set('target_diary_list', $list_set[0]);
        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $list_set[1]);
        $this->set('is_next', $list_set[2]);

        $this->set('diary_list_count', count($list_set[0]));

        //日記一覧、カレンダー用変数
        $date_val = array(
            'year'  => $year,
            'month' => $month,
            'day'   => $day,
        );
        $this->set('date_val', $date_val);

        //日記のカレンダー
        $calendar = db_common_diary_monthly_calendar($year, $month, $target_c_member_id);

        $this->set('calendar', $calendar['days']);
        $this->set('ym', $calendar['ym']);

        //各月の日記
        $this->set('date_list', p_fh_diary_list_date_list4c_member_id($target_c_member_id));

        return 'success';
    }
}

?>
