<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function do_c_review_add_insert_c_review($product, $c_review_category_id)
{
    $sql = 'SELECT c_review_id FROM c_review WHERE asin = ?';
    $params = array($product['asin']);
    if ($c_review_id = db_get_one($sql, $params)) {
        return $c_review_id;
    }

    $data = array(
        'title'        => $product['name'],
        'release_date' => $product['release'],
        'manufacturer' => $product['manufacturer'],
        'author'       => $product['author'],
        'c_review_category_id' => intval($c_review_category_id),
        'image_small'  => $product['imagesmall'],
        'image_medium' => $product['imagemedium'],
        'image_large'  => $product['imagelarge'],
        'url'          => $product['url'],
        'asin'         => $product['asin'],
        'list_price'   => $product['listprice'],
        'retail_price' => $product['ourprice'],
        'r_datetime'   => db_now(),
    );

    //TODO:暫定処理
    foreach ($data as $key => $value) {
        if (is_null($value)) $data[$key] = '';
    }
    return db_insert('c_review', $data);
}

function do_c_review_add_insert_c_review_comment($c_review_id , $c_member_id, $body, $satisfaction_level)
{
    $data = array(
        'c_review_id' => intval($c_review_id),
        'c_member_id' => intval($c_member_id),
        'body' => $body,
        'satisfaction_level' => intval($satisfaction_level),
        'r_datetime' => db_now(),
    );
    return db_insert('c_review_comment', $data);
}

function do_h_review_edit_update_c_review_comment($c_review_comment_id, $body, $satisfaction_level)
{
    $data = array(
        'body' => $body,
        'satisfaction_level' => intval($satisfaction_level),
        'r_datetime' => db_now(),
    );
    $where = array('c_review_comment_id' => intval($c_review_comment_id));
    return db_update('c_review_comment', $data, $where);
}

function do_h_review_edit_delete_c_review_comment($c_review_comment_id)
{
    $sql = 'DELETE FROM c_review_comment WHERE c_review_comment_id = ?';
    $params = array(intval($c_review_comment_id));
    db_query($sql, $params);
}

function do_h_review_clip_add_insert_c_review_clip($c_review_id, $c_member_id)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_review_id' => intval($c_review_id),
        'r_datetime' => db_now(),
    );
    return db_insert('c_review_clip', $data);
}

function do_c_member_review_insert_c_commu_review($c_review_id, $c_member_id, $c_commu_id)
{
    $data = array(
        'c_commu_id' => intval($c_commu_id),
        'c_review_id' => intval($c_review_id),
        'c_member_id' => intval($c_member_id),
        'r_datetime' => db_now(),
    );
    return db_insert('c_commu_review', $data);
}

function do_h_review_clip_list_delete_c_review_clip($c_member_id , $c_review_clips)
{
    if (!is_array($c_review_clips)) {
        return false;
    }
    $ids = implode(',', array_map('intval', $c_review_clips));

    $sql = 'DELETE FROM c_review_clip WHERE c_member_id = ?' .
            ' AND c_review_id IN ('.$ids.')';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

function do_delete_c_review4c_review_id($c_review_id)
{
    $params = array(intval($c_review_id));

    // c_review
    $sql = 'DELETE FROM c_review WHERE c_review_id = ?';
    db_query($sql, $params);

    // c_review_clip
    $sql = 'DELETE FROM c_review_clip WHERE c_review_id = ?';
    db_query($sql, $params);

    // c_commu_review
    $sql = 'DELETE FROM c_commu_review WHERE c_review_id = ?';
    db_query($sql, $params);
}

?>
