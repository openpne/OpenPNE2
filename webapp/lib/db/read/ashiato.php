<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * あしあとリスト取得
 * 同一人物・同一日付のアクセスは最新の日時だけ
 * 
 * @param  int $c_member_id_to 訪問された人
 * @param  int $limit
 * @return array あしあとリスト
 */
function p_h_ashiato_c_ashiato_list4c_member_id($c_member_id_to, $count)
{
    $sql = 'SELECT DISTINCT r_date FROM c_ashiato WHERE c_member_id_to = ? ORDER BY r_date DESC';
    $params = array(intval($c_member_id_to));
    $days = db_get_col_limit($sql, 0, $count, $params);

    $sql = 'SELECT DISTINCT c_member_id_from, MAX(r_datetime) AS r_datetime' .
           ' FROM c_ashiato WHERE r_date = ? AND c_member_id_to = ?' .
           ' GROUP BY c_member_id_from ORDER BY r_datetime DESC';
    $result = array();
    foreach ($days as $day) {
        $params = array(strval($day), intval($c_member_id_to));
        $day_result = db_get_all_limit($sql, 0, $count, $params);
        $result = array_merge($result, $day_result);

        $count -= count($day_result);
        if ($count <= 0) {
            break;
        }
    }

    foreach ($result as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $result[$key]['nickname'] = $c_member['nickname'];
    }
    return $result;
}

/**
 * 総あしあと数取得
 * 
 * @param  int $c_member_id 訪問された人
 * @return int あしあと数
 */
function p_h_ashiato_c_ashiato_num4c_member_id($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_ashiato WHERE c_member_id_to = ?';
    $params = array(intval($c_member_id));
    $count = db_get_one($sql, $params);

    $sql = 'SELECT ashiato_count_log FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return $count + db_get_one($sql, $params);
}

/**
 * ashiato_mail_num取得
 * 
 * @param  int $c_member_id
 * @return int ashiato_mail_num
 */
function p_h_ashiato_ashiato_mail_num4c_member_id($c_member_id)
{
    $sql = 'SELECT ashiato_mail_num FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

?>
