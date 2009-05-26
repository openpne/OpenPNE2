<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_fh_biz_schedule_calendar extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $year = $requests['year'];
        $month = $requests['month'];
        $pref_id = $requests['pref_id'];
        // ----------

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);  //判別フラグ
            $this->set('inc_navi',fetch_inc_navi('h'));
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);  //判別フラグ
            $this->set('inc_navi',fetch_inc_navi('f', $target_id));
        }

        if (!$year) {
            $year = date('Y');
        }
        if (!$month) {
            $month = date('n');
        }

        if ($year == date('Y') && $month == date('n')) {
            $is_curr = true;
            $curr_day = date('d');
        }

        // イベント
        $event_list = db_schedule_event4c_member_id($year, $month, $target_id);
        // 誕生日
        $birth_list = db_schedule_birth4c_member_id($month, $target_id);
        // Todo
        $todo_list = biz_schedule_todo4c_member_id($u, $target_id, $year, $month);

        require_once 'Calendar/Month/Weekdays.php';
        $Month = new Calendar_Month_Weekdays($year, $month, 0);
        $Month->build();

        $calendar = array();
        $schedule = array();
        $i = 0;
        while ($Day = $Month->fetch()) {
            if ($Day->isFirst()) $i++;

            if ($Day->isEmpty()) {
                $calendar[$i][] = array();
            } else {
              $day = $Day->thisDay();

              $schedule = biz_getDateMemberSchedule($year, sprintf("%02d", $month), sprintf("%02d", $day), $target_id, $u);
              $banner = biz_isBannerSchedule($year, sprintf("%02d", $month), sprintf("%02d", $day), $target_id);

              if (!empty($banner)) {
                    foreach($banner as $value) {
                        array_push($schedule, $value);
                    }
              }

              $item = array(
                'day' => $day,
                'now' => false,
                'birth' => $birth_list[$day],
                'event' => $event_list[$day],
                'schedule' => $schedule,
                'todo' => $todo_list[$day],
                'holiday' => db_c_holiday_list4date($month, $day),
              );
              $item['day'] = $day;
              if ($is_curr && $item['day'] == $curr_day) {
                $item['now'] = true;
              }

              $calendar[$i][] = $item;
            }
        }

        $ym = array(
            'year_disp'  => $year,
            'month_disp' => $month,
            'year_prev'  => date('Y', $Month->prevMonth(true)),
            'month_prev' => date('n', $Month->prevMonth(true)),
            'year_next'  => date('Y', $Month->nextMonth(true)),
            'month_next' => date('n', $Month->nextMonth(true)),
        );
        $this->set("ym", $ym);

        $this->set("year", $year);
        $this->set("month", $month);
        $this->set("calendar", $calendar);

        $c_member = db_member_c_member4c_member_id($target_id);
        $this->set("pref_list", p_regist_prof_c_profile_pref_list4null());
        $this->set("c_member", $c_member);

        return 'success';
    }
}

?>
