<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//// c_diary

/**
 * 日記IDから日記を取得
 * 
 * @param   int   $c_diary_id
 * @return  array
 */
function db_diary_get_c_diary4id($c_diary_id)
{
    $sql = 'SELECT * FROM c_diary WHERE c_diary_id = ?';
    return db_get_row($sql, array(intval($c_diary_id)));
}

/**
 * メンバーIDから日記リストを最新順で取得
 * 
 * @param int $c_member_id
 * @return array 日記リスト
 */
function db_diary_get_c_diary_list4c_member_id($target_c_member_id, $count = 10)
{
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($target_c_member_id));
    $arr = db_get_all_limit($sql, 0, $count, $params);
    foreach ($arr as $key => $value) {
        $arr[$key]['comment_count'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }
    return $arr;
}

function p_common_is_active_c_diary_id($c_diary_id)
{
    $sql = 'SELECT c_diary_id FROM c_diary WHERE c_diary_id = ?';
    return (bool)db_get_one($sql, array(intval($c_diary_id)));
}

//// c_diary_comment

/**
 * 日記のコメントリストを得る
 * 
 * @param   int $c_diary_id
 * @param   int $limit
 * @return  array 日記コメント＋ニックネーム
 */
function db_diary_get_c_diary_comment_list4c_diary_id($c_diary_id)
{
    $sql = 'SELECT c_member.nickname, c_diary_comment.*' .
        ' FROM c_diary_comment LEFT JOIN c_member USING (c_member_id)' .
        ' WHERE c_diary_id = ?' .
        ' ORDER BY c_diary_comment.r_datetime';
    return db_get_all($sql, array(intval($c_diary_id)));
}

/**
 * 日記のコメントリスト（好きなID(複数)）を取得
 * 
 * @param   array $id_list
 * @param   int   $page
 * @param   int   $page_size
 * @param   bool  $desc  並び順を日時の新しい順にするかどうか
 * @return  日記コメント（＋ニックネーム）リスト
 */
