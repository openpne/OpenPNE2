<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_shisetsu_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();
        biz_deleteShisetsuImage($requests['id'], $requests['filename']);

        $p = array('id' => $requests['id']);
        openpne_redirect('biz', 'page_s_edit_shisetsu', $p);
    }
}

?>
