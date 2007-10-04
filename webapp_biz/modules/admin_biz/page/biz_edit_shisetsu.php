<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//�{�ݕύX
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
