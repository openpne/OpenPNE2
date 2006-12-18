<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//予定登録
class biz_page_fh_biz_schedule_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
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

        $sessid = session_id();

        $target_member = db_member_c_member4c_member_id($u);
        //プロフィール
        $this->set("target_member", $target_member);
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
        $this->set("begin_date", $begin_date);
        $this->set("finish_date", $finish_date);

        $this->set("sc_title", $requests['sc_title']);
        $this->set("sc_memo", $requests['sc_memo']);

        //日付関連
        if ($requests['begin_date']) {
            $nowyear = date("Y", strtotime($requests['begin_date']));
            $nowmonth = date("m", strtotime($requests['begin_date']));
            $nowday = date("d", strtotime($requests['begin_date']));

            if ($requests['begin_time']) {
                $this->set('begin_hour', date("H", strtotime($requests['begin_time'])));
                $this->set('begin_min', date("i", strtotime($requests['begin_time'])));
            }

            if ($requests['finish_time']) {
                $this->set('finish_hour', date("H", strtotime($requests['finish_time'])));
                $this->set('finish_min', date("i", strtotime($requests['finish_time'])));
            }
        } else {
            $nowyear = date("Y");
            $nowmonth = date("m");
            $nowday = date("d");
        }

        for ($i = $nowyear; $i <= $nowyear+10; $i++) {
            if ($i == $nowyear) {
                //現在年をデフォルトに
                $years = '<option value="'.$i.'" selected>';
            } else {
                $years .= '<option value="'.$i.'">';
            }
            $years .= $i.'年';
        }

        for ($i = 1; $i <= 12; $i++) {
            $i_f = sprintf("%02d",$i);  //月は常に二桁
            if ($i == $nowmonth) {
                //現在月をデフォルトに
                $monthes .= '<option value="'.$i_f.'" selected>';
            } else {
                $monthes .= '<option value="'.$i_f.'">';
            }
            $monthes .= $i.'月';
        }

        for ($i = 1; $i <= 31; $i++) {
            $i_f = sprintf("%02d",$i);  //日は常に二桁
            if ($i == $nowday) {
                $days .= '<option value="'.$i_f.'" selected>';
            } else {
                $days .= '<option value="'.$i_f.'">';
            }
            $days .= $i.'日';
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
        $this->set('my_id', $u);
        $this->set('is_h', true);

        $biz_group_count = biz_getGroupCount($target_id);
        $biz_group_list = biz_getJoinGroupList($target_id, 1, $biz_group_count);

        $this->set('biz_group_list', $biz_group_list[0]);

        return 'success';
    }
}

?>
