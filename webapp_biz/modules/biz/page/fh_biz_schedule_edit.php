<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_fh_biz_schedule_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }
        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];

        $this->set('banner', $requests['sc_bn']);

        if ($requests['sc_title']) {
            $requests['title'] = $requests['sc_title'];
        }

        if ($requests['sc_memo']) {
            $requests['value'] = $requests['sc_memo'];
        }

        if ($requests['sc_b_year'] && $requests['sc_b_month'] && $requests['sc_b_date']) {
            $requests['begin_date'] = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
        }

        if ($requests['sc_b_hour'] && $requests['sc_b_minute']) {
            $requests['begin_time'] = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
        }

        if ($requests['sc_f_hour'] && $requests['sc_f_minute']) {
            $requests['finish_time'] = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];
        }

        $sessid = session_id();

        $schedule = biz_getScheduleInfo($requests['schedule_id']);

        if ($schedule['c_member_id'] == $u) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);  //判別フラグ
            $this->set('inc_navi',fetch_inc_navi('h'));
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);  //判別フラグ
            $this->set('inc_navi',fetch_inc_navi('f'));
        }

        //プロフィール
        $this->set("target_member", db_member_c_member4c_member_id($u));
        $this->set("form_val", $form_val);

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

        //日付関連
        if ($requests['rep_type']) {
            $begin_date = biz_getRepeatBegin($requests['schedule_id']);
        } else {
            $begin_date = $requests['begin_date'];
        }

        $nowyear = date("Y", strtotime($begin_date));
        $nowmonth = date("m", strtotime($begin_date));
        $nowday = date("d", strtotime($begin_date));

        for ($i = $nowyear; $i <= $nowyear+10; $i++) {
            if ($i == $nowyear) {
                $years = '<option value="'.$i.'" selected="selected">';
            } else {
                $years .= '<option value="'.$i.'">';
            }
            $years .= $i.'年';
            $years .= '</option>';
        }

        for ($i = 1; $i <= 12; $i++) {
            $i_f = sprintf("%02d",$i);  //月は常に二桁
            if ($i == $nowmonth) {
                $monthes .= '<option value="'.$i_f.'" selected="selected">';
            } else {
                $monthes .= '<option value="'.$i_f.'">';
            }
            $monthes .= $i.'月';
            $monthes .= '</option>';
        }

        for ($i = 1; $i <= 31; $i++) {
            $i_f = sprintf("%02d",$i);  //日は常に二桁
            if ($i == $nowday) {
                $days .= '<option value="'.$i_f.'" selected="selected">';
            } else {
                $days .= '<option value="'.$i_f.'">';
            }
            $days .= $i.'日';
            $days .= '</option>';
        }

        $hours = biz_makeSerialArray(23);  //時
        $mins = biz_makeSerialArray(55, 0, 5);  //分
        $wk = array('日', '月', '火', '水', '木', '金', '土');  //週
        $rp_count = biz_makeSerialArray(12, 1);  //繰り返し回数
        $bn_num = biz_makeSerialArray(31, 1);  //日数

        $this->set('years', $years);
        $this->set('monthes', $monthes);
        $this->set('days', $days);
        $this->set('hours', $hours);
        $this->set('mins', $mins);
        $this->set('wk', $wk);
        $this->set('rp_count', $rp_count);
        $this->set('bn_num', $bn_num);

        $this->set('title', $requests['title']);
        $this->set('value', $requests['value']);


        if (!is_null($requests['begin_time'])) {
            $this->set('begin_hour', date("G", strtotime($requests['begin_time'])));
        }

        if (!is_null($requests['begin_time'])) {
            $begin_min = date("i", strtotime($requests['begin_time']));
            if (substr($begin_min, 0, 1) == '0') {
                $begin_min = substr($begin_min, 1,1);
            }
        }

        if (!is_null($requests['begin_time'])) {
            $this->set('begin_min', $begin_min);
        }
        if (!is_null($requests['finish_time'])) {
            $this->set('finish_hour', date("G", strtotime($requests['finish_time'])));
        } else {
            $this->set('finish_hour', null);
        }

        if (!is_null($requests['finish_time'])) {
            $finish_min = date("i", strtotime($requests['finish_time']));
        }
        if (substr($finish_min, 0, 1) == '0') {
            $finish_min = substr($finish_min, 1,1);
        }

        if (!is_null($requests['begin_time'])) {
            $this->set('finish_min', $finish_min);
        } else {
            $this->set('finish_min', null);
        }

        if ($requests['rep_type']) {
            $is_rep = true;
        } else {
            if ($requests['sc_rp']) {
                $is_rep = true;
            } else {
                $is_rep = false;
            }
        }

        $dayofweek = array();

        if (empty($requests['rep_type'])) {
            foreach ($requests['sc_rwk'] as $value) {
                $rp_rule += 1 << $value;
            }
            $requests['rep_type'] = $rp_rule;
        }

        for ($i = 0; $i <= 6; $i++) {
            if ($requests['rep_type'] & (1 << $i)) {
                array_push($dayofweek, 1);
            } else {
                array_push($dayofweek, 0);
            }
        }
        $this->set('rep_type', $dayofweek);
        $this->set('is_rep', $is_rep);

        $this->set('schedule_id', $requests['schedule_id']);

        $repeat_begin = biz_getRepeatBegin($requests['schedule_id']);
        $repeat_finish = biz_getRepeatFinish($requests['schedule_id']);
        $repeat_term = strtotime($repeat_finish) - strtotime($repeat_begin);

        $daycount = $repeat_term / (24 * 60 * 60) / 6;

        $this->set('repeat_begin_date', $repeat_begin);
        if (isset($requests["sc_rcount"])) {
            $daycount = $requests["sc_rcount"];
        }
        $this->set('repeat_term', ceil($daycount));

        $biz_group_count = biz_getGroupCount($target_id);
        $biz_group_list = biz_getJoinGroupList($target_id, 1, $biz_group_count);

        $this->set('biz_group_list', $biz_group_list[0]);
        $this->set('target_biz_group_id', $schedule['biz_group_id']);

        if ($requests['public_flag']) {
            $this->set('public_flag', $requests['public_flag']);
        } else {
            $this->set('public_flag', $schedule['public_flag']);
        }

        //追加
        if ($requests['members']) {
            $j_members = array_keys(unserialize($requests['members']));
            sort($j_members);
        } elseif($requests['sc_j_mem']) {
            $j_members = $requests['sc_j_mem'];
        } else {
            $j_members = biz_getJoinMemberSchedule($requests['schedule_id']);
        }
        $this->set('j_members', $j_members);
        $members = array();

        $sql = 'SELECT c_member_id, nickname FROM c_member';
        $members = db_get_all($sql, $params);
        $i = 0;
        foreach ($members as $key => $value) {
            if (in_array($value['c_member_id'], $j_members)) {
                $members[$key]['checkflag'] = 1;
                $i++;
            }

            if (count($j_members) < $i) {
                break;
            }
        }

        $this->set('members', $members);

        return 'success';
    }
}

?>
