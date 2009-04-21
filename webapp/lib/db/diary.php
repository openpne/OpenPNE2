<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 指定メンバーの日記カテゴリリストを取得する
 *
 * @param int $c_member_id
 * @return array
 */
function db_diary_category_list4c_member_id($c_member_id)
{
    $sql = 'SELECT c_diary_category_id, category_name FROM c_diary_category '
         . 'WHERE c_member_id = ? ORDER BY c_diary_category_id';
    $result = db_get_all($sql, array(intval($c_member_id)));

    return $result;
}

/**
 * カテゴリ名からカテゴリIDを得る
 *
 * @param int $c_member_id
 * @param string $category_name
 * @return bool
 */
function db_diary_get_category_id4category_name($c_member_id, $category_name)
{
    $sql = 'SELECT c_diary_category_id FROM c_diary_category ' .
        'WHERE category_name = ? AND c_member_id = ?';
    return db_get_one($sql, array($category_name, intval($c_member_id)));
}

/**
 * カテゴリIDからカテゴリ名を得る
 */
function db_diary_get_category_name4category_id($category_id)
{
    $sql = 'SELECT category_name FROM c_diary_category ' .
        'WHERE c_diary_category_id = ?';
    return db_get_one($sql, array($category_id));
}

/**
 * 日記IDからカテゴリリストを得る
 *
 * @param int $c_diary_id
 * @return array
 */
function db_diary_category_list4c_diary_id($c_diary_id)
{
    $sql = 'SELECT c_diary_category_id FROM c_diary_category_diary WHERE c_diary_id = ?';
    $category_list = db_get_col($sql, array(intval($c_diary_id)));
    if (!$category_list) {
        return array();
    }
    $ids = implode(',', $category_list);

    $sql = 'SELECT c_diary_category_id, category_name FROM c_diary_category'
         . ' WHERE c_diary_category_id IN ('.$ids.') ORDER BY c_diary_category_id';
    return db_get_all($sql);
}

/**
 * カテゴリIDから日記を得る
 *
 * @param int $c_member_id
 * @param int $c_diary_category_id
 * @param int $u
 * @param int $page_size
 * @param int $page
 * @return array
 */
function db_diary_list4c_diary_category_id($c_member_id, $c_diary_category_id, $u = null, $page_size = 20, $page = 0)
{
    $sql = 'SELECT c_diary_id FROM c_diary_category_diary WHERE c_diary_category_id = ?';
    $diary_list = db_get_col($sql, array(intval($c_diary_category_id)));
    if (!$diary_list) {
        return array(array(), false, false, 0);
    }
    $ids = implode(',', $diary_list);

    $pf_cond = db_diary_public_flag_condition($c_member_id, $u);
    $where = ' WHERE c_diary_id IN ('.$ids.') AND c_member_id = ? ' . $pf_cond . ' ORDER BY r_datetime DESC';
    $sql = 'SELECT * FROM c_diary' . $where;
    $params = array($c_member_id);
    $list = db_get_all_limit($sql, $page_size * ($page - 1), $page_size, $params);

    foreach ($list as $key => $c_diary) {
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_diary' . $where;
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

    return array($list, $prev, $next, $total_num);
}

/**
 * カテゴリを追加する
 *
 * @param int $c_member_id
 * @param int $category_name
 */
function db_diary_category_insert_category($c_member_id, $category_name)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'category_name' => $category_name,
        'r_datetime' => db_now(),
    );
    return db_insert('c_diary_category', $data);
}

/**
 * カテゴリを削除する
 *
 * @param int $c_diary_category_id
 */
function db_diary_category_delete_category($c_diary_category_id)
{
    $sql = 'DELETE FROM c_diary_category WHERE c_diary_category_id = ?';
    db_query($sql, array($c_diary_category_id));
}
/**
 * カテゴリと日記を関連づける
 *
 * @param int $c_diary_id
 * @param int $c_diary_category_id
 */
