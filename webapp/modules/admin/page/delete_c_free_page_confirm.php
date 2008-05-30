<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// フリーページ削除
class admin_page_delete_c_free_page_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set("c_free_page", db_admin_get_c_free_page_one($requests['c_free_page_id']));
        return 'success';
    }
}

?>
