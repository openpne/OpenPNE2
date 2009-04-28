<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージIDからメッセージ情報取得
 */
function db_message_c_message4c_message_id($c_message_id)
{
    $sql = 'SELECT * FROM c_message WHERE c_message_id = ?';
    $params = array(intval($c_message_id));
    $c_message = db_get_row($sql, $params);

    $c_member_from = db_member_c_member4c_member_id_LIGHT($c_message['c_member_id_from']);
    $c_member_to = db_member_c_member4c_member_id_LIGHT($c_message['c_member_id_to']);

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
function db_message_count_c_message_not_is_read4c_member_to_id($c_member_id_to)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $sql = 'SELECT COUNT(*) FROM c_message WHERE c_member_id_to = ?' .
            ' AND is_read = 0 AND is_send = 1';
    $params = array(intval($c_member_id_to));
    return db_get_one($sql, $params);
}

/**
 * メッセージ取得
 */
function db_message_c_message4c_message_id2($c_message_id, $u)
{
    $c_message = db_message_c_message4c_message_id($c_message_id);

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
 * 受信メッセージリストを取得(年月日絞りに対応)
 */
function db_message_c_message_received_list4c_member_id4range($c_member_id, $page, $page_size, $year = '', $month = '', $day = '')
{
    $params = array();
    $params[] = intval($c_member_id);

    $sql = "SELECT * FROM c_message";
    $where = "c_member_id_to = ?".
            " AND is_deleted_to = 0" .
            " AND is_send = 1";

    //年月日で絞る
    if ($year && $month) {
        if ($day) {
            $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day, $year));
            $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day+1, $year));
        } else {
            $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, 1, $year));
            $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month+1, 1, $year));
        }
        $where .= ' AND r_datetime >= ? AND r_datetime < ?';
        $params[] = $s_date;
        $params[] = $e_date;
    }

    $sql .= " WHERE $where";
    $sql .= " ORDER BY r_datetime DESC";

    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
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
    return array($c_message_list , $prev , $next, $total_num);
}

/**
 * 送信メッセージリストを取得
 */
function db_message_c_message_sent_list4c_member_id4range($c_member_id, $page, $page_size, $year = '', $month = '', $day = '')
{
    $params = array(intval($c_member_id));

    $sql = "SELECT * FROM c_message";
    $where = "c_member_id_from = ?" .
            " AND is_deleted_from = 0" .
            " AND is_send = 1";


    //年月日で絞る
    if ($year && $month) {
        if ($day) {
            $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day, $year));
            $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, $day+1, $year));
        } else {
            $s_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month, 1, $year));
            $e_date = date('Y-m-d H:i:s', mktime(0, 0, 0, $month+1, 1, $year));
        }
        $where .= ' AND r_datetime >= ? AND r_datetime < ?';
        $params[] = $s_date;
        $params[] = $e_date;
    }

    $sql .= " WHERE $where";
    $sql .= " ORDER BY r_datetime DESC";
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
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

    return array($c_message_list , $prev , $next, $total_num);
}

/**
 * 下書き保存メッセージリストを取得
 */
function db_message_c_message_save_list4c_member_id4range($c_member_id, $page, $page_size)
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
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
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

    return array($c_message_list, $prev, $next, $total_num);
}

/**
 * ごみ箱メッセージリストを取得
 */
function db_message_c_message_trash_list4c_member_id4range($c_member_id, $page, $page_size)
{
    $where_from = "c_member_id_from = ?" .
            " AND is_deleted_from = 1" .
            " AND is_kanzen_sakujo_from = 0";

    $sql = 'SELECT * FROM c_message WHERE '. $where_from . ' ORDER BY r_datetime DESC';
    $sql_num = 'SELECT COUNT(*) FROM c_message WHERE '. $where_from;
    $params = array(intval($c_member_id));
    $c_message_list_from = db_get_all_page($sql, 1, ($page_size * ($page + 1)), $params);
    $c_message_num_from = db_get_one($sql_num, $params);

    $where_to = "c_member_id_to = ?" .
            " AND is_deleted_to = 1" .
            " AND is_kanzen_sakujo_to = 0";

    $sql = 'SELECT * FROM c_message WHERE '. $where_to . ' ORDER BY r_datetime DESC';
    $sql_num = 'SELECT COUNT(*) FROM c_message WHERE '. $where_to;
    $c_message_list_to = db_get_all_page($sql, 1, ($page_size * ($page + 1)), $params);
    $c_message_num_to = db_get_one($sql_num, $params);

    $c_message_list = array_merge($c_message_list_from, $c_message_list_to);

    foreach ($c_message_list as $key => $row) {
       $c_message_id[$key] = intval($row['c_message_id']);
    }
    @array_multisort($c_message_id, SORT_DESC, $c_message_list);
    $c_message_list = array_slice($c_message_list, $page_size * ($page - 1), $page_size);

    $total_num = $c_message_num_from + $c_message_num_to;

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
            $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        } else {
            $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        }
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
        $c_message_list[$key]['image_filename'] = $c_member['image_filename'];
    }

    return array($c_message_list, $prev, $next, $total_num);
}

