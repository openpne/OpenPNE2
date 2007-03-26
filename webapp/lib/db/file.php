<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

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
        $sql = 'SELECT c_file_id, filename, r_datetime, bin FROM c_file WHERE c_file_id = ?';
        $params = array(intval($c_file_id));
        $c_file_list[$i] = db_get_row($sql, $params);
        $c_file_list[$i]['size'] = strlen($c_file_list[$i]['bin']);
    }

    $sql = 'SELECT COUNT(*) FROM c_file';
    $total_num = db_get_one($sql);

    $pager = admin_make_pager($page, $page_size, $total_num);

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
    return db_get_row($sql, $params);
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
?>