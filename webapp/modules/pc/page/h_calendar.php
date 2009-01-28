<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_calendar extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('pc', 'page_h_calendar');
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $year = intval($requests['year']);
        $month = intval($requests['month']);
        // ----------

        if (!$year) $year = date('Y');
        if (!$month) $month = date('n');

        if ($year == date('Y') && $month == date('n')) {
            $is_curr = true;
            $curr_day = date('d');
        }

        if ($year < date('Y') || ($year > intval(date('Y')) + 1)) {
            $this->set('add_schedule', false);
        } else {
            $this->set('add_schedule', true);
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        // イベント
        $event_list = db_schedule_event4c_member_id($year, $month, $u);
        // 誕生日
        $birth_list = db_schedule_birth4c_member_id($month, $u);

        include_once 'Calendar/Month/Weekdays.php';
        $Month = new Calendar_Month_Weekdays($year, $month, 0);
        $Month->build();

        $calendar = array();
        $i = 0;
        while ($Day = $Month->fetch()) {
            if ($Day->isFirst()) $i++;

            if ($Day->isEmpty()) {
                $calendar[$i][] = array();
            } else {
                $day = $Day->thisDay();
                $item = array(
                    'day' => $day,
                    'now' => false,
                    'birth' => $birth_list[$day],
                    'event' => $event_list[$day],
                    'schedule' => db_schedule_c_schedule_list4date($year, $month, $day, $u),
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

        $c_member = db_member_c_member4c_member_id($u);
        $this->set("pref_list", p_regist_prof_c_profile_pref_list4null());
        $this->set("c_member", $c_member);

        return 'success';
    }
}

?>
