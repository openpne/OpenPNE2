<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_delete_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $delid = $requests['delid'];
        // ----------

        biz_deleteTodo($delid);

        if (!biz_isPermissionTodo($u, $delid)) {
            handle_kengen_error();
        }

        $p = array();
        openpne_redirect('pc', 'page_h_home', $p);
    }
}

?>