function db_diary_category_insert_c_diary_category_diary($c_diary_id, $c_diary_category_id)
{
    $data = array(
        'c_diary_id' => intval($c_diary_id),
        'c_diary_category_id' => intval($c_diary_category_id),
    );
    db_insert('c_diary_category_diary', $data);
}

/**
 * カテゴリと日記の関連づけを削除する
 */
function db_diary_category_delete_c_diary_category_diary($c_diary_id)
{
    $diary_category_list = db_diary_category_list4c_diary_id($c_diary_id);

    $sql = 'DELETE FROM c_diary_category_diary WHERE c_diary_id = ?';
    db_query($sql, array($c_diary_id));

    foreach($diary_category_list as $value) {
        $sql = 'SELECT COUNT(*) FROM c_diary_category_diary'.
            ' WHERE c_diary_category_id = ?';
        $c_diary_category_id = $value['c_diary_category_id'];
        $is_diary = (bool)db_get_one($sql, array(intval($c_diary_category_id)));
        if (!$is_diary) {  //カテゴリに関連付いた日記が存在しない
            db_diary_category_delete_category($c_diary_category_id);
        }
    }
}

/**
 * db_diary_public_flag_condition
 *
 * @param int $c_member_id target c_member_id
 * @param int $u viewer's c_member_id
 * @param string $force
 * @return string
 */
function db_diary_public_flag_condition($c_member_id, $u = null, $force = null)
{
    $pf_cond = '';
    if ($force) {
        switch ($force) {
        case 'friend':
            $pf_cond = " AND public_flag <> 'private'";
            break;
        case 'private':
            $pf_cond = " AND public_flag = 'public'";
            break;
        }
    } else {
        if (!is_null($u) && $c_member_id != $u) {
            $is_friend = db_friend_is_friend($c_member_id, $u);
            if ($is_friend) {
                $pf_cond = " AND public_flag <> 'private'";
            } else {
                $pf_cond = " AND public_flag = 'public'";
            }
        }
    }
    return $pf_cond;
}

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
    $c_diary_list = db_get_row($sql, array(intval($c_diary_id)));
    return $c_diary_list;
}

/**
 * メンバーIDから日記リストを最新順で取得
 *
 * @param int $c_member_id
 * @return array 日記リスト
 */
function db_diary_get_c_diary_list4c_member_id($target_c_member_id, $count = 10, $u = null, $force = null)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $pf_cond = db_diary_public_flag_condition($target_c_member_id, $u, $force);
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ?' . $pf_cond .
           ' ORDER BY r_datetime DESC';
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

/**
 * 指定した日記の前の日記IDを取得する
 *
 * @param int $c_member_id
 * @param int $c_diary_id
 */
function db_diary_c_diary_id_prev4c_diary_id($c_member_id, $c_diary_id, $u = null)
{
    $public_flag_condition = db_diary_public_flag_condition($c_member_id, $u);
    $sql = 'SELECT c_diary_id FROM c_diary WHERE c_member_id = ? AND c_diary_id < ?'
         . $public_flag_condition . ' ORDER BY c_diary_id DESC';
    return db_get_one($sql, array(intval($c_member_id), intval($c_diary_id)));
}

/**
 * 指定した日記の次の日記IDを取得する
 *
 * @param int $c_member_id
 * @param int $c_diary_id
 */
