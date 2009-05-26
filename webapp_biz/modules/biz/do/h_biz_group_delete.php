<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//グループを削除
class biz_do_h_biz_group_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        biz_deleteGroup($requests['target_id']);

        $p = array('msg' => 'グループを削除しました。');
        openpne_redirect('biz', 'page_h_biz_group_find_all', $p);
    }
}

?>
