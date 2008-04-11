<?php
class ktai_biz_do_fh_biz_todo_edit extends OpenPNE_Action
{
    function handleError($errors)
    {
        ktai_display_error($errors);
    }

    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $target_biz_todo_id = $requests['target_biz_todo_id'];
        $target_c_member_id = $requests['target_c_member_id'];
        $value = $requests['value'];
        $due_datetime_y = $requests['due_datetime_y'];
        $due_datetime_m = $requests['due_datetime_m'];
        $due_datetime_d = $requests['due_datetime_d'];
        // ----------

        if (!biz_isPermissionTodo($u, $target_biz_todo_id)) {
            handle_kengen_error();
        }

        if (empty($value)) {
            $p = array('target_biz_todo_id' => $target_biz_todo_id, 'msg' => 1);
            ktai_biz_openpne_redirect('ktai_biz', 'page_fh_biz_todo_edit', $p);
        }

        if ($due_datetime_y && $due_datetime_m && $due_datetime_d) {
            $due_datetime = $due_datetime_y . '-' . $due_datetime_m . '-' . $due_datetime_d . ' 00:00:00';
        } else {
            $due_datetime = '0000-00-00 00:00:00';
        }

        if (is_null($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        $todo = biz_getTodo($target_biz_todo_id);

        $is_all = $todo['is_all'];
        $is_done = $todo['is_check'];
        $priority = $todo['priority'];
        $biz_group_id = $todo['biz_group_id'];
        $public_flag = $todo['public_flag'];

        biz_editTodo($target_c_member_id, $value, $u, 0, $is_all, $target_biz_todo_id,
            $is_done, $due_datetime, $priority, $biz_group_id, $public_flag);
        $p = array('target_c_member_id' => $target_c_member_id);
        ktai_biz_openpne_redirect('ktai_biz', 'page_fh_biz_todo_list', $p);
    }
}
?>