function db_diary_get_c_diary_comment_list4id_list($id_list, $page = 1, $page_size= -1, $desc = false)
{
    if (!count($id_list)) return array();
    if ($page_size < 0) {
        $page_size = count($id_list);
    }
    $e_id_list = implode(',', array_map('intval', (array)$id_list));

    $sql = 'SELECT * FROM c_diary_comment' .
            ' WHERE c_diary_comment_id IN ('.$e_id_list.')';
    if ($desc) {
        $sql .= ' ORDER BY r_datetime DESC';
    } else {
        $sql .= ' ORDER BY r_datetime';
    }
    $c_diary_comment_list = db_get_all_page($sql, $page, $page_size);
    foreach ($c_diary_comment_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_diary_comment_list[$key]['nickname'] = $c_member['nickname'];
    }

    $sql = 'SELECT COUNT(*) FROM c_diary_comment' .
        ' WHERE c_diary_comment_id IN ('.$e_id_list.')';
    $total_num = db_get_one($sql);

    if ($total_num != 0) {
        $total_page_num = ceil($total_num / $page_size);
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

    return array($c_diary_comment_list, $prev , $next, $total_num);
}

/**
 * 日記のコメント数を取得
 * 
 * @param int $c_diary_id
 * @return int コメント数
 */
function db_diary_count_c_diary_comment4c_diary_id($c_diary_id)
{
    $sql = 'SELECT COUNT(*) FROM c_diary_comment WHERE c_diary_id = ?';
    return db_get_one($sql, array(intval($c_diary_id)));
}

////

/**
 * あるメンバーの日記リストを取得
 * 
 * @param int $c_member_id
 * @param int $page_size
 * @param int $page
 * @return array 日記リスト
 */
function p_fh_diary_list_diary_list4c_member_id($c_member_id, $page_size, $page)
{
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $c_diary) {
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_diary WHERE c_member_id = ?';
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

/**
 * フレンドの最新日記リスト
 */
function p_h_diary_list_friend_h_diary_list_friend4c_member_id($c_member_id, $page_size, $page ,$limit_days)
{
    $last_week = date('Y-m-d H:i:s', strtotime(sprintf('-%d days', $limit_days)));

    $where = "c_friend.c_member_id_from = ?" .
            " AND c_diary.c_member_id = c_friend.c_member_id_to" .
            " AND c_diary.c_member_id = c_member.c_member_id" .
            ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\') OR (c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\'))' .
            " AND c_diary.r_datetime > ?";

    $params = array(intval($c_member_id), $last_week);

    $sql = "SELECT c_diary.* FROM c_diary, c_friend, c_member WHERE " . $where .
            " ORDER BY c_diary.r_datetime DESC";
    $lst = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($lst as $key=>$value) {
        $lst[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
        $lst[$key]['c_member'] = db_common_c_member4c_member_id($value['c_member_id']);
    }

    $sql = 'SELECT count(*) FROM c_diary, c_friend, c_member WHERE ' . $where;
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

    return array($lst, $prev, $next, $total_num);
}

/**
 * 未読コメントのある日記の数を数える
 * 
 * @param int $c_member_id
 * @return int 未読日記数
 */
function p_h_diary_count_c_diary_not_is_read4c_member_id($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_diary WHERE c_member_id = ? AND is_checked = 0';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * 未読コメントのある日記のうちもっとも古い日記IDを返す
 * 
 * @param int $c_member_id
 * @return int c_diary_id
 */
function p_h_diary_c_diary_first_diary_read4c_member_id($c_member_id)
{
    $sql = 'SELECT c_diary_id FROM c_diary WHERE c_member_id = ? AND is_checked = 0 ORDER BY r_datetime';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * フレンド最新日記リスト取得
 * 日記公開範囲を考慮
 * 
 * @param   int $c_member_id
 * @param   int $limit
 * @return  array_of_array  (c_diary.*, nickname)
 */
function p_h_home_c_diary_friend_list4c_member_id($c_member_id, $limit)
{
    $friends = db_friend_c_member_id_list($c_member_id);
    $ids = implode(',', array_map('intval', $friends));

    $hint = db_mysql_hint('USE INDEX (c_diary.r_datetime_c_member_id, c_diary.r_datetime)');
    $sql = 'SELECT c_diary.* FROM c_diary INNER JOIN c_member USING (c_member_id)' . $hint .
            ' WHERE c_diary.c_member_id IN (' . $ids . ')' .
            ' AND (((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\'))' .
            ' OR ((c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\')))' .
            ' ORDER BY c_diary.r_datetime DESC';

    $c_diary_friend_list = db_get_all_limit($sql, 0, $limit);

    foreach ($c_diary_friend_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_diary_friend_list[$key]['nickname'] = $c_member['nickname'];
        $c_diary_friend_list[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }
    return $c_diary_friend_list;
}

/**
 * 日記コメント記入履歴取得
 * 
 * @param   int $c_member_id
 * @param   int $limit
 * @return  array_of_array  (c_diary.*, nickname)
 */
function p_h_home_c_diary_my_comment_list4c_member_id($c_member_id, $limit)
{

    //アクセスブロック
    $sql = 'SELECT c_member_id FROM c_access_block where c_member_id_block = ?';
    $params = array(intval($c_member_id));
    if( !$ids = implode(',', db_get_col($sql, $params)) ) {
        $ids = 0;
    }


    $date = date('Y-m-d 00:00:00', strtotime('-15 days'));

    $sql = 'SELECT c_diary_comment.c_diary_id' .
            ' FROM c_diary_comment INNER JOIN c_diary USING (c_diary_id)' .
            ' , c_member, c_friend' .
            ' WHERE c_diary_comment.c_member_id = ?' .
            ' AND c_diary_comment.r_datetime > ?' .
            ' AND c_diary.c_member_id <> ?'.
        //アクセスブロック
            ' AND c_friend.c_member_id_from = c_diary_comment.c_member_id' .
            ' AND c_diary.c_member_id not in('.$ids.')' .
        //日記公開範囲絞り
            ' AND c_diary.c_member_id = c_member.c_member_id' .
            ' AND (((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\')) OR(((c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\')) AND c_diary.c_member_id = c_friend.c_member_id_to))';

    $params = array(intval($c_member_id), $date, intval($c_member_id));

    $c_diary_id_list = db_get_col($sql, $params);
    $c_diary_id_list = array_unique($c_diary_id_list);
    if (!$c_diary_id_list) {
        return array();
    }

    $ids = implode(',', $c_diary_id_list);
    $sql = 'SELECT c_diary_id, MAX(r_datetime) as maxdate' .
           ' FROM c_diary_comment' .
           ' WHERE c_diary_id IN (' . $ids . ')' .
           ' GROUP BY c_diary_id' .
           ' ORDER BY maxdate DESC';
    $list = db_get_assoc_limit($sql, 0, $limit);

    $result = array();
    foreach ($list as $c_diary_id => $r_datetime) {
        $item = db_diary_get_c_diary4id($c_diary_id);
        $item += db_common_c_member4c_member_id_LIGHT($item['c_member_id']);
        $item['r_datetime'] = $r_datetime;
        $item['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary_id);
        $result[] = $item;
    }
    return $result;
}

function p_h_diary_comment_list_c_diary_my_comment_list4c_member_id($c_member_id, $page, $page_size)
{

    $sql = 'SELECT c_member_id FROM c_access_block where c_member_id_block = ?';
    $params = array(intval($c_member_id));
    if( !$ids = implode(',', db_get_col($sql, $params)) ) {
        $ids = 0;
    }

    $sql = 'SELECT d.c_diary_id' .
            ', d.subject' .
            ', d.c_member_id' .
            ', MAX(dc.r_datetime) AS r_datetime' .
            ', COUNT(DISTINCT dc.c_diary_comment_id) AS num_comment' .
        ' FROM c_diary AS d' .
            ' INNER JOIN c_diary_comment AS dc USING (c_diary_id)' .
            ', c_diary_comment AS mydc' .
            ', c_friend AS f' .
            ', c_member AS m' .

        ' WHERE mydc.c_member_id = ?' .
            ' AND mydc.c_diary_id = d.c_diary_id' .
            ' AND mydc.c_member_id <> d.c_member_id' .
        //アクセスブロック
            ' AND f.c_member_id_from = mydc.c_member_id' .
            ' AND d.c_member_id not in('.$ids.')' .
        //日記公開範囲絞り
            ' AND d.c_member_id = m.c_member_id' .
            ' AND (((d.public_flag = \'public\') OR (d.public_flag = \'default\' AND m.public_flag_diary = \'public\')) OR(((d.public_flag = \'friend\') OR (d.public_flag = \'default\' AND m.public_flag_diary = \'friend\')) AND d.c_member_id = f.c_member_id_to))'.

        ' GROUP BY dc.c_diary_id' .
        ' ORDER BY r_datetime DESC';

    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $value) {
        $list[$key] += db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
    }

    $sql = 'SELECT COUNT(DISTINCT d.c_diary_id)' .
        ' FROM c_diary AS d' .
            ', c_diary_comment AS mydc' .
        ' WHERE mydc.c_member_id = ?' .
            ' AND mydc.c_diary_id = d.c_diary_id' .
            ' AND mydc.c_member_id <> d.c_member_id';
    $total_num = db_get_one($sql, $params);

    $is_prev = false;
    $is_next = false;
    if ($total_num) {
        $is_prev = (bool)($page > 1);
        $is_next = (bool)($page < ceil($total_num / $page_size));
    }
    return array($list, $is_prev, $is_next, $total_num);
}

/**
 * あるメンバーの指定された年月日の日記のリストを得る
 */
function p_fh_diary_list_diary_list_date4c_member_id($c_member_id, $year, $month, $day=0)
{
    if ($day) {
        $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day, $year));
        $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day+1, $year));
    } else {
        $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, 1, $year));
        $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month+1, 1, $year));
    }

    $sql = 'SELECT * FROM c_diary' .
            ' WHERE c_member_id = ? AND r_datetime >= ? AND r_datetime < ?' .
            ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id), $s_date, $e_date);
    $list = db_get_all($sql, $params);

    foreach ($list as $key => $c_diary) {
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
    }

    return array($list , false, false);
}

