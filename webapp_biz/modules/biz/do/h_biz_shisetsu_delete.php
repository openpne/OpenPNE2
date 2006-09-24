<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

class biz_do_h_biz_shisetsu_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();
        biz_deleteShisetsuIhige($requests['id'], $requests['filenihe']);

        client_teditect("?m=biz&a=page_s_edit_shisetsu&id=".$requests['id']);
    }
}

?>
