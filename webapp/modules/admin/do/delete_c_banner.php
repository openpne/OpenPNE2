<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// バナー削除
class admin_do_delete_c_banner extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_delete_c_banner($requests['c_banner_id']);

        admin_client_redirect('edit_c_banner', 'バナーを削除しました');
    }
}

?>
