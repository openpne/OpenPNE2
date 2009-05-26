<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_fh_home_edit_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        if (!biz_isPermissionTodo($u, $requests['id'])) {
            handle_kengen_error();
        }

        $this->set("id", $requests['id']);
        $todo = biz_getTodo($requests['id']);
        $this->set("todo", $todo);

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);  //判別フラグ
            $this->set("cmd", 'h');
            $this->set('inc_navi',fetch_inc_navi('h'));
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);  //判別フラグ
            $this->set("cmd", 'f');
            $this->set('inc_navi',fetch_inc_navi('f'));
        }

        $year_list = array();
        $curr_year = date('Y');
        $year_list[$curr_year] = $curr_year;
        $year_list[$curr_year+1] = $curr_year + 1;
        $this->set('year_list', $year_list);

        $month_list = array();
        for ($i=1; $i <= 12; $i++) {
            $month_list[$i] = $i;
        }
        $this->set('month_list', $month_list);

        $day_list = array();
        for ($i=1; $i <= 31; $i++) {
            $day_list[$i] = $i;
        }
        $this->set('day_list', $day_list);

        $this->set("target_id", $target_id);

        $biz_group_count = biz_getGroupCount($target_id);
        $biz_group_list = biz_getJoinGroupList($target_id, 1, $biz_group_count);

        $this->set('biz_group_list', $biz_group_list[0]);
        $todo_date = explode('-', substr($todo['due_datetime'], 0, 10));
        $this->set('todo_date', $todo_date);

        return 'success';
    }
}

?>
