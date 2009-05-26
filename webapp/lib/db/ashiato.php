<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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
function db_ashiato_c_ashiato_list4c_member_id($c_member_id_to, $count)
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
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
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
function db_ashiato_c_ashiato_num4c_member_id($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_ashiato WHERE c_member_id_to = ?';
    $params = array(intval($c_member_id));
    $count = db_get_one($sql, $params, 'main');

    $sql = 'SELECT ashiato_count_log FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return $count + db_get_one($sql, $params, 'main');
}

/**
 * ashiato_mail_num取得
 *
 * @param  int $c_member_id
 * @return int ashiato_mail_num
 */
function db_ashiato_ashiato_mail_num4c_member_id($c_member_id)
{
    $sql = 'SELECT ashiato_mail_num FROM c_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params, 'main');
}

/**
 * あしあとを付ける
 */
function db_ashiato_insert_c_ashiato($c_member_id_to, $c_member_id_from)
{
    // 同一人物の場合は記録しない
    if ($c_member_id_to == $c_member_id_from) {
        return false;
    }

    // 一定時間以内の連続アクセスは記録しない
    $wait = date('Y-m-d H:i:s', strtotime('-5 minute'));
    $sql = 'SELECT c_ashiato_id FROM c_ashiato WHERE r_datetime > ?' .
            ' AND c_member_id_to = ? AND c_member_id_from = ?';
    $params = array($wait, intval($c_member_id_to), intval($c_member_id_from));
    if (db_get_one($sql, $params, 'main')) {
        return false;
    }

    // 忍び足
    if (USE_SHINOBIASHI) {
        if (db_member_is_shinobiashi($c_member_id_from)) {
            return false;
        }
    }

    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    if (!db_insert('c_ashiato', $data)) {
        return false;
    }

    if ($ashiato_mail_num = db_ashiato_ashiato_mail_num4c_member_id($c_member_id_to)) {
        //総足あと数を取得
        $ashiato_num = db_ashiato_c_ashiato_num4c_member_id($c_member_id_to);

        //あしあとお知らせメールを送る
        if ($ashiato_num == $ashiato_mail_num) {
            do_common_send_ashiato_mail($c_member_id_to, $c_member_id_from);
        }
    }

    return true;
}

/**
 * Update c_member `ashiato_count_log` and delete c_ashiato rows
 *
 * @param int $limit
 */
function db_ashiato_update_log($limit = 30)
{
    $sql = 'SELECT c_member_id FROM c_member';
    $c_member_id_list = db_get_col($sql);

    foreach ($c_member_id_list as $c_member_id) {
        $disp = db_ashiato_c_ashiato_list4c_member_id($c_member_id, $limit);
        if (!$disp) continue;
        $oldest_row = array_pop($disp);

        $yesterday = date('Y-m-d 00:00:00', strtotime('-1 day'));
        $cutline = min($oldest_row['r_datetime'], $yesterday);

        // delete c_ashiato rows
        $sql = 'DELETE FROM c_ashiato WHERE c_member_id_to = ? AND r_datetime < ?';
        $params = array(intval($c_member_id), $cutline);
        db_query($sql, $params);
        $affected_rows = db_affected_rows();

        // update c_member `ashiato_count_log`
        if ($affected_rows > 0) {
            $sql = 'UPDATE c_member SET ashiato_count_log = ashiato_count_log + ?' .
                   ' WHERE c_member_id = ?';
            $params = array(intval($affected_rows), intval($c_member_id));
            db_query($sql, $params);
        }
    }
}
?>
