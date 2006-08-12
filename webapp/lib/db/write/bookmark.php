<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * お気に入り追加
 */
function db_bookmark_insert_c_bookmark($c_member_id_from, $c_member_id_to)
{
    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to' => intval($c_member_id_to),
        'r_datetime' => db_now(),
    );
    return db_insert('c_bookmark', $data);
}

/**
 * お気に入り削除
 */
function db_bookmark_delete_c_bookmark($c_member_id_from, $c_member_id_to)
{
    $sql = 'DELETE FROM c_bookmark' .
            ' WHERE c_member_id_from = ? AND c_member_id_to = ?';
    $params = array(intval($c_member_id_from), intval($c_member_id_to));
    db_query($sql, $params);
}

?>
