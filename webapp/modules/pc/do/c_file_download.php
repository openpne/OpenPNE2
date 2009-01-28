<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_file_download extends OpenPNE_Action
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
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $c_commu_topic_comment_id = $requests['target_c_commu_topic_comment_id'];
        // ----------

        if (!$c_commu_topic_id && !$c_commu_topic_comment_id) {
            handle_kengen_error();
        }

        if ($c_commu_topic_comment_id) {
            $c_topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id);
            $c_commu_id = $c_topic_comment['c_commu_id'];
            $filename = $c_topic_comment['filename'];
        } else {
            $c_topic = db_commu_c_topic4c_commu_topic_id($c_commu_topic_id);
            $c_commu_id = $c_topic['c_commu_id'];
            $filename = $c_topic['filename'];
        }

        //--- 権限チェック
        //コミュニティ参加者
        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_bbs_view']) {
            handle_kengen_error();
        }

        // ファイルアップロード機能がオフ
        if (!OPENPNE_USE_FILEUPLOAD) {
            handle_kengen_error();
        }

        // ファイルが存在しない
        $file = db_file_c_file4filename($filename);
        if (empty($file)) {
            handle_kengen_error();
        }

        // オリジナルファイル名
        $original_filename = $file['original_filename'];
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false) {
            // IE の場合のみ、ファイル名を SJIS に変換し、キャッシュをさせないヘッダを出力しない
            $original_filename = mb_convert_encoding($original_filename, 'SJIS', 'UTF-8');
        } else {
            send_nocache_headers(true);
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
