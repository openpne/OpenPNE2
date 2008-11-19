<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_file_download extends OpenPNE_Action
{
    function isSecure()
    {
        // SSL有効時にIEでファイルダウンロードできなくなる問題の対策
        session_cache_limiter('public');

        return true;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $filename = $requests['filename'];
        // ----------

        // ファイルアップロード機能がオフ
        if (!OPENPNE_USE_FILEUPLOAD) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        // ファイルが存在しない
        $file = db_file_c_file4filename($filename);
        if (empty($file)) {
            admin_client_redirect('top', '指定されたファイルは存在しません');
        }

        // オリジナルファイル名
        $original_filename = $file['original_filename'];
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false) {
            // IE の場合のみ、ファイル名を SJIS に変換
            $original_filename = mb_convert_encoding($original_filename, 'SJIS', 'UTF-8');
        }
        $original_filename = str_replace(array("\r", "\n"), '', $original_filename);

        header('Content-Disposition: attachment; filename="' . $original_filename . '"');
        header('Content-Length: '. strlen($file['bin']));
        header('Content-Type: application/octet-stream');
        echo $file['bin'];
        exit;
    }
}

?>
