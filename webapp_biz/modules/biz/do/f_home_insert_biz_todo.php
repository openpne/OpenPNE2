<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

class biz_do_f_home_insert_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $todo = $requests['todo'];
        $id = $requests['target_id'];
        $nickname = $requests['nickname'];
        $is_all = $requests['is_all'];
        // ----------

        biz_insertTodo($id, $todo, $u, 0, $is_all);

        client_redirect_absolute("?m=pc&a=page_f_home&target_c_member_id=".$id);

    }
}

?>
