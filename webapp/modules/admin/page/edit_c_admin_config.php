<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 設定変更
class admin_page_edit_c_admin_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();
        $v['DAILY_NEWS_DAY'] = explode(',', DAILY_NEWS_DAY);
        $this->set($v);
        return 'success';
    }
}

?>
