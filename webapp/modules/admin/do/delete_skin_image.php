<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像削除
class admin_do_delete_skin_image extends OpenPNE_Action
{
    function execute($requests)
    {
        db_delete_c_skin_filename($requests['skinname']);

        admin_client_redirect('edit_skin_image', '画像をデフォルトに戻しました');
    }
}

?>