function db_diary_c_diary_id_next4c_diary_id($c_member_id, $c_diary_id, $u = null)
{
    $public_flag_condition = db_diary_public_flag_condition($c_member_id, $u);
    $sql = 'SELECT c_diary_id FROM c_diary WHERE c_member_id = ? AND c_diary_id > ?'
         . $public_flag_condition . ' ORDER BY c_diary_id ASC';
    return db_get_one($sql, array(intval($c_member_id), intval($c_diary_id)));
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
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
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
 * @param int $c_member_id target c_member_id
 * @param int $page_size
 * @param int $page
 * @param int $u viewer's c_member_id
 * @return array 日記リスト
 */
function p_fh_diary_list_diary_list4c_member_id($c_member_id, $page_size, $page, $u = null)
{
    $pf_cond = db_diary_public_flag_condition($c_member_id, $u);
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ?' . $pf_cond .
           ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $c_diary) {
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_diary WHERE c_member_id = ?' . $pf_cond;
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
    return array($list, $prev, $next, $total_num);
}

/**
 * フレンドの最新日記リスト
 */
function p_h_diary_list_friend_h_diary_list_friend4c_member_id($c_member_id, $page_size, $page)
{
    $friends = db_friend_c_member_id_list($c_member_id, true);
    if (!$friends) {
        return array(array(), false, false, 0);
    }
    $ids = implode(',', array_map('intval', $friends));

    $hint = db_mysql_hint('USE INDEX (r_datetime_c_member_id, r_datetime)');
    $sql = 'SELECT * FROM c_diary' . $hint .
            ' WHERE c_member_id IN (' . $ids . ')' .
            ' AND public_flag <> \'private\'' .
            ' ORDER BY c_diary.r_datetime DESC';

    $lst = db_get_all_page($sql, $page, $page_size);

    foreach ($lst as $key=>$value) {
        $lst[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
        $lst[$key]['c_member'] = db_member_c_member4c_member_id($value['c_member_id']);
    }

    $sql = 'SELECT count(*) FROM c_diary' .
           ' WHERE c_member_id IN (' . $ids . ')' .
           ' AND public_flag <> \'private\'';
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
 * @param   int $use_is_display_friend_home
 * @return  array_of_array  (c_diary.*, nickname)
 */
function p_h_home_c_diary_friend_list4c_member_id($c_member_id, $limit, $use_is_display_friend_home = false)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $friends = db_friend_c_member_id_list($c_member_id, true);
    if (!$friends) {
        return array();
    }
    // 対象の最新書き込みのみを表示する場合
    if ($use_is_display_friend_home) {
        // 表示対象一覧を取得し、取得済みフレンド一覧とぶつける
        $friends = array_intersect($friends, db_friend_is_display_friend_home_list($c_member_id, $is_display_friend_home=1));
    }
    $ids = implode(',', array_map('intval', $friends));

    $hint = db_mysql_hint('USE INDEX (r_datetime_c_member_id, r_datetime)');
    $sql = 'SELECT * FROM c_diary' . $hint .
            ' WHERE c_member_id IN (' . $ids . ')' .
            ' AND public_flag <> \'private\'' .
            ' ORDER BY c_diary.r_datetime DESC';
    $c_diary_friend_list = db_get_all_limit($sql, 0, $limit);

    foreach ($c_diary_friend_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
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
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $sql = 'SELECT cdcl.c_diary_id, cdcl.r_datetime AS maxdate, cd.*'
         . ' FROM c_diary_comment_log AS cdcl INNER JOIN c_diary AS cd USING (c_diary_id) '
         . ' WHERE cdcl.c_member_id = ?'
         . ' AND (cd.public_flag = \'public\'';

    $friends = db_friend_c_member_id_list($c_member_id, true);
    $friend_ids = implode(',', array_map('intval', $friends));
    if ($friend_ids) {
         $sql .= ' OR (cd.public_flag = \'friend\' AND cd.c_member_id IN (' . $friend_ids . '))';
    }

    $sql .= ') ORDER BY maxdate DESC';
    $params = array(intval($c_member_id));
    $list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['r_datetime'] = $value['maxdate'];
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    return $list;
}

function p_h_diary_comment_list_c_diary_my_comment_list4c_member_id($c_member_id, $page, $page_size)
{
    $select = 'SELECT cdcl.c_diary_id, cdcl.r_datetime AS maxdate, cd.*';
    $from = ' FROM c_diary_comment_log AS cdcl INNER JOIN c_diary AS cd USING (c_diary_id) ';
    $where = ' WHERE cdcl.c_member_id = ? AND (cd.public_flag = \'public\'';


    $friends = db_friend_c_member_id_list($c_member_id, true);
    $friend_ids = implode(',', array_map('intval', $friends));
    if ($friend_ids) {
         $where .= ' OR (cd.public_flag = \'friend\' AND cd.c_member_id IN (' . $friend_ids . '))';
    }
    $where .= ')';

    $sql = $select . $from . $where . ' ORDER BY maxdate DESC';
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $list[$key]['r_datetime'] = $value['maxdate'];
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }

    $sql = 'SELECT COUNT(cdcl.c_diary_id)' . $from . $where;
    $params = array(intval($c_member_id));
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
function p_fh_diary_list_diary_list_date4c_member_id($c_member_id, $page_size, $page, $year, $month, $day=0 ,$u = null)
{
    if ($day) {
        $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day, $year));
        $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day+1, $year));
    } else {
        $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, 1, $year));
        $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month+1, 1, $year));
    }

    $pf_cond = db_diary_public_flag_condition($c_member_id, $u);
    $where = ' WHERE c_member_id = ? AND r_datetime >= ? AND r_datetime < ?';
    $sql = 'SELECT * FROM c_diary' .
            $where . $pf_cond .
            ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id), $s_date, $e_date);
    $list = db_get_all_limit($sql, $page_size * ($page - 1), $page_size, $params);

    foreach ($list as $key => $c_diary) {
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($c_diary['c_diary_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_diary' . $where;
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
 * 検索ポイントはタイトル、本文
 * 空白（全角半角問わない）でand検索可
 */
function p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page, $c_member_id = '')
{
    $params = array();

    $select = 'SELECT *';
    $from = ' FROM c_diary';

    //自分の日記だけを対象にする事もできる
    if ($c_member_id) {
        $where = ' WHERE c_member_id = ?';
        $params[] = intval($c_member_id);
    } else {
        $where = " WHERE public_flag = 'public'";
    }

    //and検索を実装
    //subject,body を検索
    if ($keyword) {
        //全角空白を半角に統一
        $keyword = str_replace('　', ' ', $keyword);

        $keyword_list = explode(' ', $keyword);
        foreach ($keyword_list as $word) {
            $word = check_search_word($word);

            $where .= ' AND (subject LIKE ? OR body LIKE ?)';
            $params[] = '%'.$word.'%';
            $params[] = '%'.$word.'%';
        }
    }
    $order = " ORDER BY r_datetime DESC";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_page($sql, $page, $page_size, $params);
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        $list[$key]['num_comment'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
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
function p_h_diary_is_diary_written_list4date($year, $month, $c_member_id, $u = null)
{
    include_once 'Date/Calc.php';

    $pf_cond = db_diary_public_flag_condition($c_member_id, $u);

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT DISTINCT date_part('day', r_datetime) FROM c_diary" .
               " WHERE c_member_id = ? AND r_datetime >= ? AND r_datetime < ?" . $pf_cond;
    } else {
        $sql = 'SELECT DISTINCT DAYOFMONTH(r_datetime) FROM c_diary' .
               ' WHERE c_member_id = ? AND r_datetime >= ? AND r_datetime < ?' . $pf_cond;
    }

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
 * メンバーの最新日記のリストを返す
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
function k_p_fh_diary_c_diary_comment_list4c_diary_id($c_diary_id, $page_size, $page, $desc = true)
{
    $sql = 'SELECT * FROM c_diary_comment WHERE c_diary_id = ? ORDER BY r_datetime';
    if ($desc) {
        $sql .= ' DESC';
    }
    $params = array(intval($c_diary_id));
    $c_diary_comment_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_diary_comment_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_diary_comment_list[$key]['nickname'] = $c_member['nickname'];
    }

    $sql = 'SELECT COUNT(c_diary_comment_id) FROM c_diary_comment WHERE c_diary_id = ?';
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
    return array($c_diary_comment_list, $prev, $next, $total_num, $total_page_num);
}

/**
 * 日記IDからその日記を書いたメンバーIDとニックネームと日記公開範囲を得る
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
        $lst[$key]['c_member'] = db_member_c_member4c_member_id($value['c_member_id']);
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

//--- diary

/**
 * 日記を追加
 */
function db_diary_insert_c_diary($c_member_id, $subject, $body, $public_flag, $is_comment_input = 1)
{
    //function cacheの削除
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $c_member_id, 5);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'subject' => $subject,
        'body' => $body,
        'public_flag' => util_cast_public_flag_diary($public_flag),
        'r_datetime' => db_now(),
        'r_date' => db_now(),
        'u_datetime' => db_now(),
        'is_checked' => 1,
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'is_comment_input' => (bool)$is_comment_input,
    );
    return db_insert('c_diary', $data);
}

/**
 * 日記を編集
 */
function db_diary_update_c_diary($c_diary_id, $subject, $body, $public_flag, $is_comment_input, $image_filename_1 = '', $image_filename_2 = '', $image_filename_3 = '')
{
    //function cacheの削除
    $c_diary = db_diary_get_c_diary4id($c_diary_id);
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $c_diary['c_member_id'], 5);

    $data = array(
        'subject' => $subject,
        'body' => $body,
        'public_flag' => util_cast_public_flag_diary($public_flag),
        'u_datetime' => db_now(),
        'is_comment_input' => (bool)$is_comment_input,
    );
    if ($image_filename_1) $data['image_filename_1'] = $image_filename_1;
    if ($image_filename_2) $data['image_filename_2'] = $image_filename_2;
    if ($image_filename_3) $data['image_filename_3'] = $image_filename_3;

    $where = array(
        'c_diary_id' => intval($c_diary_id),
    );
    return db_update('c_diary', $data, $where);
}

