<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_check_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $chid = $requests['chid'];
        $is_check = $requests['is_check'];
        // ----------

        biz_checkTodo($chid, $is_check);

        if (!biz_isPermissionTodo($u, $chid)) {
            handle_kengen_error();
        }

        $p = array();
        openpne_redirect('pc', 'page_h_home', $p);
    }
}

?>
