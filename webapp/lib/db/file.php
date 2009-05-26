<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * IDからファイルの情報を取得する
 *
 * @param int $c_file_id
 */
function db_file_c_file4c_file_id($c_file_id)
{
    $sql = 'SELECT * FROM c_file WHERE c_file_id = ?';
    $params = array(intval($c_file_id));
    $file = db_get_row($sql, $params);
    if ($file) {
        $file['size'] = strlen($file['bin']);
    }
    return $file;
}

/**
 * 登録されているファイルをリストアップする
 *
 * @param int $page
 * @param int $page_size
 * @param int &$pager
 */
function db_file_c_file_list($page, $page_size, &$pager)
{
    $sql = 'SELECT c_file_id FROM c_file ORDER BY c_file_id DESC';
    $id_list = db_get_col_page($sql, $page, $page_size);

    $c_file_list = array();
    foreach ($id_list as $i => $c_file_id) {
        $sql = 'SELECT c_file_id, filename, original_filename, r_datetime, bin FROM c_file WHERE c_file_id = ?';
        $params = array(intval($c_file_id));
        $c_file_list[$i] = db_get_row($sql, $params);
        $c_file_list[$i]['size'] = strlen($c_file_list[$i]['bin']);
        unset($c_file_list[$i]['bin']);
    }

    $sql = 'SELECT COUNT(*) FROM c_file';
    $total_num = db_get_one($sql);

    $pager = util_make_pager($page, $page_size, $total_num);

    return $c_file_list;
}

/**
 * ファイル情報をDBに挿入する
 *
 * @param string $filename
 * @param string $bin
 * @param string $original_filename
 * @return mixed
 */
function db_file_insert_c_file($filename, $bin, $original_filename)
{
    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $bin = base64_encode($bin);
    }

    $data = array(
        'filename'   => $filename,
        'bin'        => $bin,
        'original_filename' => $original_filename,
        'r_datetime' => db_now(),
    );
    return db_insert('c_file', $data, 'c_file_id');
}

/**
 * ファイル名からファイル実体を取得
 *
 * @param string $filename
 * @return mixed
 */
function db_file_c_file4filename($filename)
{
    $sql = 'SELECT * FROM c_file WHERE filename = ?';
    $params = array($filename);

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        if ($lst = db_get_row($sql, $params)) {
            $lst['bin'] = base64_decode($lst['bin']);
        }
        return $lst;
    } else {
        return db_get_row($sql, $params);
    }
}

/**
 * ファイル名からオリジナルのファイル名を取得
 *
 * @param string $filename
 * @return string
 */
function db_file_original_filename4filename($filename)
{
    $sql = 'SELECT original_filename FROM c_file WHERE filename = ?';
    $params = array($filename);
    return db_get_one($sql, $params);
}

/**
 * アップロードされたファイルを削除する
 *
 * @param string $filename  削除したいファイル名
 * @return mixed
 */
function db_file_delete_c_file($filename)
{
    $sql = 'DELETE FROM c_file WHERE filename = ?';
    $params = array($filename);
    return db_query($sql, $params);
}

/**
 * 管理画面用に一時ファイル情報をDBに挿入する
 *
 * @param string $filename
 * @param string $filepath
 * @param string $original_filename
 */
function db_file_insert_c_tmp_file($filename, $filepath, $original_filename)
{
    if (!is_readable($filepath)) {
        return false;
    }

    $fp = fopen($filepath, 'rb');
    $file_data = fread($fp, filesize($filepath));
    fclose($fp);

    $sql = 'DELETE FROM c_tmp_file WHERE filename = ?';
    $params = array($filename);
    db_query($sql, $params);

    $data = array(
        'filename'   => $filename,
        'bin'        => $file_data,
        'original_filename' => $original_filename,
        'r_datetime' => db_now(),
    );
    return db_insert('c_tmp_file', $data);
}

/**
 * DBから管理画面用の一時ファイル情報を削除する
 */
function db_file_clear_tmp_db($uid)
{
    $sql = 'DELETE FROM c_tmp_file WHERE filename LIKE ?';
    $params = array('%_' . $uid . '.%');
    db_query($sql, $params);
}

/**
 * ファイル名から一時保存ファイルを取得
 */
function db_file_c_tmp_file4filename($filename)
{
    $sql = 'SELECT * FROM c_tmp_file WHERE filename = ?';
    $params = array($filename);
    return db_get_row($sql, $params);
}
?>
