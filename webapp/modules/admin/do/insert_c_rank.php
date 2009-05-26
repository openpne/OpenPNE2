<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク追加
class admin_do_insert_c_rank extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('list_c_rank', array_shift($errors));
    }

    function execute($requests)
    {
        // ランク機能が無効
        if (!OPENPNE_USE_POINT_RANK) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        if (db_point_is_rank4point($requests['point'])) {
            admin_client_redirect('list_c_rank', '同一の到達ポイントのランクが既に存在します');
        }

        $upfile_obj = $_FILES['image_upfile'];

        // ランク画像が指定されていない
        if (empty($upfile_obj) || $upfile_obj['error'] === UPLOAD_ERR_NO_FILE) {
            admin_client_redirect('list_c_rank', 'ランク画像を指定してください');
        }

        // ランク画像の形式チェック
        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                admin_client_redirect('list_c_rank', '画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください');
            }
        }

        // ランクを追加
        $c_rank_id = db_admin_insert_c_rank($requests['name'], '', $requests['point']);
        if (!$c_rank_id) {
            admin_client_redirect('list_c_rank', 'ランクが追加できませんでした');
        }

        // ランク画像挿入
        $ext = t_check_image_format($upfile_obj);
        $image_filename = "r_{$c_rank_id}_".time().".{$ext}";
        admin_insert_c_image($upfile_obj, $image_filename);

        // ランクとランク画像の関連付け
        db_admin_update_c_rank($c_rank_id, $requests['name'], $image_filename, $requests['point']);

        admin_client_redirect('list_c_rank', 'ランクを追加しました');
    }
}

?>
