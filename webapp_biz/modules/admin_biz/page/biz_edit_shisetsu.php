<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

//Ž{Ý•ÏX
class admin_biz_page_biz_edit_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['shisetsu'] = biz_getShisetsuData($requests['biz_shisetsu_id']);

        $this->set($v);

        return 'success';
    }

}

?>