/**
 * 日記削除
 * コメント、画像も削除
 *
 * @param int $c_diary_id
 */
function db_diary_delete_c_diary($c_diary_id)
{
     //function cacheの削除
    $c_diary = db_diary_get_c_diary4id($c_diary_id);
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $c_diary['c_member_id'], 5);

   // 画像
    db_image_data_delete($c_diary['image_filename_1'], $c_diary['c_member_id']);
    db_image_data_delete($c_diary['image_filename_2'], $c_diary['c_member_id']);
    db_image_data_delete($c_diary['image_filename_3'], $c_diary['c_member_id']);

    // コメント
    $sql = 'SELECT image_filename_1, image_filename_2, image_filename_3, c_member_id FROM c_diary_comment WHERE c_diary_id =?';
    $params = array(intval($c_diary_id));
    $comment_images = db_get_all($sql, $params);

    //カテゴリ
    db_diary_category_delete_c_diary_category_diary($c_diary_id);

    foreach ($comment_images as $value) {
        db_image_data_delete($value['image_filename_1'], $value['c_member_id']);
        db_image_data_delete($value['image_filename_2'], $value['c_member_id']);
        db_image_data_delete($value['image_filename_3'], $value['c_member_id']);
    }

    $sql = 'DELETE FROM c_diary_comment_log WHERE c_diary_id = ?';
    db_query($sql, $params);

    $sql = 'DELETE FROM c_diary_comment WHERE c_diary_id = ?';
    db_query($sql, $params);

    // 日記
    $sql = 'DELETE FROM c_diary WHERE c_diary_id = ?';
    db_query($sql, $params);
}

