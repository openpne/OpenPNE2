<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 確認画面用に一時ファイルを保存して、そのファイル名を返す
 *
 * 保存先:     var/tmp/
 * ファイル名: ($prefix)_($uid).($ext)
 *
 * @param array $upfile
 * @param string $uid
 * @param string $prefix
 * @param string $ext
 * @return mixed
 */
function t_file_save2tmp($upfile, $uid, $prefix='', $ext='')
{
    // 拡張子を取得
    if (!$ext) {
        $path_parts = pathinfo($upfile['name']);
        $ext = $path_parts['extension'];
        $ext = strtolower($ext);
    }

    // 一時ファイル保存ディレクトリ
    $tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';

    // ファイルパスを決定
    $filename = sprintf('%s_%s.%s', $prefix, $uid, $ext);
    $filepath = $tmp_dir_path . $filename;

    if (!is_uploaded_file($upfile['tmp_name'])) {
        return false;
    }

    if (OPENPNE_TMP_FILE_DB) {
        // 一時ファイルをDBに保存する
        if (!db_file_insert_c_tmp_file($filename, $upfile['tmp_name'], $upfile['name'])) {
            return false;
        }
    } else {
        // var/tmp/ディレクトリにファイルを移動する
        move_uploaded_file($upfile['tmp_name'], $filepath);
        chmod($filepath, 0644);
        if (!is_file($filepath)) {
            return false;
        }
    }

    return $filename;
}

/**
 * 確認画面用の一時ファイルを削除する
 */
function t_file_clear_tmp($uid)
{
    if (OPENPNE_TMP_FILE_DB) {
        db_file_clear_tmp_db($uid);
    }
}

/**
 * 一時ファイル情報をDBに保存する
 *
 * @param string $prefix
 * @param string $tmpfile
 * @param string $original_filename
 * @return mixed
 */
function file_insert_c_file4tmp($prefix, $tmpfile, $original_filename)
{
    if (!$tmpfile || preg_match('/[^\.\w]/', $tmpfile)) return false;

    $path_parts = pathinfo($tmpfile);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);

    $filename = sprintf('%s_%s.%s', $prefix, time(), $ext);

    if (OPENPNE_TMP_FILE_DB) {
        $tmpfile_name = basename($tmpfile);
        $c_tmp_file = db_file_c_tmp_file4filename($tmpfile_name);
        $fileData = $c_tmp_file['bin'];
    } else {
        $tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $filepath = $tmp_dir_path . basename($tmpfile);

        if (!is_readable($filepath)) {
            return false;
        }

        $fp = fopen($filepath, 'rb');
        $fileData = fread($fp, filesize($filepath));
        fclose($fp);
    }

    if (db_file_insert_c_file($filename, $fileData, $original_filename)) {
        return $filename;
    }

    return false;
}

?>
