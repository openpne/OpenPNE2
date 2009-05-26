<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// バナー追加
class admin_do_insert_c_banner extends OpenPNE_Action
{
    function execute($requests)
    {
        $upfile_obj = $_FILES['upfile'];
        if (empty($upfile_obj) || $upfile_obj['error'] === UPLOAD_ERR_NO_FILE) {
            admin_client_redirect('insert_c_banner', '画像は必ず指定してください');
        }

        if (!($image = t_check_image($upfile_obj))) {
            admin_client_redirect('insert_c_banner', '画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください');
        }

        $c_banner_id = db_admin_insert_c_banner($requests['a_href'], $requests['type'], $requests['nickname']);

        $ext = t_check_image_format($upfile_obj);
        $c_banner['image_filename'] = sprintf('b_%d_%d.%s', $c_banner_id, time(), $ext);
        admin_insert_c_image($upfile_obj, $c_banner['image_filename']);
        db_admin_update_c_banner($c_banner_id, $c_banner);

        admin_client_redirect('edit_c_banner', 'バナーを追加しました');
    }
}

?>