/**
 * 日記ページの「各月の日記」用
 * 
 * 日記を最初に書いた月からスタートしてみる
 */
function p_fh_diary_list_date_list4c_member_id($c_member_id)
{
    $sql = "SELECT r_datetime FROM c_diary" .
        " WHERE c_member_id = ?" .
        " ORDER BY r_datetime";
    $params = array(intval($c_member_id));
    if (!$first_datetime = db_get_one($sql, $params)) {
        return array();
    }

    $start_date = getdate(strtotime($first_datetime));
    $end_date =  getdate();

    $date = array();
    $year = $start_date['year'];
    $month = $start_date['mon'];
    while (1) {
        $date[] =  array(
            'year' => $year,
            'month' => $month,
        );

        if ($end_date['year'] <= $year
            && $end_date['mon'] <= $month) {
            break;
        }

        $month++;
        if ($month > 12) {
            $month = 1;
            $year++;
        }
    }
    return array_reverse($date);
}

//c_member_id から自分の日記についてるコメントID(複数)を取得
function p_fh_diary_c_diary_comment_id_list4c_member_id($c_member_id)
{
    $sql = "SELECT cdc.c_diary_comment_id FROM c_diary as cd,c_diary_comment as cdc" .
        " WHERE cd.c_member_id = ?".
        " AND cd.c_diary_id = cdc.c_diary_id";
    $params = array(intval($c_member_id));
    return db_get_col($sql, $params);
}

