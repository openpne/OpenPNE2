<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_do_fh_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $target_id = $requests['target_id'];
        
        if($requests['is_rep'])
        {
            $rep_schedule = biz_getRepeatScheduleID($requests['schedule_id']);
            foreach($rep_schedule as $value)
                biz_deleteSchedule($value);
        }
        else
            biz_deleteSchedule($requests['schedule_id']);

        client_redirect_absolute("?m=ktai_biz&a=page_fh_calendar_week&target_id=$target_id&$tail");

    }
}
?>
