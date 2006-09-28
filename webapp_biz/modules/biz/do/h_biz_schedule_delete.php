<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        if($requests['is_rep'])
        {
            $rep_schedule = biz_getRepeatScheduleID($requests['schedule_id']);
            foreach($rep_schedule as $value)
                biz_deleteSchedule($value);
        }
        else
            biz_deleteSchedule($requests['schedule_id']);

        client_redirect_absolute("?m=pc&a=page_h_home");


    }
}

?>
