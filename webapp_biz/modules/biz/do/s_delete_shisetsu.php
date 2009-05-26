<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//施設情報削除
class biz_do_s_delete_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {

        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $id = $requests['target_id'];

        biz_deleteShisetsu($id);

        $p = array('msg' => '施設情報を削除しました' );


        openpne_redirect('biz', 'page_s_list', $p);

    }
}

?>
