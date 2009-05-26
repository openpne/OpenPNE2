<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_group_image_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        biz_deleteGroupImage($requests['id'], $requests['filename']);

        $p = array('msg' => '画像を削除しました', 'target_id' => $requests['id']);
        openpne_redirect('biz', 'page_h_biz_group_edit', $p);
    }
}

?>
