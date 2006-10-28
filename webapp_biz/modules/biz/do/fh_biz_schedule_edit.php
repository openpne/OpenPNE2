<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_fh_biz_schedule_edit extends OpenPNE_Action
{
    function execute($requests)
    {

        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        //ERROR----------------
        //存在しない日付
        if (!checkdate($requests['sc_b_month'], $requests['sc_b_date'], $requests['sc_b_year'])) {
            $redirect_script = '?m=biz&a=page_fh_biz_schedule_edit';
            $msg = '存在しない日付が指定されました。';

            $schedule = biz_getScheduleInfo($requests['schedule_id']);

            $begin_date = $schedule['begin_date'];

            //日付関連の引数は返さなくてもよい
            $p = array('msg' => $msg, 'begin_date' => $begin_date, 'title' => $requests['sc_title'],
                'sc_rp' => $requests['sc_rp'], 'sc_memo' => $requests['sc_memo'], 'members' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk_enc']), 'sc_rcount' => $requests['sc_rcount'],
                'schedule_id' => $requests['schedule_id']);
            openpne_redirect('biz', 'page_fh_biz_schedule_edit', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //---------------------

        //ERROR----------------
        //タイトル未入力
        if (empty($requests['sc_title'])) {
            $msg = 'タイトルを入力してください。';
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

            $p = array('msg' => $msg, 'begin_date' => $begin_date,  'sc_rp' => $requests['sc_rp'],
             'sc_memo' => $requests['sc_memo'], 'members' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk_enc']), 'sc_rcount' => $requests['sc_rcount'],
                'schedule_id' => $requests['schedule_id']);
            openpne_redirect('biz', 'page_fh_biz_schedule_edit', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }   
        //---------------------

        //ERROR----------------
        //繰り返し予定::曜日指定なし
        if ($requests['sc_rp'] && empty($requests['sc_rwk'])) {
            $msg = '繰り返し予定を登録する場合は、曜日を指定してください。';
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

            $p = array('msg' => $msg, 'begin_date' => $begin_date, 'sc_title' => $requests['sc_title'],
                'sc_rp' => $requests['sc_rp'], 'sc_memo' => $requests['sc_memo'], 'members' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk_enc']), 'sc_rcount' => $requests['sc_rcount'],
                'schedule_id' => $requests['schedule_id']);
            openpne_redirect('biz', 'page_fh_biz_schedule_edit', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //--------------------


        //施設、参加者のチェック
        if (in_array('0', $requests['sc_j_mem'])) {
            //「全員」が含まれている場合は、配列を空に
            $requests['sc_j_mem'] = array();
        }

        if (!$requests['sc_j_plc']) {
            $requests['sc_j_plc'] = 0;
        }

        if ($requests['sc_b_hour'] && !$requests['sc_b_minute']) {
            $requests['sc_b_minute'] = '00';
        }
        if ($requests['sc_f_hour'] && !$requests['sc_f_minute']) {
            $requests['sc_f_minute'] = '00';
        }

        //日付のフォーマットを設定
        $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
        $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
        $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];

        //ERROR---------------
        if ((strtotime($finish_time) < strtotime($begin_time)) && ($finish_time != ':')) {
            //終了時間と開始時間が変
            $msg = '終了時刻が開始時刻より先です。';
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

            $p = array('msg' => $msg, 'begin_date' => $begin_date, 'sc_title' => $requests['sc_title'],
                'sc_rp' => $requests['sc_rp'], 'sc_memo' => $requests['sc_memo'], 'members' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk_enc']), 'sc_rcount' => $requests['sc_rcount'],
                'schedule_id' => $requests['schedule_id']);
            openpne_redirect('biz', 'page_fh_biz_schedule_edit', $p);

            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //--------------------

        if (!($requests['sc_b_hour'] || $requests['sc_b_minute'] || $requests['sc_f_hour'] || $requests['sc_f_minute'])) {
            //時刻指定なし
            $begin_time = $finish_time = null;
        } elseif (!($requests['sc_f_hour'] || $requests['sc_f_minute'])) {
            $finish_time = null;
        }

        if ((!$requests['sc_rp']) && ($requests['sc_bn'] == 1)) {
            //当日中に終わる予定は、開始日と終了日は同一でなければならない
            $finish_date = $begin_date;
        }

        $schedule_id = '';

        if (!$requests['sc_rp']) { 
            //繰り返しなし
            $finish_date = date("Y-m-d", strtotime($requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.($requests['sc_b_date']+($requests['sc_bn']-1))));
            //繰り返しをしない予定登録
            biz_editSchedule($requests['sc_title'], $u, $begin_date, $finish_date, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, 0, $requests['sc_j_mem'], $requests['sc_j_plc'], $requests['schedule_id']);
            $schedule_id = $requests['schedule_id'];
        } else {
            $schedule_id = $requests['schedule_id'];
            biz_deleteSchedule($schedule_id);

            //終了日の決定
            $finish_date = date("Y-m-d", strtotime($requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.($requests['sc_b_date']+($requests['sc_rcount'])*7)));

            //繰り返しルールの決定
            foreach ($requests['sc_rwk'] as $value) {
                $rp_rule += 1 << $value;
            }

            //繰り返し予定
            $tmp = $begin_date;  //処理中の日付

            if ($requests['iskeep']) {
                //繰り返し予定グループの維持（同予定から派生した繰り返し予定を一斉に編集）
                $replist = biz_getRepeatScheduleID($requests['schedule_id']);
                foreach ($replist as $value) {
                    biz_deleteSchedule($value);  //既存の繰り返し予定をすべて削除（予定日数の追加、削除のケースがありうるため）
                }
            }

            $first_id = biz_getScheduleMax() + 1;  //登録される予定のプライマリキー

            for ($i = 0; date("Ymd", strtotime($tmp)) < date("Ymd", strtotime($finish_date)); $i++) {
                //終了日に達するまで新規予定追加を繰り返す
                $nowday = strtotime($requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.($requests['sc_b_date']+$i));
                $tmp = date("Ymd", $nowday);

                if ($rp_rule & (1 << date("w", $nowday))) {
                    biz_insertSchedule($requests['sc_title'], $u, $tmp, $tmp, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, $first_id, $requests['sc_j_mem']);
                }
            }

            $schedule_id = biz_getScheduleMax();
        }
        $week = date("W", abs(strtotime($begin_date) - strtotime(date("Y-m-d")))) - 1;

        $p = array('w' => $week, 'msg' => '予定を編集しました。', 'id' => $schedule_id);
        openpne_redirect('biz', 'page_fh_biz_schedule_view', $p);
    }
}

?>
