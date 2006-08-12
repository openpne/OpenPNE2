<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_delete_c_image extends OpenPNE_Action
{
    function execute($requests)
    {
        image_data_delete($requests['filename']);
        db_admin_delete_c_image_link4image_filename($requests['filename']);

        admin_client_redirect('edit_c_image', '画像を削除しました');
    }
}

?>
