<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
        if (!empty($_FILES['upfile']) && $_FILES['upfile']['error'] !== UPLOAD_ERR_NO_FILE && !empty($requests['filename'])) {
            image_data_delete($requests['filename']);
            admin_insert_c_image($_FILES['upfile'], $requests['filename']);

            admin_client_redirect('edit_c_image', '画像を登録しました', 'filename='.$requests['filename']);
        }

        admin_client_redirect('edit_c_image', 'ファイル名と画像ファイルを指定してください');
    }
}

?>