/**
 * 指定した番号の日記画像を削除
 */
function db_diary_delete_c_diary_image($c_diary_id, $image_num)
{
    $data = array(
        'image_filename_'.intval($image_num) => '',
    );
    $where = 'c_diary_id = '.intval($c_diary_id);
    return db_update('c_diary', $data, $where);
}

/**
 * 日記に画像を追加する
 */
function db_diary_update_c_diary_image_filename($c_diary_id, $image_filename, $image_num)
{
    $data = array(
        'image_filename_'.intval($image_num) => $image_filename,
    );
    $where = 'c_diary_id = '.intval($c_diary_id);
    return db_update('c_diary', $data, $where);
}

/**
 * 日記の未読/既読を変更
 * c_diary.is_checkedを更新
 */
function db_diary_update_c_diary_is_checked($c_diary_id, $value)
{
    $data = array(
        'is_checked' => (bool)$value,
    );
    $where = 'c_diary_id = '.intval($c_diary_id);
    return db_update('c_diary', $data, $where);
}

//--- diary_comment

/**
 * 日記コメント追加
 *
 * @param  int    $c_member_id
 * @param  int    $c_diary_id
 * @param  string $body
 * @return int    insert_id
 */
function db_diary_insert_c_diary_comment($c_member_id, $c_diary_id, $body)
{
    //function cache削除
    $c_diary =  db_diary_get_c_diary4id($c_diary_id);
    cache_drop_c_diary($c_member_id, $c_diary['c_member_id']);
    pne_cache_drop('p_h_home_c_diary_my_comment_list4c_member_id', $c_member_id, 5);

    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_diary_id' => intval($c_diary_id),
        'body' => $body,
        'r_datetime' => db_now(),
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
        'number' => db_diary_get_max_c_diary_comment_number4diary($c_diary_id)+1,
    );
    return db_insert('c_diary_comment', $data);
}

