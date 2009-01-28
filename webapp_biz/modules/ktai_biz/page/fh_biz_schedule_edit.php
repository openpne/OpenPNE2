<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_schedule_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);   //判別フラグ
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);   //判別フラグ
        }

        //日付・時刻を出す
        if (!is_null($requests['begin_date'])) {
            $begin_year = date("y", strtotime($requests['begin_date']));
            $begin_month = date("m", strtotime($requests['begin_date']));
            $begin_day = date("d", strtotime($requests['begin_date']));
        }

        if (!is_null($requests['begin_time'])) {
            $begin_hour = date("H", strtotime($requests['begin_time']));
            $begin_min = date("i", strtotime($requests['begin_time']));
        }

        if (!is_null($requests['finish_time'])) {
            $finish_hour = date("H", strtotime($requests['finish_time']));
            $finish_min = date("i", strtotime($requests['finish_time']));
        }

        $j_members = unserialize($requests['members']);

        if ($j_members) {
            sort($j_members);
        }

        $begin = array(
            'year' => $begin_year,
            'month' => $begin_month,
            'day' => $begin_day,
            'hour' => $begin_hour,
            'min' => $begin_min,
            );

        $finish = array(
            'hour' => $finish_hour,
            'min' => $finish_min,
        );

        $this->set('begin', $begin);
        $this->set('finish', $finish);
        $this->set('title', $requests['title']);
        $this->set('value', $requests['value']);
        $this->set('schedule_id', $requests['schedule_id']);
        $this->set('member', $j_members);
        $this->set('member_e', $requests['members']);
        $this->set('writer', $requests['writer']);
        $this->set('t_id', $target_id);
        $this->set('msg', $requests['msg']);
        $this->set('public_flag', $requests['public_flag']);

        return 'success';
    }
}

?>
