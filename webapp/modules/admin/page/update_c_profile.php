<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール項目編集
class admin_page_update_c_profile extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_profile'] = db_admin_c_profile4c_profile_id($requests['c_profile_id']);

        $this->set($v);
        return 'success';
    }
}

?>
