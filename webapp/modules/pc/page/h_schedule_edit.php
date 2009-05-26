<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_schedule_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $this->set('inc_navi', fetch_inc_navi('h'));

        // --- リクエスト変数
        $target_c_schedule_id = $requests['target_c_schedule_id'];
        $input = $requests;
        // ----------


        $c_schedule = db_schedule_c_schedule4c_schedule_id($target_c_schedule_id);
        if ($c_schedule['c_member_id'] != $u) {
            handle_kengen_error();
        }
        $this->set('target_c_schedule_id', $target_c_schedule_id);


        $list = array(
          "title"=>$c_schedule['title'],
          "body"=>$c_schedule['body'],
          "start_year"=>date('Y', strtotime($c_schedule['start_date'])),
          "start_month"=>date('m', strtotime($c_schedule['start_date'])),
          "start_day"=>date('d', strtotime($c_schedule['start_date'])),
          "start_hour"=>date('H', strtotime($c_schedule['start_time'])),
          "start_minute"=>date('i', strtotime($c_schedule['start_time'])),
          "end_year"=>date('Y', strtotime($c_schedule['end_date'])),
          "end_month"=>date('m', strtotime($c_schedule['end_date'])),
          "end_day"=>date('d', strtotime($c_schedule['end_date'])),
          "end_hour"=>date('H', strtotime($c_schedule['end_time'])),
          "end_minute"=>date('i', strtotime($c_schedule['end_time'])),
          "is_receive_mail"=>$c_schedule['is_receive_mail'],
        );
        if (is_null($c_schedule['start_time'])) {
            $list['start_hour'] = null;
            $list['start_minute'] = null;
        }
        if (is_null($c_schedule['end_time'])) {
            $list['end_hour'] = null;
            $list['end_minute'] = null;
        }

        foreach ($list as $key=>$default) {
            if (is_null($input[$key])) {
                $input[$key] = $default;
            }
        }
        $this->set('input', $input);

        $year_list = array();
        $curr_year = date('Y');
        $year_list[$curr_year] = $curr_year;
        $year_list[$curr_year+1] = $curr_year + 1;
        $this->set('year_list', $year_list);

        $month_list = array();
        for ($i=1; $i <= 12; $i++) {
            $month_list[$i] = $i;
        }
        $this->set('month_list', $month_list);


        $day_list = array();
        for ($i=1; $i <= 31; $i++) {
            $day_list[$i] = $i;
        }
        $this->set('day_list', $day_list);

        $hour_list = array();
        for ($i=0; $i <= 23; $i++) {
            $hour_list[$i] = sprintf("%02d", $i);
        }
        $this->set('hour_list', $hour_list);

        $minute_list = array();
        for ($i=0; $i < 60; $i+=15) {
            $minute_list[$i] = sprintf("%02d", $i);
        }
        $this->set('minute_list', $minute_list);

        $this->set('is_unused_schedule', util_is_unused_mail('m_pc_schedule_mail'));
        return 'success';
    }
}
?>
