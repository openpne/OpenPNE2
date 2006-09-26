<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//--- diary

/**
 * 日記を追加
 */
function db_diary_insert_c_diary($c_member_id, $subject, $body, $public_flag)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'subject' => $subject,
        'body' => $body,
        'public_flag' => $public_flag,
        'r_datetime' => db_now(),
        'r_date' => db_now(),
        'is_checked' => 1,
    );
    return db_insert('c_diary', $data);
}

/**
 * 日記を編集
 */
function db_diary_update_c_diary($c_diary_id, $subject, $body, $public_flag,
    $image_filename_1 = '', $image_filename_2 = '', $image_filename_3 = '')
{
    $data = array(
        'subject' => $subject,
        'body' => $body,
        'public_flag' => $public_flag,
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
    // 画像
    $c_diary = db_diary_get_c_diary4id($c_diary_id);
    image_data_delete($c_diary['image_filename_1']);
    image_data_delete($c_diary['image_filename_2']);
    image_data_delete($c_diary['image_filename_3']);

    // コメント
    $sql = 'SELECT image_filename_1, image_filename_2, image_filename_3 FROM c_diary_comment WHERE c_diary_id =?';
    $params = array(intval($c_diary_id));
    $comment_images = db_get_all($sql, $params);

    foreach ($comment_images as $value) {
        image_data_delete($value['image_filename_1']);
        image_data_delete($value['image_filename_2']);
        image_data_delete($value['image_filename_3']);
    }

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
    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_diary_id' => intval($c_diary_id),
        'body' => $body,
        'r_datetime' => db_now(),
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

    image_data_delete($dc['image_filename_1']);
    image_data_delete($dc['image_filename_2']);
    image_data_delete($dc['image_filename_3']);

    $sql = 'DELETE FROM c_diary_comment WHERE c_diary_comment_id = ?';
    $params = array(intval($c_diary_comment_id));
    return db_query($sql, $params);
}

?>
