<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// バナー編集画面
class admin_page_update_c_banner extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_banner'] = db_banner_get_c_banner4id($requests['c_banner_id']);

        $this->set($v);
        return 'success';
    }
}

?>
