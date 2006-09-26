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
            $is_friend = db_friend_is_friend($u, $target_c_member_id);

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
            $list_set = $this->_p_fh_diary_list_diary_list_date4c_member_id($target_c_member_id, $is_friend, $type, $year, $month, $day);
            $rss_list = p_fh_diary_list_c_rss_cache_list_date($target_c_member_id, $year, $month, $day);
        } else {
            $year = date('Y');
            $month = date('n');
            $this->set('all', 1);

            $list_set = $this->_p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $is_friend, $type, $page_size, $page);
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


    /**
     * あるメンバーの指定された年月日の日記のリストを得る
     * 日記公開範囲を考慮
     */

    function _p_fh_diary_list_diary_list_date4c_member_id($c_member_id, $is_friend, $type, $year, $month, $day=0)
    {

        if ($type == 'h') {
            return p_fh_diary_list_diary_list_date4c_member_id($c_member_id, $year, $month, $day);
        }

        if ($day) {
            $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day, $year));
            $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day+1, $year));
        } else {
            $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, 1, $year));
            $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month+1, 1, $year));
        }

        $sql = 'SELECT c_diary.* FROM c_diary INNER JOIN c_member USING (c_member_id)' .
               ' WHERE c_diary.c_member_id = ? AND c_diary.r_datetime >= ? AND c_diary.r_datetime < ?' ;


        if ($is_friend) {
            $sql .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\') OR (c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\'))';
        } else {
            $sql .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\'))';
        }

        $sql .= ' ORDER BY c_diary.r_datetime DESC';

        $params = array(intval($c_member_id), $s_date, $e_date);
        $list = db_get_all($sql, $params);

        foreach ($list as $key => $c_diary) {
            $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
        }

        return array($list , false, false);
    }


    /**
     * あるメンバーの日記リストを取得
     * 日記公開範囲を考慮
     * 
     * @param int $c_member_id
     * @param int $page_size
     * @param int $page
     * @return array 日記リスト
     */
    function _p_fh_diary_list_diary_list4c_member_id($c_member_id, $is_friend, $type, $page_size, $page)
    {
        if ($type == 'h') {
            return p_fh_diary_list_diary_list4c_member_id($c_member_id, $page_size, $page);
        }

        $sql   = 'SELECT c_diary.*';
        $from  = ' FROM c_diary INNER JOIN c_member USING (c_member_id)';
        $where = ' WHERE c_diary.c_member_id = ?' ;
        $order = ' ORDER BY c_diary.r_datetime DESC';


        if ($is_friend) {
            $where .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\') OR (c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\'))';
        } else {
            $where .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\'))';
        }

        $sql .= $from . $where . $order;

        $params = array(intval($c_member_id));
        $list = db_get_all_page($sql, $page, $page_size, $params);

        foreach ($list as $key => $c_diary) {
            $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
        }

        $sql = 'SELECT COUNT(c_diary.*)' . $from . $where . $order;
        $total_num = db_get_one($sql, $params);

        if ($total_num != 0) {
            $total_page_num =  ceil($total_num / $page_size);
            if ($page >= $total_page_num) {
                $next = false;
            } else {
                $next = true;
            }

            if ($page <= 1) {
                $prev = false;
            } else {
                $prev = true;
            }
        }
        return array($list, $prev, $next);
    }


}

?>
