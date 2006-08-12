<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//--- c_commu

/**
 * コミュニティ作成
 * 
 * @param  int     $c_member_id 管理者のメンバーID
 * @param  string  $name  コミュニティ名
 * @param  int     $c_commu_category_id
 * @param  string  $info  説明文
 * @param  enum('public', 'authpublic', 'authprivate')  $public_flag
 * @return int  insert_id
 */
function db_commu_insert_c_commu($c_member_id, $name, $c_commu_category_id, $info, $public_flag)
{
    $data = array(
        'name' => $name,
        'c_member_id_admin' => intval($c_member_id),
        'info' => $info,
        'c_commu_category_id' => intval($c_commu_category_id),
        'public_flag' => $public_flag,
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    return db_insert('c_commu', $data);
}

/**
 * コミュニティ設定変更
 * 
 * @param   int    $c_commu_id
 * @param   string $name
 * @param   int    $c_commu_category_id
 * @param   string $info
 * @param   enum(string or int) $public_flag
 *                      ('public'(0), 'authpublic'(1), 'authprivate'(2))
 * @return bool
 */
function db_commu_update_c_commu($c_commu_id,
    $name, $c_commu_category_id, $info, $public_flag,
    $image_filename = '', $is_send_join_mail = 1)
{
    $data = array(
        'name' => $name,
        'info' => $info,
        'c_commu_category_id' => intval($c_commu_category_id),
        'public_flag' => $public_flag,
        'is_send_join_mail' => (bool)$is_send_join_mail,
    );
    if ($image_filename) $data['image_filename'] = $image_filename;

    $where = array(
        'c_commu_id' => intval($c_commu_id),
    );
    return db_update('c_commu', $data, $where);
}

/**
 * コミュニティ写真更新
 */
function db_commu_update_c_commu_image_filename($c_commu_id, $image_filename)
{
    $data = array('image_filename' => $image_filename);
    $where = array('c_commu_id' => intval($c_commu_id));
    return db_update('c_commu', $data, $where);
}

/**
 * コミュニティ写真削除
 */
function db_commu_delete_c_commu_image_filename($c_commu_id)
{
    $data = array('image_filename' => '');
    $where = array('c_commu_id' => intval($c_commu_id));
    return db_update('c_commu', $data, $where);
}

/**
 * 管理者交代
 * 
 * @param   int $c_commu_admin_confirm
 * @param   int $u : 自分のc_membmer_id
 * @return bool
 */
function db_commu_update_c_commu_c_member_id_admin($c_commu_id, $c_member_id)
{
    $data = array('c_member_id_admin' => intval($c_member_id));
    $where = array('c_commu_id' => intval($c_commu_id));
    if (!db_update('c_commu', $data, $where)) {
        return false;
    }
    return db_commu_delete_c_commu_admin_confirm4c_commu_id($c_commu_id);
}

/**
 * 登録時に強制参加させるかどうかを設定
 */
function db_commu_update_is_regist_join($c_commu_id, $value = 0)
{
    $data = array('is_regist_join' => (bool)$value);
    $where = array('c_commu_id' => intval($c_commu_id));
    return db_update('c_commu', $data, $where);
}

//--- confirm

/** 
 * コミュニティ参加要請を削除
 */
function db_commu_delete_c_commu_member_confirm($c_commu_member_confirm_id)
{
    $sql = 'DELETE FROM c_commu_member_confirm WHERE c_commu_member_confirm_id = ?';
    $params = array(intval($c_commu_member_confirm_id));
    return db_query($sql, $params);
}

/**
 * コミュニティ参加要請を承認
 */
function db_commu_insert_c_commu_member($c_commu_member_confirm_id)
{
    $confirm = _do_c_commu_member_confirm4c_commu_member_confirm_id($c_commu_member_confirm_id);
    $data = array(
        'c_commu_id' => intval($confirm['c_commu_id']),
        'c_member_id' => intval($confirm['c_member_id']),
        'r_datetime' => db_now(),
    );
    db_insert('c_commu_member', $data);

    return db_commu_delete_c_commu_member_confirm($c_commu_member_confirm_id);
}

/**
 * コミュニティ参加リクエスト
 */
function db_commu_insert_c_commu_member_confirm($c_commu_id, $c_member_id, $message = '')
{
    $data = array(
        'c_commu_id' => intval($c_commu_id),
        'c_member_id' => intval($c_member_id),
        'message' => $message,
        'r_datetime' => db_now(),
    );
    return db_insert('c_commu_member_confirm', $data);
}

/**
 * コミュニティ管理者交代リクエスト
 */
function db_commu_insert_c_commu_admin_confirm($c_commu_id, $c_member_id, $message = '')
{
    $data = array(
        'c_commu_id' => intval($c_commu_id),
        'c_member_id_to' => intval($c_member_id),
        'message' => $message,
        'r_datetime' => db_now(),
    );
    return db_insert('c_commu_admin_confirm', $data);
}

/**
 * 管理者交代の要請を削除
 * 
 * @param   int $c_commu_admin_confirm_id
 */
function db_commu_delete_c_commu_admin_confirm4id($c_commu_admin_confirm_id)
{
    $sql = 'DELETE FROM c_commu_admin_confirm WHERE c_commu_admin_confirm_id = ?';
    $params = array(intval($c_commu_admin_confirm_id));
    return db_query($sql, $params);
}

/**
 * コミュニティIDから管理者交代要請を削除
 */
function db_commu_delete_c_commu_admin_confirm4c_commu_id($c_commu_id)
{
    $sql = 'DELETE FROM c_commu_admin_confirm WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));
    return db_query($sql, $params);
}

//--- topic

/**
 * トピック削除
 */
function db_commu_delete_c_commu_topic($c_commu_topic_id)
{
    // c_commu_topic_comment(画像)
    $sql = 'SELECT image_filename1, image_filename2, image_filename3' .
            ' FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
    $params = array(intval($c_commu_topic_id));

    $topic_comment_list = db_get_all($sql, $params);
    foreach ($topic_comment_list as $topic_comment) {
        image_data_delete($topic_comment['image_filename1']);
        image_data_delete($topic_comment['image_filename2']);
        image_data_delete($topic_comment['image_filename3']);
    }

    $sql = 'DELETE FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
    db_query($sql, $params);

    $sql = 'DELETE FROM c_event_member WHERE c_commu_topic_id = ?';
    db_query($sql, $params);

    $sql = 'DELETE FROM c_commu_topic WHERE c_commu_topic_id = ?';
    db_query($sql, $params);
}

//--- topic_comment

/**
 * トピックコメント書き込み
 * 
 * @param   int    $c_commu_id
 * @param   int    $c_commu_topic_id
 * @param   int    $c_member_id
 * @param   string $body
 * @return int insert_id
 */
function db_commu_insert_c_commu_topic_comment($c_commu_id, $c_commu_topic_id, $c_member_id, $body)
{
    $number = _do_c_commu_topic_comment_number4c_commu_topic_id($c_commu_topic_id);

    $data = array(
        'c_commu_id' => intval($c_commu_id),
        'c_member_id' => intval($c_member_id),
        'c_commu_topic_id' => intval($c_commu_topic_id),
        'number' => intval($number),
        'body' => $body,
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    return db_insert('c_commu_topic_comment', $data);
}

/**
 * トピックコメント書き込み
 */
function do_c_bbs_insert_c_commu_topic_comment($c_member_id,$target_c_commu_topic_id,$body)
{
    $c_commu_topic = _do_c_bbs_c_commu_topic4c_commu_topic_id($target_c_commu_topic_id);

    $target_c_commu_topic_id = $c_commu_topic['c_commu_topic_id'];
    $target_c_commu_id  = $c_commu_topic['c_commu_id'];

    return db_commu_insert_c_commu_topic_comment($target_c_commu_id, $target_c_commu_topic_id, $c_member_id, $body);
}

function db_commu_update_c_commu_topic_comment_images($c_commu_topic_comment_id, $image_filename1, $image_filename2, $image_filename3)
{
    $data = array(
        'image_filename1' => strval($image_filename1),
        'image_filename2' => strval($image_filename2),
        'image_filename3' => strval($image_filename3),
    );
    $where = array('c_commu_topic_comment_id' => intval($c_commu_topic_comment_id));
    return db_update('c_commu_topic_comment', $data, $where);
}

/**
 * 掲示板書き込みに画像を追加する
 */
function mail_update_c_commu_topic_comment_image($c_commu_topic_comment_id, $image_filename, $image_num)
{
    $data = array(
        'image_filename'.intval($image_num) => $image_filename,
    );
    $where = array(
        'c_commu_topic_comment_id' => intval($c_commu_topic_comment_id),
    );
    return db_update('c_commu_topic_comment', $data, $where);
}

/**
 * トピックコメント削除
 */
function do_c_bbs_delete_c_commu_topic_comment($c_commu_topic_comment_id)
{
    $sql = 'SELECT image_filename1, image_filename2, image_filename3' .
        ' FROM c_commu_topic_comment' .
        ' WHERE c_commu_topic_comment_id = ?';
    $params = array(intval($c_commu_topic_comment_id));
    $topic_comment = db_get_row($sql, $params);
    image_data_delete($topic_comment['image_filename1']);
    image_data_delete($topic_comment['image_filename2']);
    image_data_delete($topic_comment['image_filename3']);

    $sql = 'DELETE FROM c_commu_topic_comment WHERE c_commu_topic_comment_id = ?';
    return db_query($sql, $params);
}

//--- event

function do_c_event_edit_update_c_commu_topic($c_commu_topic_id, $topic)
{
    $data = array(
        'name'       => $topic['name'],
        'event_flag' => (bool)$topic['event_flag'],
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    if ($data['event_flag']) {
        $data += array(
            'open_date'         => $topic['open_date'],
            'open_date_comment' => $topic['open_date_comment'],
            'open_pref_id'      => intval($topic['open_pref_id']),
            'open_pref_comment' => $topic['open_pref_comment'],
            'invite_period'     => $topic['invite_period'],
        );
    }
    $where = array('c_commu_topic_id' => intval($c_commu_topic_id));
    return db_update('c_commu_topic', $data, $where);
}

function do_c_event_edit_update_c_commu_topic_comment($c_commu_topic_id, $topic_comment)
{
    $data = array(
        'body' => $topic_comment['body'],
        'r_datetime' => db_now(),
    );
    for ($i = 1; $i <= 3; $i++) {
        $key = 'image_filename'.$i;
        if (!empty($topic_comment[$key])) {
            $data[$key] = $topic_comment[$key];
        }
    }
    $where = array(
        'c_commu_topic_id' => intval($c_commu_topic_id),
        'number' => 0,
    );
    return db_update('c_commu_topic_comment', $data, $where);
}

function do_c_event_edit_delete_c_commu_topic_comment_image($c_commu_topic_id, $image_num)
{
    $data = array(
        'image_filename'.intval($image_num) => '',
    );
    $where = array(
        'c_commu_topic_id' => intval($c_commu_topic_id),
        'number' => 0,
    );
    return db_update('c_commu_topic_comment', $data, $where);
}

function do_c_event_add_insert_c_commu_topic($topic)
{
    $data = array(
        'c_commu_id'  => intval($topic['c_commu_id']),
        'c_member_id' => intval($topic['c_member_id']),
        'name'        => $topic['name'],
        'event_flag'  => (bool)$topic['event_flag'],
        'r_datetime'  => db_now(),
        'r_date'      => db_now(),
    );
    if ($data['event_flag']) {
        $data += array(
            'open_date'         => $topic['open_date'],
            'open_date_comment' => $topic['open_date_comment'],
            'open_pref_id'      => intval($topic['open_pref_id']),
            'open_pref_comment' => $topic['open_pref_comment'],
            'invite_period'     => $topic['invite_period'],
        );
    }
    return db_insert('c_commu_topic', $data);
}

function do_c_event_add_insert_c_commu_topic_comment($comment)
{
    $data = array(
        'c_commu_id'       => intval($comment['c_commu_id']),
        'c_member_id'      => intval($comment['c_member_id']),
        'body'             => strval($comment['body']),
        'number'           => intval($comment['number']),
        'c_commu_topic_id' => intval($comment['c_commu_topic_id']),
        'image_filename1'  => strval($comment['image_filename1']),
        'image_filename2'  => strval($comment['image_filename2']),
        'image_filename3'  => strval($comment['image_filename3']),
        'r_datetime'       => db_now(),
        'r_date'           => db_now(),
    );
    return db_insert('c_commu_topic_comment', $data);
}

/**
 * イベント管理メンバー追加
 */
function do_c_event_add_insert_c_event_member_as_admin($c_commu_topic_id, $c_member_id)
{
    $data = array(
        'c_commu_topic_id' => intval($c_commu_topic_id),
        'c_member_id' => intval($c_member_id),
        'is_admin' => 1,
        'r_datetime' => db_now(),
    );
    return db_insert('c_event_member', $data);
}

/**
 * イベント参加メンバー追加
 */
function do_c_event_add_insert_c_event_member($c_commu_topic_id, $c_member_id)
{
    // 参加済みの場合は追加しない
    $sql = 'SELECT c_event_member_id FROM c_event_member' .
            ' WHERE c_commu_topic_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_topic_id), intval($c_member_id));
    if (db_get_one($sql, $params)) {
        return false;
    }

    $data = array(
        'c_commu_topic_id' => intval($c_commu_topic_id),
        'c_member_id' => intval($c_member_id),
        'is_admin' => 0,
        'r_datetime' => db_now(),
    );
    return db_insert('c_event_member', $data);
}

/**
 * イベント参加メンバー削除
 */
function do_c_event_add_delete_c_event_member($c_commu_topic_id, $c_member_id)
{
    $sql = 'DELETE FROM c_event_member WHERE c_commu_topic_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_topic_id), intval($c_member_id));
    db_query($sql, $params);
}

//--- commu_member

/**
 * コミュニティに参加
 */
function do_inc_join_c_commu($c_commu_id, $c_member_id)
{
    $data = array(
        'c_commu_id'  => intval($c_commu_id),
        'c_member_id' => intval($c_member_id),
        'r_datetime'  => db_now(),
    );
    return db_insert('c_commu_member', $data);
}

/**
 * コミュニティからメンバーを削除
 */
function db_commu_delete_c_commu_member($c_commu_id, $c_member_id)
{
    $sql = 'DELETE FROM c_commu_review' .
           ' WHERE c_commu_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    db_query($sql, $params);

    $sql = 'DELETE FROM c_commu_admin_confirm' .
           ' WHERE c_commu_id = ? AND c_member_id_to = ?';
    db_query($sql, $params);

    $sql = 'DELETE FROM c_commu_member' .
           ' WHERE c_commu_id = ? AND c_member_id = ?';
    db_query($sql, $params);
}

/**
 * コミュニティお知らせメール受信設定変更
 */
function do_c_home_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc)
{
    $data = array(
        'is_receive_mail' => (bool)$is_receive_mail,
        'is_receive_mail_pc' => (bool)$is_receive_mail_pc,
    );
    $where = array(
        'c_commu_id'  => intval($c_commu_id),
        'c_member_id' => intval($c_member_id),
    );
    return db_update('c_commu_member', $data, $where);
}

/**
 * 非公開コミュニティへの承認なし参加フラグを立てる
 */
function db_commu_insert_c_commu_admin_invite($c_commu_id, $c_member_id_to)
{
    // すでにフラグが立っている
    $sql = 'SELECT c_commu_admin_invite_id FROM c_commu_admin_invite' .
            ' WHERE c_commu_id = ? AND c_member_id_to = ?';
    $params = array(intval($c_commu_id), intval($c_member_id_to));
    if (db_get_one($sql, $params)) {
        return false;
    }

    $data = array(
        'c_commu_id'  => intval($c_commu_id),
        'c_member_id_to' => intval($c_member_id_to),
        'r_datetime'  => db_now(),
    );

    return db_insert('c_commu_admin_invite', $data);
}

/**
 * 非公開コミュニティへの承認なし参加フラグを削除する
 */
function db_commu_delete_c_commu_admin_invite($c_commu_admin_invite_id)
{
    $sql = 'DELETE FROM c_commu_admin_invite WHERE c_commu_admin_invite_id = ?';
    $params = array(intval($c_commu_admin_invite_id));
    db_query($sql, $params);
}

?>
