<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_fh_biz_schedule_edit extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('biz', 'page', 'fh_biz_schedule_edit', $errors);
        exit;
    }

    function execute($requests)
    {

        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();
        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }
        $schedule = biz_getScheduleInfo($requests['schedule_id']);

        if ($requests['sc_b_hour'] && !$requests['sc_b_minute']) {
            $requests['sc_b_minute'] = '00';
        }
        if ($requests['sc_f_hour'] && !$requests['sc_f_minute']) {
            $requests['sc_f_minute'] = '00';
        }

        //日付のフォーマットを設定
        $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

        if ($requests['sc_b_hour'] && $requests['sc_b_minute']) {
            $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
        }

        if ($requests['sc_f_hour'] && $requests['sc_f_minute']) {
            $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];
        }

        // エラー遷移用
        $_REQUEST['begin_date'] = $begin_date;
        $_REQUEST['begin_time'] = $begin_time;
        $_REQUEST['finish_time'] = $finish_time;

        if (!checkdate($requests['sc_b_month'], $requests['sc_b_date'], $requests['sc_b_year'])) {
            $_REQUEST['msg'] = '存在しない日付が指定されました。';
            openpne_forward('biz', 'page', 'fh_biz_schedule_edit');
            exit();
        }

        if ($requests['sc_rp'] && empty($requests['sc_rwk'])) {
            $_REQUEST['msg'] = '繰り返し予定を登録する場合は、曜日を指定してください。';
            openpne_forward('biz', 'page', 'fh_biz_schedule_edit');
            exit();
        }

        if ((strtotime($finish_time) < strtotime($begin_time)) && isset($finish_time)) {
            $_REQUEST['msg'] = '終了時刻が開始時刻より先です。';
            openpne_forward('biz', 'page', 'fh_biz_schedule_edit');
            exit();
        }

        if(($requests['public_flag'] == 'group') && empty($requests['biz_group_id'])) {
            $_REQUEST['msg'] = '「グループまで公開」予定の場合はグループを指定してください';
            openpne_forward('biz', 'page', 'fh_biz_schedule_edit');
            exit();
        }

        //施設、参加者のチェック
        if (in_array('0', $requests['sc_j_mem'])) {
            //「全員」が含まれている場合は、配列を空に
            $requests['sc_j_mem'] = array();
        }

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
            biz_editSchedule($requests['sc_title'], $schedule['c_member_id'], $begin_date, $finish_date, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, 0, $requests['biz_group_id'], $requests['public_flag'], $requests['schedule_id'], $requests['sc_j_mem']);
            $schedule_id = $requests['schedule_id'];
        } else {
            //終了日の決定
            if (in_array(date('w', strtotime($begin_date)), $requests['sc_rwk'])) {
                $finish_date = date("Y-m-d", strtotime($begin_date . ' + ' . ($requests['sc_rcount'] - 1) * 7 . 'days'));
            } else {
                $finish_date = date("Y-m-d", strtotime($begin_date . ' + ' . ($requests['sc_rcount']) * 7 . 'days'));
            }
            //繰り返しルールの決定
            foreach ($requests['sc_rwk'] as $value) {
                $rp_rule += 1 << $value;
            }

            //繰り返し予定
            $tmp = strtotime($begin_date);  //処理中の日付

            if ($requests['iskeep']) {
                //繰り返し予定グループの維持（同予定から派生した繰り返し予定を一斉に編集）
                $replist = biz_getRepeatScheduleID($requests['schedule_id']);
                foreach ($replist as $value) {
                    biz_deleteSchedule($value);  //既存の繰り返し予定をすべて削除（予定日数の追加、削除のケースがありうるため）
                }
            }

            $first_id = biz_getScheduleMax() + 1;  //登録される予定のプライマリキー

            for ($i = 0; $tmp < strtotime($finish_date); $i++) {
                //終了日に達するまで新規予定追加を繰り返す
                $nowday = strtotime($begin_date . ' +'.$i.'days');
                $tmp = $nowday;

                if ($rp_rule & (1 << date("w", $nowday))) {
                    biz_insertSchedule($requests['sc_title'], $schedule['c_member_id'], date("Y-m-d", $tmp), date("Y-m-d", $tmp), $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, $first_id, $requests['biz_group_id'], $requests['public_flag'], $requests['sc_j_mem']);
                }
            }

            $schedule_id = biz_getScheduleMax();
        }
        $week = date("W", abs(strtotime($begin_date) - strtotime(date("Y-m-d")))) - 1;

        $p = array('w' => $week, 'msg' => '予定を編集しました。',
                   'id' => $schedule_id, 'target_id'  => $target_id);
        openpne_redirect('biz', 'page_fh_biz_schedule_view', $p);
    }
}

?>
