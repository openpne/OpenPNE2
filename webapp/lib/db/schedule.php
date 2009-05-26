<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_schedule_c_schedule_list4date($year, $month, $day, $c_member_id)
{
    $date = sprintf('%04d-%02d-%02d', $year, $month, $day);

    $sql = 'SELECT * FROM c_schedule WHERE c_member_id = ?' .
            ' AND start_date <= ? AND end_date >= ?';
    $params = array(intval($c_member_id), $date, $date);
    return db_get_all($sql, $params);
}

function db_schedule_c_schedule4c_schedule_id($c_schedule_id)
{
    $sql = 'SELECT * FROM c_schedule WHERE c_schedule_id = ?';
    return db_get_row($sql, array(intval($c_schedule_id)));
}

function db_schedule_birth4c_member_id($month, $c_member_id)
{
    $ids = db_friend_c_member_id_list($c_member_id);
    $ids[] = $c_member_id;
    $ids = implode(', ', $ids);

    $sql = 'SELECT * FROM c_member' .
        ' WHERE c_member_id IN ('. $ids . ')' .
        ' AND birth_month = ?';
    $params = array(intval($month));
    $list = db_get_all($sql, $params);

    $res = array();
    foreach ($list as $item) {
        if ($item['c_member_id'] != $c_member_id && $item['public_flag_birth_month_day'] == 'private') {
            continue;
        }
        $day = intval($item['birth_day']);
        $res[$day][] = $item;
    }
    return $res;
}

function db_schedule_event4c_member_id($year, $month, $c_member_id)
{
    $sql = 'SELECT c_commu_id FROM c_commu_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    $ids = db_get_col($sql, $params);
    $ids = implode(', ', $ids);
    if (!$ids) {
        return array();
    }

    $sql = 'SELECT * FROM c_commu_topic WHERE c_commu_id IN ('.$ids.')' .
            ' AND event_flag = 1 AND open_date >= ? AND open_date <= ?';

    $max_day = date("t", mktime(0,0,0,intval($month),1,intval($year) ));
    $params = array(
        sprintf('%04d-%02d', intval($year), intval($month)) . '-01',
        sprintf('%04d-%02d', intval($year), intval($month)) . '-' . $max_day
    );

    $list = db_get_all($sql, $params);

    $res = array();
    foreach ($list as $item) {
        $item['is_join'] = db_commu_is_c_event_member_2($item['c_commu_topic_id'], $c_member_id);

        $day = date('j', strtotime($item['open_date']));
        $res[$day][] = $item;
    }
    return $res;
}

function db_schedule_c_member_list4mail()
{
    $sql = 'SELECT * FROM c_schedule WHERE start_date = ? AND is_receive_mail = 1';
    $params = array(date('Y-m-d'));
    return db_get_all($sql, $params);
}

?>
<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_schedule_add_insert_c_schedule(
    $c_member_id, $title, $body,
    $start_date, $start_time,
    $end_date, $end_time,
    $is_receive_mail)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'title' => $title,
        'body' => $body,
        'start_date' => $start_date,
        'end_date' => $end_date,
        'u_datetime' => db_now(),
        'is_receive_mail' => (bool)$is_receive_mail,
    );
    if (!is_null($start_time)) {
        $data['start_time'] = $start_time;
    }
    if (!is_null($end_time)) {
        $data['end_time'] = $end_time;
    }
    return db_insert('c_schedule', $data);
}

function db_schedule_edit_update_c_schedule(
    $c_member_id, $title, $body,
    $start_date, $start_time,
    $end_date, $end_time,
    $is_receive_mail,
    $c_schedule_id)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'title' => $title,
        'body' => $body,
        'start_date' => $start_date,
        'start_time' => $start_time,
        'end_date' => $end_date,
        'end_time' => $end_time,
        'u_datetime' => db_now(),
        'is_receive_mail' => (bool)$is_receive_mail,
    );
    $where = array('c_schedule_id' => intval($c_schedule_id));
    return db_update('c_schedule', $data, $where);
}

function db_schedule_delete_c_schedule4c_schedule_id($c_schedule_id)
{
    $sql = 'DELETE FROM c_schedule WHERE c_schedule_id = ?';
    $params = array(intval($c_schedule_id));
    return db_query($sql, $params);
}

?>
