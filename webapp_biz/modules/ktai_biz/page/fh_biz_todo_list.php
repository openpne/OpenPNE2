<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_todo_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        $target_c_member_id = $requests['target_c_member_id'];
        if (is_null($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        $is_checked = $requests['is_checked'];
        if ($is_checked) {
            $todolist = biz_getMemberTodo($u, $target_c_member_id, 1);
        } else {
            $todolist = biz_getMemberTodo($u, $target_c_member_id);
        }

        $this->set('todolist', $todolist);
        $this->set('is_checked', $is_checked);
        $this->set('target_c_member_id', $target_c_member_id);

        return 'success';
    }
}

?>
