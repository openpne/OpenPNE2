<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_home_insert_c_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $title = $requests['title'];
        $start_date= $requests['start_date'];
        // ----------

        if (!$title) {
            $msg = "予定を入力してください";
            $p = array('w' => $requests['w'], 'msg' => $msg);
            openpne_redirect('pc', 'page_h_home', $p);
        }

        $input = array(
          "title"=>$title,
          "body"=>'',
          "start_year"=>null,
          "start_month"=>null,
          "start_day"=>null,
          "start_hour"=>null,
          "start_minute"=>null,
          "end_year"=>null,
          "end_month"=>null,
          "end_day"=>null,
          "end_hour"=>null,
          "end_minute"=>null,
          "is_receive_mail"=>0,
        );

        $start_dates = explode("-", $start_date);
        $input['start_year'] = intval($start_dates[0]);
        $input['start_month'] = intval($start_dates[1]);
        $input['start_day'] = intval($start_dates[2]);

        $input['end_year'] = $input['start_year'];
        $input['end_month'] = $input['start_month'];
        $input['end_day'] = $input['start_day'];

        $start_date = sprintf("%04d-%02d-%02d", $input['start_year'], $input['start_month'], $input['start_day']);
        $end_date = sprintf("%04d-%02d-%02d", $input['end_year'], $input['end_month'], $input['end_day']);

        if ($input['start_hour'] && $input['start_minute']) {
            $start_time = "{$input['start_hour']}:{$input['start_minute']}:00";
        } else {
            $start_time = null;
        }
        if ($input['end_hour'] && $input['end_minute']) {
            $end_time = "{$input['end_hour']}:{$input['end_minute']}:00";
        } else {
            $end_time = null;
        }

        //--- 権限チェック
        //必要なし

        //---

        db_schedule_add_insert_c_schedule($u, $title, $input['body'],
            $start_date, $start_time, $end_date, $end_time,
            $input['is_receive_mail']);

        $msg = "予定を追加しました";
        $p = array('w' => $requests['w'], 'msg' => $msg);
        openpne_redirect('pc', 'page_h_home', $p);
    }
}

?>
