<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_image_c_image4c_image_id($c_image_id)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT * FROM c_image WHERE c_image_id = ?';
    $params = array(intval($c_image_id));
    return $db->get_row($sql, $params);
}

function db_image_is_c_image4filename($filename)
{
    if (!$filename) return false;

    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image WHERE filename = ?';
    $params = array($filename);
    return (bool)$db->get_one($sql, $params);
}

function db_image_c_image_list($page, $page_size, &$pager)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image ORDER BY c_image_id DESC';
    $id_list = $db->get_col_page($sql, $page, $page_size);

    $c_image_list = array();
    foreach ($id_list as $c_image_id) {
        $sql = 'SELECT c_image_id, filename, r_datetime FROM c_image WHERE c_image_id = ?';
        $params = array(intval($c_image_id));
        $c_image_list[] = $db->get_row($sql, $params);
    }

    $sql = 'SELECT COUNT(*) FROM c_image';
    $total_num = $db->get_one($sql);

    $pager = admin_make_pager($page, $page_size, $total_num);
    return $c_image_list;
}

/**
 * ファイル名から一時保存ファイルを取得
 */
function db_image_c_tmp_image4filename($filename)
{
    $sql = 'SELECT * FROM c_tmp_image WHERE filename = ?';
    $params = array($filename);
    return db_get_row($sql, $params);
}

/*** write ***/

function db_image_insert_c_image($filename, $bin, $type = '')
{
    $db =& db_get_instance('image');

    $data = array(
        'filename'   => $filename,
        'bin'        => base64_encode($bin),
        'type'       => $type,
        'r_datetime' => db_now(),
    );
    return $db->insert('c_image', $data, 'c_image_id');
}

function db_image_delete_c_image($filename)
{
    $db =& db_get_instance('image');

    $sql = 'DELETE FROM c_image WHERE filename = ?';
    $params = array($filename);
    return $db->query($sql, $params);
}

//---

function db_image_insert_c_image2($filename, $filepath)
{
    if (!is_readable($filepath)) return false;

    $fp = fopen($filepath, 'rb');
    $image_data = fread($fp, filesize($filepath));
    fclose($fp);

    // 画像かどうかのチェック
    if (!@imagecreatefromstring($image_data)) return false;

    //TODO:typeフィールドを使う
    return db_image_insert_c_image($filename, $image_data);
}

function db_image_data_delete($image_filename)
{
    if (!$image_filename) return false;

    db_image_delete_c_image($image_filename);

    // cacheの削除
    image_cache_delete($image_filename);
}

//---

function db_image_insert_c_tmp_image($filename, $filepath)
{
    if (!is_readable($filepath)) {
        return false;
    }

    $fp = fopen($filepath, 'rb');
    $image_data = fread($fp, filesize($filepath));
    fclose($fp);

    // 画像かどうかのチェック
    if (!@imagecreatefromstring($image_data)) {
        return false;
    }

    $sql = 'DELETE FROM c_tmp_image WHERE filename = ?';
    $params = array($filename);
    db_query($sql, $params);

    $image_data = base64_encode($image_data);
    $params = array(
        'filename' => $filename,
        'bin' => $image_data,
        'r_datetime' => db_now(),
    );

    return db_insert('c_tmp_image', $params);
}

function db_image_clear_tmp_db($uid)
{
    $sql = 'DELETE FROM c_tmp_image WHERE filename LIKE ?';
    $params = array('%_' . $uid . '.%');
    db_query($sql, $params);
}

?>