/**
 * 日記コメント用画像追加
 */
function db_diary_insert_c_diary_comment_images($c_diary_comment_id, $image_filename_1 = '', $image_filename_2 = '', $image_filename_3 = '')
{
    $data = array();
    if ($image_filename_1) $data['image_filename_1'] = $image_filename_1;
    if ($image_filename_2) $data['image_filename_2'] = $image_filename_2;
    if ($image_filename_3) $data['image_filename_3'] = $image_filename_3;

    $where = array(
        'c_diary_comment_id' => intval($c_diary_comment_id),
    );
    return db_update('c_diary_comment', $data, $where);
}

/**
 * 日記コメント削除
 *
 * @param   int $c_diary_comment_id
 * @param   int $u  : 削除しようとしている人の c_member_id
 */
function db_diary_delete_c_diary_comment($c_diary_comment_id, $u)
{
    $dc = _do_c_diary_comment4c_diary_comment_id($c_diary_comment_id);
    if ($dc['c_member_id'] != $u && $dc['c_member_id_author'] != $u) {
        return false;
    }

    db_image_data_delete($dc['image_filename_1'], $dc['c_member_id']);
    db_image_data_delete($dc['image_filename_2'], $dc['c_member_id']);
    db_image_data_delete($dc['image_filename_3'], $dc['c_member_id']);

    $sql = 'DELETE FROM c_diary_comment WHERE c_diary_comment_id = ?';
    $params = array(intval($c_diary_comment_id));
    return db_query($sql, $params);
}

// 日記公開範囲の一括設定をする
function db_diary_update_public_flag_diary_all($c_member_id, $public_flag)
{
    $data = array(
        'public_flag' => util_cast_public_flag_diary($public_flag),
    );

    $where = array(
        'c_member_id' => intval($c_member_id),
    );
    return db_update('c_diary', $data, $where);
}

/**
 * 現在の日記へのコメントのナンバーの最大値を返す
 */
function db_diary_get_max_c_diary_comment_number4diary($c_diary_id)
{
    $sql = 'SELECT MAX(number) FROM c_diary_comment WHERE c_diary_id = ?';
    $params = array(intval($c_diary_id));
    return db_get_one($sql, $params, 'main');
}

/**
 * SNS全体の最新日記リスト取得
 * 日記公開範囲を考慮
 *
 * @param   int $limit
 * @return  array_of_array  (c_diary.*, nickname)
 */
function p_h_home_c_diary_all_list($limit)
{
    $sql = 'SELECT * FROM c_diary WHERE public_flag = \'public\''
         . ' ORDER BY c_diary.r_datetime DESC';

    $c_diary_list_all = db_get_all_limit($sql, 0, $limit);

    foreach ($c_diary_list_all as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_diary_list_all[$key]['nickname'] = $c_member['nickname'];
        $c_diary_list_all[$key]['count_comments'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
    }
    return $c_diary_list_all;
}


/**
 * 日記コメント記入履歴の追加
 *
 * @param  int    $c_member_id
 * @param  int    $c_diary_id
 */
function db_diary_insert_c_diary_comment_log($c_member_id, $c_diary_id)
{
    $sql = 'SELECT c_diary_id FROM c_diary_comment_log'
         . ' WHERE c_member_id = ? AND c_diary_id = ?';
    $params = array(intval($c_member_id), intval($c_diary_id));
    $log_id = db_get_one($sql, $params, 'main');
    if (!$log_id) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'c_diary_id' => intval($c_diary_id),
            'r_datetime' => db_now(),
        );
        return db_insert('c_diary_comment_log', $data);
    }
    return false;
}

