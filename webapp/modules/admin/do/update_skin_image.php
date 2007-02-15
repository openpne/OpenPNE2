<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_update_skin_image extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$_FILES['upfile']['size']) {
            admin_client_redirect('edit_skin_image', 'ファイルが指定されていません');
        }

        $prefix = sprintf('skin_%s', $requests['skinname']);
        if ($fn = image_insert_c_image($_FILES['upfile'], $prefix)) {
            if ($old_fn = db_get_c_skin_filename4skinname($requests['skinname'])) {
                image_data_delete($old_fn);
            }
            db_replace_c_skin_filename($requests['skinname'], $fn);
            admin_client_redirect('edit_skin_image', 'スキン画像を変更しました');
        }

        admin_client_redirect('edit_skin_image', 'スキン画像を変更できませんでした');
    }
}

?>
