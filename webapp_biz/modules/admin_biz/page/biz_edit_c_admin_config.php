<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// BIZ基本設定

class admin_biz_page_biz_edit_c_admin_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_admin_config'] = biz_admin_c_admin_config_all();
        $this->set($v);

        return 'success';
    }
}

?>
