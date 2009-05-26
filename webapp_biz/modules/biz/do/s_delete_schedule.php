<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_s_delete_schedule extends OpenPNE_Action
{
    function execute($requests)
    {


        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        biz_deleteShisetsuSchedule($requests['shisetsu_id']);

        $p = array('msg' => '施設スケジュールを削除しました');
        openpne_redirect('biz', 'page_s_list', $p);

    }
}

?>
