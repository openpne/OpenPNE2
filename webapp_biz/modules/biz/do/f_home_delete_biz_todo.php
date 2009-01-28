<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
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

        if (!biz_isPermissionTodo($u, $delid)) {
            handle_kengen_error();
        }
        biz_deleteTodo($delid);

        $todo = biz_getTodo($delid);

        $p = array('target_c_member_id' => $id);
        openpne_redirect('pc', 'page_f_home', $p);
    }
}

?>