/**
 * 未読メッセージ数を取得
 *
 * @param int $c_member_id
 * @return int 未読メッセージ数
 */
function db_message_c_message_received_unread_all_count4c_member_id($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_message WHERE c_member_id_to = ?' .
            ' AND is_read = 0 AND is_send = 1';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_message_c_message_received_list4c_member_id4range2($c_member_id, $page_size, $page)
{
    $sql = "SELECT * FROM c_message";
    $sql .= " WHERE c_member_id_to = ?".
            " AND is_deleted_to = 0" .
            " AND is_send = 1";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
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

function db_message_c_message_sent_list4c_member_id4range2($c_member_id, $page_size, $page)
{
    $sql = "SELECT * FROM c_message";
    $sql .= " WHERE c_member_id_from = ?".
            " AND is_deleted_from = 0" .
            " AND is_send = 1";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
    }

    $sql = "SELECT COUNT(*) FROM c_message" .
            " WHERE c_member_id_from = ?".
            " AND is_deleted_from = 0" .
            " AND is_send = 1";
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

    return array($c_message_list, $prev, $next, $total_num);
}

/**
 * 返信側にある返信元メッセージIDを取得
 */
function db_message_hensinmoto_id($hensin_c_message_id)
{
    $sql = 'SELECT hensinmoto_c_message_id FROM c_message WHERE c_message_id = ?';
    $params = array(intval($hensin_c_message_id));
    return db_get_one($sql, $params);
}

/*** write ***/

/**
 * メッセージ作成
 *
 * @param   int $c_member_id_from
 * @param   int $c_member_id_to
 * @param   string  $subject
 * @param   string  $body
 * @return  int $insert_id
 */
function db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'subject'          => $subject,
        'body'             => $body,
        'r_datetime'       => db_now(),
        'is_send'          => 1,
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
    );
    return db_insert('c_message', $data);
}

/**
 * 承認メッセージ作成
 *
 * @param   int $c_member_id_from
 * @param   int $c_member_id_to
 * @param   string  $subject
 * @param   string  $body
 * @return  int $insert_id
 */
function db_message_insert_c_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body)
{
    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'subject'          => $subject,
        'body'             => $body,
        'r_datetime'       => db_now(),
        'is_send'          => 1,
        'is_syoudaku'      => 1,
        'is_read'          => 1,
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
    );
    return db_insert('c_message', $data);
}

/**
 * メッセージを下書き保存する
 */
function db_message_insert_message_to_is_save($c_member_id_to,$c_member_id_from,$subject,$body,$jyusin_message_id)
{
    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'subject'          => $subject,
        'body'             => $body,
        'r_datetime'       => db_now(),
        'is_send'          => 0,
        'hensinmoto_c_message_id' => intval($jyusin_message_id),
        'image_filename_1' => '',
        'image_filename_2' => '',
        'image_filename_3' => '',
    );
    return db_insert('c_message', $data);
}

/**
 * メッセージをゴミ箱へ移動
 * 受信メッセージの場合は既読にする
 *
 * @param   int $c_message_id
 * @param   int $c_member_id
 * @return  bool  削除が成功したかどうか
 */
