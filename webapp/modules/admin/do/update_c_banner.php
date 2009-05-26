<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// バナー編集
class admin_do_update_c_banner extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_banner_id = $requests['c_banner_id'];

        $upfile_obj = $_FILES['upfile'];
        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $tail = '&c_banner_id=' . $c_banner_id;
                admin_client_redirect('update_c_banner', '画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください', $tail);
            }

            db_admin_delete_c_image4c_banner_id($c_banner_id);

            $ext = t_check_image_format($upfile_obj);
            $c_banner['image_filename'] = sprintf('b_%d_%d.%s', $c_banner_id, time(), $ext);
            admin_insert_c_image($upfile_obj, $c_banner['image_filename']);
        }

        $c_banner['a_href'] = $requests['a_href'];
        $c_banner['type'] = $requests['type'];
        $c_banner['nickname'] = $requests['nickname'];
        $c_banner['is_hidden_before'] = $requests['is_hidden_before'];
        $c_banner['is_hidden_after'] = $requests['is_hidden_after'];

        db_admin_update_c_banner($c_banner_id, $c_banner);

        admin_client_redirect('edit_c_banner', 'バナーを変更しました');
    }
}

?>
