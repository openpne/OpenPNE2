<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージIDからメッセージ情報取得
 */
function _db_c_message4c_message_id($c_message_id)
{
    $sql = 'SELECT * FROM c_message WHERE c_message_id = ?';
    $params = array(intval($c_message_id));
    $c_message = db_get_row($sql, $params);

    $c_member_from = db_common_c_member4c_member_id_LIGHT($c_message['c_member_id_from']);
    $c_member_to = db_common_c_member4c_member_id_LIGHT($c_message['c_member_id_to']);

    $c_message['c_member_image_filename_from'] = $c_member_from['image_filename'];
    $c_message['c_member_nickname_from'] = $c_member_from['nickname'];
    $c_message['c_member_image_filename_to'] = $c_member_to['image_filename'];
    $c_message['c_member_nickname_to'] = $c_member_to['nickname'];

    return $c_message;
}

/**
 * 未読メッセージの数を数える
 * 
 * @return  num_message_not_is_read
 */
function p_h_message_count_c_message_not_is_read4c_member_to_id($c_member_id_to)
{
    $sql = 'SELECT COUNT(*) FROM c_message WHERE c_member_id_to = ?' .
            ' AND is_read = 0 AND is_send = 1';
    $params = array(intval($c_member_id_to));
    return db_get_one($sql, $params);
}

/**
 * メッセージ取得
 */
function p_h_message_c_message4c_message_id($c_message_id, $u)
{
    $c_message = _db_c_message4c_message_id($c_message_id);

    if ($c_message['c_member_id_to'] == $u) {
        // 受信メッセージ
        $c_message['is_received'] = true;
        $c_message['image_filename_disp'] = $c_message['c_member_image_filename_from'];
    } elseif ($c_message['c_member_id_from'] == $u) {
        // 送信メッセージ
        $c_message['is_received'] = false;
        $c_message['image_filename_disp'] = $c_message['c_member_image_filename_to'];
    }
    return $c_message;
}

/**
 * 受信メッセージリストを取得
 */
function p_h_message_box_c_message_received_list4c_member_id4range($c_member_id, $page, $page_size)
{
    $sql = "SELECT * FROM c_message";
    $where = "c_member_id_to = ?".
            " AND is_deleted_to = 0" .
            " AND is_send = 1";
    $sql .= " WHERE $where";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
        $c_message_list[$key]['image_filename'] = $c_member['image_filename'];
    }

    $sql = "SELECT COUNT(*) FROM c_message WHERE $where";
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
    return array($c_message_list , $prev , $next);
}

/**
 * 送信メッセージリストを取得
 */
function p_h_message_box_c_message_sent_list4c_member_id4range($c_member_id, $page, $page_size)
{
    $sql = "SELECT * FROM c_message";
    $where = "c_member_id_from = ?" .
            " AND is_deleted_from = 0" .
            " AND is_send = 1";
    $sql .= " WHERE $where";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
        $c_message_list[$key]['image_filename'] = $c_member['image_filename'];
    }

    $sql =  "SELECT COUNT(*) FROM c_message WHERE $where";
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

    return array($c_message_list , $prev , $next);
}

/**
 * 下書き保存メッセージリストを取得
 */
function p_h_message_box_c_message_save_list4c_member_id4range($c_member_id, $page, $page_size)
{
    $sql = "SELECT * FROM c_message";
    $where = "c_member_id_from = ?".
            " AND is_send = 0" .
            " AND is_deleted_from = 0";
    $sql .= " WHERE $where";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
        $c_message_list[$key]['image_filename'] = $c_member['image_filename'];
    }

    $sql = "SELECT COUNT(*) FROM c_message WHERE $where";
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

    return array($c_message_list, $prev, $next);
}

/**
 * ごみ箱メッセージリストを取得
 */
function p_h_message_box_c_message_trash_list4c_member_id4range($c_member_id, $page, $page_size)
{
    $where = "(" .
            "c_member_id_from = ?" .
            " AND is_deleted_from = 1" .
            " AND is_kanzen_sakujo_from = 0" .
        ") OR (" .
            "c_member_id_to = ?" .
            " AND is_deleted_to = 1" .
            " AND is_kanzen_sakujo_to = 0" .
        ")";

    $sql = 'SELECT * FROM c_message WHERE '. $where . ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id), intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = 'SELECT COUNT(*) FROM c_message WHERE ' . $where;
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

    foreach ($c_message_list as $key => $value) {
        if ($value['c_member_id_to'] == $c_member_id) {
            $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        } else {
            $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        }
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
        $c_message_list[$key]['image_filename'] = $c_member['image_filename'];
    }

    return array($c_message_list, $prev, $next);
}

/**
 * 未読メッセージ数を取得
 * 
 * @param int $c_member_id
 * @return int 未読メッセージ数
 */
function k_p_h_home_c_message_received_unread_all_count4c_member_id($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_message WHERE c_member_id_to = ?' .
            ' AND is_read = 0 AND is_send = 1';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function k_p_h_message_box_c_message_received_list4c_member_id4range($c_member_id, $page_size, $page)
{
    $sql = "SELECT * FROM c_message";
    $sql .= " WHERE c_member_id_to = ?".
            " AND is_deleted_to = 0" .
            " AND is_send = 1";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
    }

    $sql = "SELECT COUNT(*) FROM c_message" .
            " WHERE c_member_id_to = ?".
            " AND is_deleted_to = 0" .
            " AND is_send = 1";
    $total_num = db_get_one($sql, $params);

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

    return array($c_message_list, $prev, $next, $total_num);
}

function k_p_h_message_box_c_message_sent_list4c_member_id4range($c_member_id, $page_size, $page)
{
    $sql = "SELECT * FROM c_message";
    $sql .= " WHERE c_member_id_from = ?".
            " AND is_deleted_from = 0" .
            " AND is_send = 1";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
    }

    $sql = "SELECT COUNT(*) FROM c_message" .
            " WHERE c_member_id_from = ?".
            " AND is_deleted_from = 0" .
            " AND is_send = 1";
    $total_num = db_get_one($sql, $params);

    if ($total_num != 0){
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

    return array($c_message_list, $prev, $next, $total_num);
}

/**
 * 返信側にある返信元メッセージIDを取得
 */
function do_get_hensinmoto_id($hensin_c_message_id)
{
    $sql = 'SELECT hensinmoto_c_message_id FROM c_message WHERE c_message_id = ?';
    $params = array(intval($hensin_c_message_id));
    return db_get_one($sql, $params);
}

?>
