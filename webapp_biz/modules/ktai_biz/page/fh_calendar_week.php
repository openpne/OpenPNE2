<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_calendar_week extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        $c_member_secure = db_member_c_member_secure4c_member_id($u);

        $prof_id = $requests['prof_id'];
        $w = $requests['w'];

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);//判別フラグ
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);//判別フラグ
        }

        require_once 'Calendar/Week.php';
        $w = intval($requests['w']);

        if (empty($w)) {
            $w = 0;
        }

        $this->set('w', $w);
        $time = strtotime($w." week");
        $Week = new Calendar_Week(date('Y', $time), date('m', $time), date('d', $time), 0);
        $Week-> build();

        $calendar = array();
        $schedule = array();
        $dayofweek = array('日','月','火','水','木','金','土');
        $i = 0;
        $n = 0;

        while ($Day = $Week->fetch()) {
            $y = sprintf("%02d", $Day->thisYear());
            $m = sprintf("%02d", $Day->thisMonth());
            $d = sprintf("%02d", $Day->thisDay());
            $m_disp = sprintf("%2d", $Day->thisMonth());

            if ($i == 0) {
                $this->set("y_disp", $y);
                $this->set("m_disp", $m_disp);
            }

            //イベント
            $event_list = db_commu_event4c_member_id($y, $m, $d, $target_id);
            // 誕生日
            $birth_list = db_schedule_birth4c_member_id($m, $target_id);

            //スケジュール
            $schedule = biz_getDateMemberSchedule($y,$m,$d,$target_id,$u);

            $banner = biz_isBannerSchedule($y, $m, $d, $target_id);

            if (!empty($banner)) {
                foreach ($banner as $value) {
                    array_push($schedule, $value);
                }
            }

            $item = array(
                'year'=> $y,
                'month' => $m,
                'day' => $d,
                'dayofweek' => $dayofweek[$i++],
                'now' => false,
                'event' => $event_list,
                'birth' => $birth_list[intval($d)],
                'schedule' => $schedule,
            );
            if ($w == 0 && $d == date('d')) {
                $item['now'] = true;
            }

            $calendar[] = $item;
        }

        $this->set("calendar", $calendar);


        $c_member = db_member_c_member4c_member_id($target_id);
        $this->set("pref_list", p_regist_prof_c_profile_pref_list4null());
        $this->set("c_member", $c_member);
        $this->set("msg", $requests['msg']);

        return 'success';
    }
}

?>
