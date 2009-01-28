<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク編集
class admin_do_update_c_rank extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('update_c_rank', array_shift($errors), 'c_rank_id='.$this->requests['c_rank_id']);
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_POINT_RANK) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        $c_rank_id      = $requests['c_rank_id'];
        $c_rank = db_admin_get_c_rank_one($c_rank_id);
        $image_filename = $c_rank['image_filename'];

        if (db_point_is_rank4point($requests['point']) && ($c_rank['point'] != $requests['point'])) {
           $tail = 'c_rank_id=' . $c_rank_id;
           admin_client_redirect('update_c_rank', '同一の到達ポイントのランクが既に存在します', $tail);
        }

        $upfile_obj = $_FILES['image_upfile'];

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $tail = 'c_rank_id=' . $c_rank_id;
                admin_client_redirect('update_c_rank', '画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください', $tail);
            }

            //以前のイメージを削除
            db_image_data_delete($image_filename);

            //新しいイメージを作成
            $ext = t_check_image_format($_FILES['image_upfile']);
            $image_filename = "r_{$c_rank_id}_".time().".{$ext}";
            admin_insert_c_image($_FILES['image_upfile'], $image_filename);
        }

        db_admin_update_c_rank($c_rank_id, $requests['name'], $image_filename, $requests['point']);

        admin_client_redirect('list_c_rank', 'ランクを編集しました');
    }
}

?>
