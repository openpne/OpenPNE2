<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_do_fh_biz_todo_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $target_biz_todo_id = $requests['target_biz_todo_id'];
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        if (is_null($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        if (!biz_isPermissionTodo($u, $target_biz_todo_id)) {
            handle_kengen_error();
        }
        biz_deleteTodo($target_biz_todo_id);

        $p = array('target_c_member_id' => $target_c_member_id,
            'is_checked' => $is_checked);
        ktai_biz_openpne_redirect('ktai_biz', 'page_fh_biz_todo_list', $p);
    }
}
?>
