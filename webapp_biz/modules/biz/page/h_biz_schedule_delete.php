<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//予定削除確認画面

class biz_page_h_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi("h"));
        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('schedule_id',$requests['schedule_id']);
        $this->set("is_rep", $requests['is_rep']);

        return 'success';
    }
}

?>