/**
 * 年月 から日記のある日(複数)を取得
 */
function p_fh_diary_list_calendar_list4c_member_id($year, $month, $c_member_id)
{
    $sql = "SELECT cdc.c_diary_comment_id FROM c_diary as cd,c_diary_comment as cdc" .
        " WHERE cd.c_member_id = ?".
        " AND cd.c_diary_id = cdc.c_diary_id";
    $params = array(intval($c_member_id));
    return db_get_col($sql, $params);
}

/**
 * 新着日記検索
 * 書き込まれてから１週間の全体に公開されている日記を検索
 * 検索ポイントはタイトル、本文
 * 空白（全角半角問わない）でand検索可
 */
function p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page)
{
    $where = ' WHERE 1';
    $params = array();

    //and検索を実装
    //subject,body を検索
    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace("　", " ", $keyword);

        $keyword_list = explode(" ", $keyword);
        foreach ($keyword_list as $word) {
            $word = check_search_word($word);

            $where .= ' AND (c_diary.subject LIKE ? OR c_diary.body LIKE ?)';
            $params[] = '%'.$word.'%';
            $params[] = '%'.$word.'%';
        }
    }
    $where .= " AND c_member.c_member_id = c_diary.c_member_id";
    $where .= " AND ((c_diary.public_flag = 'public') OR (c_diary.public_flag = 'default' AND c_member.public_flag_diary = 'public'))";

    $select = "SELECT c_diary.*";
    $from = " FROM c_diary, c_member";
    $order = " ORDER BY c_diary.r_datetime DESC";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_page($sql, $page, $page_size, $params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_common_c_member_with_profile($value['c_member_id']);
        $list[$key]['comment_count'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql = 'SELECT COUNT(*)' . $from . $where;
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
    return array($list , $prev , $next, $total_num);
}

/**
 * 指定された年月に日記を書いている日のリストを返す
 */
function p_h_diary_is_diary_written_list4date($year, $month, $c_member_id)
{
    include_once 'Date/Calc.php';

    $sql = 'SELECT DISTINCT DAYOFMONTH(r_datetime) FROM c_diary' .
           ' WHERE c_member_id = ? AND r_datetime >= ? AND r_datetime < ?';

    $date_format = '%Y-%m-%d 00:00:00';
    $thismonth = Date_Calc::beginOfMonth($month, $year, $date_format);
    $nextmonth = Date_Calc::beginOfNextMonth(0, $month, $year, $date_format);

    $params = array(intval($c_member_id), $thismonth, $nextmonth);

    return db_get_col($sql, $params);
}

/**
 * 日記コメント情報をIDから取得
 * 
 * @param   int $c_diary_comment_id
 * @return array
 *              c_diary_comemnt.*
 *              c_diary.c_member_id AS c_member_id_author
 */
function _do_c_diary_comment4c_diary_comment_id($c_diary_comment_id)
{
    $sql = "SELECT dc.*, d.c_member_id AS c_member_id_author";
    $sql .= " FROM c_diary_comment AS dc, c_diary AS d";
    $sql .= " WHERE dc.c_diary_comment_id = ?";
    $sql .= " AND dc.c_diary_id = d.c_diary_id";
    $params = array(intval($c_diary_comment_id));
    return db_get_row($sql, $params);
}

/**
 * ターゲットメンバの最新日記のリストを返す
 */
function k_p_f_home_c_diary_list4c_member_id($c_member_id, $limit)
{
    //日記リスト
    $sql = "SELECT c_diary_id, r_date, subject ,image_filename_1";
    $sql .= " FROM c_diary";
    $sql .= " WHERE c_member_id = ?";
    $sql .= " ORDER BY r_date DESC";
    $params = array(intval($c_member_id));
    $c_diary_list = db_get_all_limit($sql, 0, $limit, $params);

    //コメント数
    foreach ($c_diary_list as $key => $value) {
        $c_diary_id = $value['c_diary_id'];

        $sql = "SELECT COUNT(*) ";
        $sql .= "FROM c_diary_comment ";
        $sql .= "WHERE c_diary_id = ?";
        $params = array(intval($c_diary_id));
        $c_diary_list[$key]['count_comment'] = db_get_one($sql, $params);
    }
    return $c_diary_list;
}

/**
 * 最新日記リストを取得。
 * 取得範囲を指定できる。
 */
function k_p_fh_diary_list_c_diary_list4c_member_id($c_member_id, $page_size, $page)
{
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id));
    $c_diary_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_diary_list as $key => $value) {
        $c_diary_list[$key]['count_comment'] =
            db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_diary WHERE c_member_id = ?';
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
    return array($c_diary_list , $prev , $next);
}