function db_message_delete_c_message4c_message_id($c_message_id, $c_member_id)
{
    $message = db_message_c_message4c_message_id($c_message_id);
    $where = 'c_message_id = '.intval($c_message_id);

    if ($message['c_member_id_to'] == $c_member_id) {
        // 受信メッセージ
        $data = array(
            'is_deleted_to' => 1,
            'is_read' => 1,
        );
        db_update('c_message', $data, $where);
        return true;
    } elseif ($message['c_member_id_from'] == $c_member_id) {
        // 送信メッセージ
        $data = array(
            'is_deleted_from' => 1,
        );
        db_update('c_message', $data, $where);
        return true;
    }

    return false;
}

/**
 * メッセージをごみ箱から元に戻す
 */
function db_message_move_message($c_message_id, $c_member_id)
{
    // 受信メッセージだった場合
    $data = array('is_deleted_from' => 0);
    $where = array(
        'c_message_id' => intval($c_message_id),
        'c_member_id_from' => intval($c_member_id),
    );
    db_update('c_message', $data, $where);

    // 送信メッセージだった場合
    // 下書きメッセージだった場合
    $data = array('is_deleted_to' => 0);
    $where = array(
        'c_message_id' => intval($c_message_id),
        'c_member_id_to' => intval($c_member_id),
    );
    db_update('c_message', $data, $where);
}

/**
 * メッセージをごみ箱から削除
 */
function db_message_delete_c_message_from_trash($c_message_id, $c_member_id)
{
    $data = array('is_kanzen_sakujo_from' => 1);
    $where = 'c_message_id = '.intval($c_message_id);
    db_update('c_message', $data, $where);

    $sql = 'SELECT * FROM c_message WHERE c_message_id = ?';
    $params = array(intval($c_message_id));
    $c_message = db_get_row($sql, $params);

    //c_image_sizeのレコード削除
    $where = array();
    $params = array();
    $sql = 'DELETE FROM c_image_size';
    if ($c_message['image_filename_1']) {
        $where[] = "filename = ?";
        $params[] = $c_message['image_filename_1'];
    }
    if ($c_message['image_filename_2']) {
        $where[] = "filename = ?";
        $params[] = $c_message['image_filename_2'];
    }
    if ($c_message['image_filename_3']) {
        $where[] = "filename = ?";
        $params[] = $c_message['image_filename_3'];
    }

    if ($where) {
        $sql .= " WHERE " . implode(' OR ', $where);
        db_query($sql, $params);
    }

    //function cacheの削除
    $category = util_image_filename2category($filename);
    pne_cache_drop('db_image_get_image_filesize', $c_member_id, $category);
}

function db_message_delete_c_message_to_trash($c_message_id)
{
    $data = array('is_kanzen_sakujo_to' => 1);
    $where = 'c_message_id = '.intval($c_message_id);
    db_update('c_message', $data, $where);
}

/**
 * 返信側に受信メッセージIDを渡す
 */
function db_message_update_is_hensinmoto_c_message_id($jyusin_c_message_id, $hensin_c_message_id)
{
    $data = array('hensinmoto_c_message_id' => intval($jyusin_c_message_id));
    $where = array('c_message_id' => intval($hensin_c_message_id));
    return db_update('c_message', $data, $where);
}

/**
 * 返信済みにする
 */
function db_message_update_is_hensin($c_message_id)
{
    $data = array('is_hensin' => 1);
    $where = array('c_message_id' => intval($c_message_id));
    db_update('c_message', $data, $where);
}

/**
 * メッセージを既読にする
 */
function db_message_update_c_message_is_read4c_message_id($c_message_id, $c_member_id)
{
    $data = array('is_read' => 1);
    $where = array(
        'c_message_id' => intval($c_message_id),
        'c_member_id_to' => intval($c_member_id),
    );
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id);
    return db_update('c_message', $data, $where);
}

/**
 * メッセージの下書きを更新
 */
function db_message_update_message_to_is_save($c_message_id, $subject, $body, $is_send = 0)
{
    $data = array(
        'subject'    => $subject,
        'body'       => $body,
        'r_datetime' => db_now(),
        'is_send'    => (bool)$is_send,
    );
    $where = array('c_message_id' => intval($c_message_id));
    db_update('c_message', $data, $where);
}

//---

//◆メッセージ受信メール
function db_message_send_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    $c_message_id = db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);

    do_common_send_message_mail_send($c_member_id_to, $c_member_id_from, $subject, $body, $c_message_id);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    return $c_message_id;
}

