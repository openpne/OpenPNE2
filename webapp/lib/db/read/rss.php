<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function p_h_home_h_blog_list_friend4c_member_id($c_member_id, $page_size = 5)
{
    $sql = "SELECT c_rss_cache.*, c_member.nickname" .
        " FROM c_rss_cache, c_member" .
        " WHERE c_member.c_member_id = c_rss_cache.c_member_id" .
            " AND c_rss_cache.c_member_id = ?" .
        " ORDER BY c_rss_cache.r_datetime DESC";
    $params = array(intval($c_member_id));
    return db_get_all_limit($sql, 0, $page_size, $params);
}

function p_h_diary_list_all_c_rss_cache_list($limit)
{
    $sql = 'SELECT * FROM c_rss_cache ORDER BY r_datetime DESC';
    $lst = db_get_all_limit($sql, 0, $limit);

    foreach ($lst as $key => $value) {
        $lst[$key]['c_member'] = db_common_c_member4c_member_id($value['c_member_id']);
    }
    return $lst;
}

function p_h_diary_list_friend_c_rss_cache_list($c_member_id, $limit)
{
    $friends = db_friend_c_member_id_list($c_member_id);
    $ids = implode(',', array_map('intval', $friends));

    $sql = 'SELECT * FROM c_rss_cache WHERE c_member_id IN ('.$ids.')' .
            ' ORDER BY r_datetime DESC';
    $list = db_get_all_limit($sql, 0, $limit);

    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
    }
    return $list;
}

function p_fh_diary_list_c_rss_cache_list($c_member_id,$page_size, $page)
{
    $sql = 'SELECT * FROM c_rss_cache WHERE c_member_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id));
    $lst = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($lst as $key => $value) {
        $lst[$key]['c_member'] = db_common_c_member4c_member_id($value['c_member_id']);
    }
    return $lst;
}

function p_fh_diary_list_c_rss_cache_list_date($c_member_id, $year, $month, $day=0)
{
    if ($day) {
        $s_date = date('Y-m-d H:i:s', mktime(0,0,0,$month,$day,$year));
        $e_date = date('Y-m-d H:i:s', mktime(0,0,0,$month,$day+1,$year));
    } else {
        $s_date = date('Y-m-d H:i:s', mktime(0,0,0,$month,1,$year));
        $e_date = date('Y-m-d H:i:s', mktime(0,0,0,$month+1,1,$year));
    }

    $sql = 'SELECT * FROM c_rss_cache WHERE c_member_id = ?' .
            ' AND r_datetime >= ? AND r_datetime < ?' .
            ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id), $s_date, $e_date);
    $lst = db_get_all($sql, $params);

    foreach ($lst as $key => $value) {
        $lst[$key]['c_member'] = db_common_c_member4c_member_id($value['c_member_id']);
    }
    return $lst;
}

function p_f_home_c_rss_cache_list4c_member_id($c_member_id, $limit = 5)
{
    $sql = 'SELECT * FROM c_rss_cache WHERE c_member_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id));
    return db_get_all_limit($sql, 0, $limit, $params);
}

function db_is_duplicated_rss_cache($c_member_id, $date, $link)
{
    $sql = 'SELECT c_rss_cache_id FROM c_rss_cache' .
            ' WHERE c_member_id = ? AND r_datetime = ? AND link = ?';
    $params = array(intval($c_member_id), $date, $link);
    return (bool)db_get_one($sql, $params);
}

function db_is_updated_rss_cache($c_member_id, $link)
{
    $sql = 'SELECT c_rss_cache_id FROM c_rss_cache' .
            ' WHERE c_member_id = ? AND link = ?';
    $params = array(intval($c_member_id), $link);
    return db_get_one($sql, $params);
}

function db_is_future_rss_item($date)
{
    $item_timestamp = strtotime($date);
    return (bool)($item_timestamp > time());
}

?>