/**
 * 日記へのコメントリストを取得
 */
function k_p_fh_diary_c_diary_comment_list4c_diary_id($c_diary_id, $page_size, $page)
{
    $sql = 'SELECT * FROM c_diary_comment WHERE c_diary_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_diary_id));
    $c_diary_comment_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_diary_comment_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_diary_comment_list[$key]['nickname'] = $c_member['nickname'];
    }

    $sql = "SELECT COUNT(*) FROM c_diary_comment WHERE c_diary_id = ?";
    $params = array(intval($c_diary_id));
    $total_num = db_get_one($sql, $params);

    if ($total_num > 0) {
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
    return array($c_diary_comment_list , $prev , $next, $total_num, $total_page_num);
}

/**
 * 日記ＩＤからその日記を書いたメンバＩＤとニックネームと日記公開範囲を得る
 */
function k_p_fh_diary_c_member4c_diary_id($c_diary_id)
{
    $sql = "SELECT cm.c_member_id, cm.nickname,cm. public_flag_diary ";
    $sql .= " FROM c_member AS cm, c_diary AS cd ";
    $sql .= " WHERE cd.c_diary_id = ?";
    $sql .= " AND cm.c_member_id=cd.c_member_id";
    $params = array(intval($c_diary_id));
    return db_get_row($sql, $params);
}

/**
 * フレンドの最新日記リスト
 */
function k_p_h_diary_list_friend_h_diary_list_friend4c_member_id($c_member_id, $page_size, $page)
{
    $from = "c_diary, c_friend";
    $where = "c_friend.c_member_id_from = ?" .
            " AND c_diary.c_member_id = c_friend.c_member_id_to";

    $sql = "SELECT c_diary.* FROM {$from} WHERE {$where}" .
            " ORDER BY c_diary.r_datetime DESC";
    $params = array(intval($c_member_id));
    $lst = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($lst as $key=>$value) {
        $lst[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
        $lst[$key]['c_member'] = db_common_c_member4c_member_id($value['c_member_id']);
    }

    $sql = "SELECT count(*) FROM {$from} WHERE {$where}";
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

    return array($lst, $prev, $next, $total_num);
}

?>
