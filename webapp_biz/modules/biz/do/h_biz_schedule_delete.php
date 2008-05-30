<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

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

        $p = array();
        openpne_redirect('pc', 'page_h_home', $p);
    }
}

?>
