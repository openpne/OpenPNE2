<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_schedule_edit_update_c_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_schedule_id = $requests['target_c_schedule_id'];
        $title = $requests['title'];
        $body = $requests['body'];
        $start_year = $requests['start_year'];
        $start_hour = $requests['start_month'];
        $start_day = $requests['start_day'];
        $start_hour = $requests['start_hour'];
        $start_minute = $requests['start_minute'];
        $end_year = $requests['end_year'];
        $end_hour = $requests['end_month'];
        $end_day = $requests['end_day'];
        $end_hour = $requests['end_hour'];
        $end_minute = $requests['end_minute'];
        $is_receive_mail = $requests['is_receive_mail'];
        // ----------


        //--- 権限チェック
        //スケジュール作成者

        $c_schedule = db_schedule_c_schedule4c_schedule_id($target_c_schedule_id);
        if ($c_schedule['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---


        $list = array(
            'title' => '',
            'body' => '',
            'start_year' => null,
            'start_month' => null,
            'start_day' => null,
            'start_hour' => null,
            'start_minute' => null,
            'end_year' => null,
            'end_month' => null,
            'end_day' => null,
            'end_hour' => null,
            'end_minute' => null,
            'is_receive_mail' => 0,
        );
        foreach ($list as $key=>$value) {
            $input[$key] = $requests[$key];
        }

        if (is_null($input['start_hour']) xor is_null($input['start_minute'])) {
            $this->handleError(array('開始時刻が正しくありません'));
        }
        if (is_null($input['end_hour']) xor is_null($input['end_minute'])) {
            $this->handleError(array('終了時刻が正しくありません'));
        }

        $title = trim($input['title']);

        if (is_null($input['end_year'])) {
            $input['end_year'] = $input['start_year'];
        }
        if (is_null($input['end_month'])) {
            $input['end_month'] = $input['start_month'];
        }
        if (is_null($input['end_day'])) {
            $input['end_day'] = $input['start_day'];
        }

        $start_date = sprintf('%04d-%02d-%02d', $input['start_year'], $input['start_month'], $input['start_day']);
        $end_date = sprintf('%04d-%02d-%02d', $input['end_year'], $input['end_month'], $input['end_day']);

        if (($input['start_hour'] || $input['start_hour'] == '00') && ($input['start_minute'] || $input['start_minute'] == '00')) {
            $start_time = sprintf('%02d:%02d:00', $input['start_hour'], $input['start_minute']);
        } else {
            $start_time = null;
        }

        if (($input['end_hour'] || $input['end_hour'] == '00') && ($input['end_minute'] || $input['end_minute'] == '00')) {
            $end_time = sprintf('%02d:%02d:00', $input['end_hour'], $input['end_minute']);
        } else {
            $end_time = null;
        }


        db_schedule_edit_update_c_schedule($u, $title, $input['body'],
                                           $start_date, $start_time, $end_date, $end_time,
                                           $input['is_receive_mail'],
                                           $target_c_schedule_id);

        openpne_redirect('pc', 'page_h_calendar');
    }
}

?>
