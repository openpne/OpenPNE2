<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_todo_edit extends OpenPNE_Action
{
    function execute($requests)
    {

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        $target_biz_todo_id = $requests['target_biz_todo_id'];

        if (!biz_isPermissionTodo($u, $target_biz_todo_id)) {
            handle_kengen_error();
        }

        $this->set("target_biz_todo_id", $requests['target_biz_todo_id']);
        $todo = biz_getTodo($requests['target_biz_todo_id']);
        if (!strncmp($todo['due_datetime'], '0000', 4)) {
            $todo['due_datetime'] = null;
        }
        $this->set("todo", $todo);

        if (empty($requests['target_c_member_id']) || ($requests['target_c_member_id'] == $u)) {
            //自分
            $target_c_member_id = $u;
            $this->set('is_h', true);       //判別フラグ
        } else {
            //他人
            $target_c_member_id = $requests['target_c_member_id'];
            $this->set('is_f', true);       //判別フラグ
        }

        $this->set('target_c_member_id', $target_c_member_id);

        return 'success';
    }
}

?>
