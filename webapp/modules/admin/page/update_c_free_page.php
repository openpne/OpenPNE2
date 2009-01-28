<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// フリーページ編集
class admin_page_update_c_free_page extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set("c_free_page", db_admin_get_c_free_page_one($requests['c_free_page_id']));
        return 'success';
    }
}

?>
