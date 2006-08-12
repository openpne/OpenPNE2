<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

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

function _do_insert_c_image($filename, $filepath)
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

function image_data_delete($image_filename)
{
    if(!$image_filename) return false;

    db_image_delete_c_image($image_filename);

    // cacheの削除
    image_cache_delete($image_filename);
}

//---

function image_insert_c_image4tmp($filename, $tmpfile)
{
    if (!$tmpfile || preg_match('/[^\.\w]/', $tmpfile)) return false;

    $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
    $filepath = $img_tmp_dir_path . basename($tmpfile);

    $path_parts = pathinfo($tmpfile);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);

    $allowed_ext = array('jpg', 'jpeg', 'gif', 'png');
    if (in_array($ext, $allowed_ext)) {
        $filename = $filename . '_' . time() . '.' . $ext;
        if (_do_insert_c_image($filename, $filepath)) {
            return $filename;
        }
    }
    return false;
}

function image_insert_c_image($upfile_obj, $filename)
{
    if(!$upfile_obj) return false;

    $filepath = $upfile_obj['tmp_name'];

    $path_parts = pathinfo($upfile_obj['name']);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);
    $filename = $filename . '_' . time() . '.' . $ext;

    if (!_do_insert_c_image($filename, $filepath)) {
        return false;
    }
    return $filename;
}

?>
