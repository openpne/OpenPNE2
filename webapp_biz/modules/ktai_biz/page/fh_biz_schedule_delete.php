<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//スケジュール削除確認画面
class ktai_biz_page_fh_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }

        $this->set('schedule_id',$requests['schedule_id']);
        $this->set("t_id", $requests['target_id']);

        return 'success';
    }
}

?>
