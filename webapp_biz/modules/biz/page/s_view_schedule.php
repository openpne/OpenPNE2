<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_s_view_schedule extends OpenPNE_Action
{
    function execute($requests)
    {

        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $id = $requests['id'];

        $shisetsu_id = biz_getJoinShisetsuScheduleID($id);

        $list = biz_getShisetsuData($shisetsu_id);
        $schedule = biz_getShisetsuScheduleID($id);

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set("list", $list);
        $this->set('schedule', $schedule);
        $this->set("id", $id);
        $this->set("w", (date("W", (strtotime($schedule['date'])-strtotime(date("Y-m-d"))))-1));
        $config = biz_getConfig();


        return 'success';
    }
}

?>
