<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function do_h_schedule_add_insert_c_schedule(
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
        'start_time' => $start_time,
        'end_date' => $end_date,
        'end_time' => $end_time,
        'is_receive_mail' => (bool)$is_receive_mail,
    );
    return db_insert('c_schedule', $data);
}

function do_h_schedule_edit_update_c_schedule(
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
        'is_receive_mail' => (bool)$is_receive_mail,
    );
    $where = array('c_schedule_id' => intval($c_schedule_id));
    return db_update('c_schedule', $data, $where);
}

function do_h_schedule_delte_delete_c_schedule4c_schedule_id($c_schedule_id)
{
    $sql = 'DELETE FROM c_schedule WHERE c_schedule_id = ?';
    $params = array(intval($c_schedule_id));
    return db_query($sql, $params);
}

?>
