<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//BIZ施設リスト＋新規登録

class admin_biz_page_biz_shisetsu_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['shisetsu_list'] = biz_admin_getShisetsuList();
        $this->set($v);

        return 'success';
    }
}

?>
