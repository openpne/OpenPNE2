<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $body = $requests['body'];
        // ----------

        // target が指定されていない
        if (!$target_c_diary_id) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }
        // target の日記が存在しない
        if (!p_common_is_active_c_diary_id($target_c_diary_id)) {
            openpne_redirect('pc', 'page_h_err_fh_diary');
        }


        $target_c_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $target_c_diary['c_member_id'];

        if ($target_c_member_id == $u) {
            $type = 'h';

            //日記を閲覧済みにする
            db_diary_update_c_diary_is_checked($target_c_diary_id, 1);

        } else {
            $type = 'f';
            $target_c_member = db_common_c_member4c_member_id($target_c_member_id);

            //友達までの公開かどうか
            $is_public_flag_friend = ($target_c_member['public_flag_diary'] == "friend" && $target_c_diary['public_flag'] == "default") || $target_c_diary['public_flag'] == "friend";
            //公開しないかどうか
            $is_public_flag_close = ($target_c_member['public_flag_diary'] == "close" && $target_c_diary['public_flag'] == "default") || $target_c_diary['public_flag'] == "close";

            $is_friend = db_friend_is_friend($u, $target_c_member_id);

            //日記の公開範囲設定
            if ($is_public_flag_friend && !$is_friend) {
                openpne_redirect('pc', 'page_h_err_diary_access');
            }

            if($is_public_flag_close)
            {
                openpne_redirect('pc', 'page_h_err_diary_access');
            }

            // アクセスブロック
            if (p_common_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }

            // あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }
        $this->set("type", $type);

        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));

        $this->set("member", db_common_c_member4c_member_id($u));

        $this->set("target_member", db_common_c_member4c_member_id($target_c_member_id));
        $this->set("target_diary", $target_c_diary);
        $this->set("target_diary_comment_list", db_diary_get_c_diary_comment_list4c_diary_id($target_c_diary_id));

        $this->set("body", $body);

        //最近の日記を取得
        $list_set = $this->_p_fh_diary_list_diary_list4c_member_id($target_c_member_id, $is_friend, $type, 7, 1);

        $this->set("new_diary_list", $list_set[0]);

        //カレンダー関係
        //カレンダー開始用変数
        $time = strtotime($target_c_diary['r_datetime']);
        $year = date('Y', $time);
        $month= date('n', $time);
        //日記一覧、カレンダー用変数
        $date_val = array(
            'year' => $year,
            'month' => $month,
            'day' => null,
        );
        $this->set("date_val", $date_val);

        //日記のカレンダー
        $calendar = db_common_diary_monthly_calendar($year, $month, $target_c_member_id);

        $this->set("calendar", $calendar['days']);
        $this->set("ym", $calendar['ym']);

        //各月の日記
        $this->set("date_list", p_fh_diary_list_date_list4c_member_id($target_c_member_id));

        return 'success';
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
