<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// フリーページ編集
class admin_do_delete_c_free_page extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_delete_c_free_page($requests['c_free_page_id']);

        admin_client_redirect('list_c_free_page', 'フリーページを削除しました');
    }
}

?>
