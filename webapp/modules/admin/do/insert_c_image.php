<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_insert_c_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_image', array_shift($errors));
    }

    function execute($requests)
    {
        $file = $_FILES['upfile'];

        if (empty($file) || $file['error'] === UPLOAD_ERR_NO_FILE) {
            admin_client_redirect('edit_c_image', '画像ファイルを指定してください');
        }

        if (!t_check_image($file)) {
            admin_client_redirect('edit_c_image', '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください');
        }

        db_image_data_delete($requests['filename']);
        if (!admin_insert_c_image($_FILES['upfile'], $requests['filename'])) {
            admin_client_redirect('edit_c_image', '画像が登録できませんでした');
        }

        admin_client_redirect('edit_c_image', '画像を登録しました', 'filename='.$requests['filename']);
    }
}

?>
