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

function image_insert_c_image4tmp($prefix, $tmpfile)
{
    if (!$tmpfile || preg_match('/[^\.\w]/', $tmpfile)) return false;

    $path_parts = pathinfo($tmpfile);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);

    $allowed_ext = array('jpg', 'jpeg', 'gif', 'png');
    if (!in_array($ext, $allowed_ext)) {
        return false;
    }

    $filename = sprintf('%s_%s.%s', $prefix, time(), $ext);

    if (!OPENPNE_TMP_IMAGE_DB) {
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $filepath = $img_tmp_dir_path . basename($tmpfile);

        if (_do_insert_c_image($filename, $filepath)) {
            return $filename;
        }
    } else {
        $c_tmp_image = c_tmp_image4filename($tmpfile);

        $params = array(
            'filename' => $filename,
            'bin' => $c_tmp_image['bin'],
            'r_datetime' => db_now(),
        );
        if (db_insert("c_image", $params)) {
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

function image_insert_c_tmp_image($upfile_obj, $filename)
{
    if (!$upfile_obj) {
        return false;
    }

    $filepath = $upfile_obj['tmp_name'];

    $result = _do_insert_c_tmp_image($filename, $filepath);
    if (!$result) {
        return false;
    }
    return $filename;
}

function _do_insert_c_tmp_image($filename, $filepath)
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

function t_image_clear_tmp_db($uid)
{
    $sql = 'DELETE FROM c_tmp_image WHERE filename LIKE ?';
    $params = array('%_' . $uid . '.%');
    db_query($sql, $params);
}

?>
