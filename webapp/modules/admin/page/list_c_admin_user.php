<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// アカウント管理
class admin_page_list_c_admin_user extends OpenPNE_Action
{
    function execute($requests)
    {
        $this->set('user_list', db_admin_c_admin_user_list());
        return 'success';
    }
}

?>
