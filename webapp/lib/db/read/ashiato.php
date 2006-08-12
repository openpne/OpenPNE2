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
    $sql = 'SELECT *, MAX(r_datetime) AS r_datetime FROM c_ashiato' .
            ' WHERE c_member_id_to = ? GROUP BY c_member_id_from, r_date' .
            ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id_to));
    $arr = db_get_all_limit($sql, 0, $count, $params);

    foreach ($arr as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $arr[$key]['nickname'] = $c_member['nickname'];
    }
    return $arr;
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
    return db_get_one($sql, $params);
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
