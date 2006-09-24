<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

class biz_do_f_home_delete_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $delid = $requests['delid'];
        $id = $requests['target_id'];
        // ----------

        biz_deleteTodo($delid);

        client_redirect_absolute("?m=pc&a=page_f_home&target_c_member_id=".$id);
    }
}

?>
