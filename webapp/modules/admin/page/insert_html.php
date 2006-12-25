<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// おしらせなど更新
class admin_page_insert_html extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_siteadmin'] = db_admin_c_siteadmin($requests['target']);

        $this->set($v);
        return 'success';
    }
}

?>
