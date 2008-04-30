<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_schedule_view extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        if (!biz_isPermissionSchedule($u, $requests['id'])) {
            handle_kengen_error();
        }

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);  //判別フラグ
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);  //判別フラグ
        }

        $this->set('inc_navi',fetch_inc_navi("h"));

        //プロフィール
        $target_member = db_member_c_member4c_member_id($u);
        $this->set("target_member", $target_member);

        //カレンダー関係
        //カレンダー開始用変数
        $year = date("Y");
        $month= date("n");
        //カレンダー用変数
        $date_val=  array(
            'year' => $year,
            'month' => $month,
            'day' => null,
        );
        $this->set("date_val", $date_val);

        //日記のカレンダー
        $calendar = db_common_diary_monthly_calendar($year, $month, $u);

        $this->set("calendar", $calendar['days']);
        $this->set("ym", $calendar['ym']);

        $list = biz_getScheduleInfo($requests['id']);

        //繰り返しフラグのチェック
        $dayofweek = array('日','月','火','水','木','金', '土');

        foreach ($dayofweek as $key => $value) {
            if ($list['rep_type'] & (1 << $key)) {
                $tmp .= $value;
            }
        }

        $list += array('rep_type_loc' => $tmp);
        $list += array('writer_name' => biz_getMemberNickname($list['c_member_id']));

        $list['begin_time'] = substr($list['begin_time'], 0, 5);
        $list['finish_time'] = substr($list['finish_time'], 0, 5);

        $jmembers = biz_getJoinMemberSchedule($requests['id']);
        if (array_search($target_member['nickname'], $jmembers)) {
            $jmembers[$target_member['c_member_id']] = $target_member['nickname'];
            $jmembers = array_unique($jmembers);
        }

        //参加者は10人目まで表示
        if (count($jmembers) > 10) {
            $jam = count($jmembers);
            while ($jam != 10) {
                array_pop($jmembers);
                $jam--;
            }
        }
        $this->set('jam', $jam);

        $this->set('schedule', $list);
        $this->set('jmembers', $jmembers);
        $this->set('jmembers_enc', serialize($jmembers));
        $this->set('schedule_id', $requests['id']);
        $this->set('w', $requests['w']);
        $this->set('is_h', true);
        $this->set('t_id', $target_id);

        if ($list['rep_type']) {
            //繰り返し予定の場合は開始日と期間をセット
            $repeat_begin = biz_getRepeatBegin($requests['id']);
            $repeat_finish = biz_getRepeatFinish($requests['id']);
            $repeat_term = strtotime($repeat_finish) - strtotime($repeat_begin);

            $daycount = $repeat_term / (24 * 60 * 60) / 7;

            $this->set('repeat_begin_date', $repeat_begin);
            $this->set('repeat_term', intval($daycount));
        }

        if ($list['rep_type']) {
            //繰り返し予定の場合はまとめて既読済みに
            $rep_schedule = biz_getRepeatScheduleID($requests['id']);
            foreach ($rep_schedule as $value) {
                biz_readSchedule($u, $value);
            }
        } else {
            biz_readSchedule($u, $requests['id']);
        }
        return 'success';
    }
}

?>