/**
 * 日記コメント記入履歴の更新
 *
 * @param  int    $c_diary_id
 */
function db_diary_update_c_diary_comment_log($c_diary_id)
{
    $data = array(
        'r_datetime' => db_now(),
    );
    $where = array('c_diary_id' => intval($c_diary_id));
    return db_update('c_diary_comment_log', $data, $where);
}

/**
 * 日記コメント記入履歴の削除
 *
 * @param  int    $c_member_id
 * @param  int    $c_diary_id
 * 該当c_diary_idへのコメント数が0なら、日記コメント記入履歴も削除する。
 *
 */
function db_diary_delete_c_diary_comment_log($c_member_id, $c_diary_id)
{
    // 投稿したコメントの有無
    $sql = 'SELECT COUNT(c_diary_comment_id) FROM c_diary_comment'
         . ' WHERE c_member_id = ? AND c_diary_id = ?';
    $params = array(intval($c_member_id), intval($c_diary_id));
    $count = db_get_one($sql, $params, 'main');

    // コメントが無ければ履歴削除
    if (!$count) {
        $sql = 'DELETE FROM c_diary_comment_log'
             . ' WHERE c_member_id = ? AND c_diary_id = ?';
        $params = array(intval($c_member_id), intval($c_diary_id));
        db_query($sql, $params);
    }
    $sql = 'SELECT * FROM c_diary_comment WHERE c_diary_id = ?'
         . ' ORDER BY c_diary_comment_id DESC';
    $params = array(intval($c_diary_id));
    $comment = db_get_row($sql, $params, 'main');

    // 最新コメントの日付で履歴更新
    $data = array(
        'r_datetime' => $comment['r_datetime'],
    );
    $where = array('c_diary_id' => intval($c_diary_id));
    return db_update('c_diary_comment_log', $data, $where);
}

function db_diary_is_writable_comment4c_diary_id($c_diary_id)
{
    $max_c_diary_comment_number = db_diary_get_max_c_diary_comment_number4diary($c_diary_id);
    if ($max_c_diary_comment_number >= 1000) {
        return false;
    }

    return true;
}

/**
 * メンバーの日記とコメントを削除
 *
 * @param  int    $c_member_id
 */
function db_diary_delete4c_member_id($c_member_id)
{
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ?';
    $single = array(intval($c_member_id));
    $c_diary_list = db_get_all($sql, $single, 'main');
    foreach ($c_diary_list as $c_diary) {
        db_image_data_delete($c_diary['image_filename_1']);
        db_image_data_delete($c_diary['image_filename_2']);
        db_image_data_delete($c_diary['image_filename_3']);

        // c_diary_comment
        $sql = 'SELECT * FROM c_diary_comment WHERE c_diary_id = ?';
        $params = array(intval($c_diary['c_diary_id']));
        $c_diary_comment_list = db_get_all($sql, $params, 'main');
        foreach ($c_diary_comment_list as $c_diary_comment) {
            db_image_data_delete($c_diary_comment['image_filename_1']);
            db_image_data_delete($c_diary_comment['image_filename_2']);
            db_image_data_delete($c_diary_comment['image_filename_3']);
        }

        $sql = 'DELETE FROM c_diary_comment WHERE c_diary_id = ?';
        db_query($sql, $params);
        db_diary_delete_c_diary_comment_log($c_member_id, $c_diary['c_diary_id']);
    }
    $sql = 'DELETE FROM c_diary WHERE c_member_id = ?';
    db_query($sql, $single);
}

?>