//◆承認依頼メッセージ受信メール
function db_message_send_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    db_message_insert_c_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    do_common_send_message_syoudaku_mail_send($c_member_id_to, $c_member_id_from);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
}

// コミュニティ紹介
function db_message_send_message_syoukai_commu($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    do_common_send_message_syoukai_commu_mail_send($c_member_id_to, $c_member_id_from);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
}

// コミュニティ参加者全員にメール
function db_message_send_message_commu_send_msg($c_member_id_from, $c_member_id_to, $subject, $body, $c_commu_id)
{
    //メッセージ
    db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    do_common_send_message_commu_send_msg($c_member_id_to, $c_member_id_from, $c_commu_id);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
}

// メンバー紹介
function db_message_send_message_syoukai_member($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    do_common_send_message_syoukai_member_mail_send($c_member_id_to, $c_member_id_from);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
}

//イベント紹介
function db_message_send_message_event_invite($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    do_common_send_message_event_invite_mail_send($c_member_id_to, $c_member_id_from);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
}

//イベントメッセージ
function db_message_send_message_event_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    //メッセージ
    db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (int)$c_member_id_to);
    pne_cache_drop('db_message_count_c_message_not_is_read4c_member_to_id', (string)$c_member_id_to);

    do_common_send_message_event_message_mail_send($c_member_id_to, $c_member_id_from);
    do_common_send_message_mail_send_ktai($c_member_id_to, $c_member_id_from, $subject, $body);
}

function db_message_update_c_message($c_message_id, $subject, $body, $image_filename_1 = '', $image_filename_2 = '', $image_filename_3 = '', $filename = '')
{
    $data = array(
        'subject' => $subject,
        'body' => $body,
    );
    if ($image_filename_1) $data['image_filename_1'] = $image_filename_1;
    if ($image_filename_2) $data['image_filename_2'] = $image_filename_2;
    if ($image_filename_3) $data['image_filename_3'] = $image_filename_3;
    if ($filename) $data['filename'] = $filename;

    $where = array(
        'c_message_id' => intval($c_message_id),
    );
    return db_update('c_message', $data, $where);
}


//メッセージの次のc_message_idを取得
function db_message_get_c_message_next_id4c_message_id($c_member_id, $c_message_id, $box)
{
    if ($box == 'savebox' || $box == 'trash') {
        return null;
    } else if ($box == 'outbox'){   //送信箱
        $where = " WHERE c_member_id_from = ? AND is_deleted_from = 0";
    } else {                        //受信箱
        $where = " WHERE c_member_id_to = ? AND is_deleted_to = 0";
    }

    $sql =  "SELECT c_message_id FROM c_message" .
            $where.
            " AND is_send = 1" .
            " AND c_message_id > ?" .
            " ORDER BY r_datetime";
    $params = array(
                intval($c_member_id),
                intval($c_message_id)
              );

    return db_get_one($sql, $params);
}

//メッセージの前のc_message_idを取得
function db_message_get_c_message_prev_id4c_message_id($c_member_id, $c_message_id, $box)
{
    if ($box == 'savebox' || $box == 'trash') {
        return null;
    } else if ($box == 'outbox'){   //送信箱
        $where = " WHERE c_member_id_from = ? AND is_deleted_from = 0";
    } else {                        //受信箱
        $where = " WHERE c_member_id_to = ? AND is_deleted_to = 0";
    }

    $sql =  "SELECT c_message_id FROM c_message" .
            $where.
            " AND is_send = 1" .
            " AND c_message_id < ?" .
            " ORDER BY r_datetime DESC";
    $params = array(
                intval($c_member_id),
                intval($c_message_id)
              );

    return db_get_one($sql, $params);
}

//メッセージを検索
//検索対象：subject,body

