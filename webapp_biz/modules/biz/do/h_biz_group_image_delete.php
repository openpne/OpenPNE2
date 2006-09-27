<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//�O���[�v�摜��폜
class biz_do_h_biz_group_image_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        biz_deleteGroupImage($requests['id'], $requests['filename']);

        client_redirect_absolute("?m=biz&a=page_h_biz_group_edit&target_id=".$request['id']).'&msg'.urlencode('�O���[�v�摜��폜���܂���');
    }
}

?>
