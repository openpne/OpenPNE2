<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// SNS設定変更
class admin_biz_do_biz_admin_delete_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        $id = $requests['biz_shisetsu_id'];

        biz_deleteShisetsu($id);

        admin_biz_client_redirect('biz_shisetsu_list', "施設を削除しました。");
    }
}

?>
