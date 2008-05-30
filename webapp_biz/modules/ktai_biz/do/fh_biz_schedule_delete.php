<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_do_fh_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $target_id = $requests['target_id'];

        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }

        if ($requests['is_rep']) {
            $rep_schedule = biz_getRepeatScheduleID($requests['schedule_id']);
            foreach ($rep_schedule as $value) {
                biz_deleteSchedule($value);
            }
        } else {
            biz_deleteSchedule($requests['schedule_id']);
        }

        $p = array('target_id' => $requests['target_id']);
        ktai_biz_openpne_redirect('ktai_biz', 'page_fh_calendar_week', $p);
    }
}

?>