function db_message_search_c_message($c_member_id, $page, $page_size, $keyword, $box, $target_c_member_id = null)
{
    $params = array();
    $params[] = intval($c_member_id);

    if ($box == 'inbox' || !$box) {
        $where = "c_member_id_to = ?".
                 " AND is_deleted_to = 0" .
                 " AND is_send = 1";
        if ($target_c_member_id) {
            $where .= " AND c_member_id_from = ?";
            $params[] = intval($target_c_member_id);
        }
    } elseif ($box == 'outbox') {
        $where = "c_member_id_from = ?".
                 " AND is_deleted_from = 0" .
                 " AND is_send = 1";
        if ($target_c_member_id) {
            $where .= " AND c_member_id_to = ?";
            $params[] = intval($target_c_member_id);
        }
    }

    $where .= " AND ( subject like ? OR body like ?)";

    $params[] = '%'.strval($keyword).'%';
    $params[] = '%'.strval($keyword).'%';

    $sql = "SELECT * FROM c_message";
    $sql .= " WHERE $where";
    $sql .= " ORDER BY r_datetime DESC";

    $c_message_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_message_list as $key => $value) {
        if ($box == 'inbox' || !$box) {
            $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        } else {
            $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        }
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
    return array($c_message_list , $prev , $next, $total_num);

}


/**
 * 受信メッセージの送信者リストを取得
 */
function db_message_c_message_sender_list4c_member_id($c_member_id)
{
    $where = "c_member_id_to = ?".
            " AND is_deleted_to = 0" .
            " AND is_send = 1";

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT c_member_id_from" .
                " FROM" .
                    "(" .
                        "SELECT distinct on(c_member_id_from) *" .
                        " FROM" .
                            " c_message" .
                        " WHERE " . $where .
                    ") as sub_member_tbl";
    } else {
        $sql = "SELECT distinct c_member_id_from FROM c_message";
        $sql .= " WHERE $where";
    }
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_message_list = db_get_all($sql, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
    }
    return $c_message_list;
}

/**
 * 受信メッセージの送信者リストを取得
 */
function db_message_c_message_receiver_list4c_member_id($c_member_id)
{
    $where = "c_member_id_from = ?".
            " AND is_deleted_from = 0" .
            " AND is_send = 1";

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT c_member_id_to" .
                " FROM" .
                    "(" .
                        "SELECT distinct on(c_member_id_to) *" .
                        " FROM" .
                            " c_message" .
                        " WHERE " . $where .
                    ") as sub_member_tbl";
    } else {
        $sql = "SELECT distinct c_member_id_to FROM c_message";
        $sql .= " WHERE $where";
    }

    $sql .= " ORDER BY r_datetime DESC";

    $params = array(intval($c_member_id));
    $c_message_list = db_get_all($sql, $params);

    foreach ($c_message_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_message_list[$key]['nickname'] = $c_member['nickname'];
    }
    return $c_message_list;
}


/**
 * メッセージページの「各月のメッセージ」用
 *
 * メッセージを最初に書いた月からスタートしてみる
 */
function db_message_month_list4c_member_id($c_member_id, $box)
{
    if ($box == 'inbox' || !$box) {
        $where = "c_member_id_to = ?".
                 " AND is_deleted_to = 0" .
                 " AND is_send = 1";
    } elseif ($box == 'outbox') {
        $where = "c_member_id_from = ?".
                 " AND is_deleted_from = 0" .
                 " AND is_send = 1";
    } else {
        return null;
    }

    $sql = "SELECT r_datetime FROM c_message" .
        " WHERE $where" .
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



/**
 * 指定された年月にメッセージを送受信した日のリストを返す
 */
function db_message_is_message_list4date($u, $year, $month, $box)
{
    include_once 'Date/Calc.php';

    if ($box == 'inbox' || !$box) {
        $where = "c_member_id_to = ?".
                 " AND is_deleted_to = 0" .
                 " AND is_send = 1";
    } elseif ($box == 'outbox') {
        $where = "c_member_id_from = ?".
                 " AND is_deleted_from = 0" .
                 " AND is_send = 1";
    } else {
        return null;
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $sql = "SELECT DISTINCT date_part('day', r_datetime) FROM c_message" .
               " WHERE $where" .
               ' AND is_send=1 AND r_datetime >= ? AND r_datetime < ?';
    } else {
        $sql = 'SELECT DISTINCT DAYOFMONTH(r_datetime) FROM c_message' .
               " WHERE $where" .
               ' AND is_send=1 AND r_datetime >= ? AND r_datetime < ?';
    }

    $date_format = '%Y-%m-%d 00:00:00';
    $thismonth = Date_Calc::beginOfMonth($month, $year, $date_format);
    $nextmonth = Date_Calc::beginOfNextMonth(0, $month, $year, $date_format);

    $params = array(intval($u), $thismonth, $nextmonth);

    return db_get_col($sql, $params);
}

?>
