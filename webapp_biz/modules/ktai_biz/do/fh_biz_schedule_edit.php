<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_do_fh_biz_schedule_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        if (!biz_isPermissionSchedule($u, $requests['schedule_id'])) {
            handle_kengen_error();
        }
        $schedule = biz_getScheduleInfo($requests['schedule_id']);
        $requests['sc_b_year'] = $requests['sc_b_year'] + 2000;

        //ERROR----------------
        //存在しない日付
        if (!checkdate($requests['sc_b_month'], $requests['sc_b_date'], $requests['sc_b_year'])) {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_edit&'.$tail;
            $msg = urlencode('存在しない日付が指定されました。');

            $schedule = biz_getScheduleInfo($requests['schedule_id']);

            $begin_date = $schedule['begin_date'];

            //日付関連の引数は返さなくてもよい
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&value='.$requests['sc_memo'].
                        '&members='.$requests['sc_j_mem'].
                        '&writer='.$requests['writer'].
                        '&schedule_id='.$requests['schedule_id'];

            $_REQUEST['schedule_id'] = $requests['schedule_id'];
            $_REQUEST['msg'] = '存在しない日付が指定されました。';
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_edit");
            exit;
        }
        //---------------------

        //ERROR----------------
        //タイトル未入力
        if (empty($requests['sc_title'])) {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_edit&id='.$requests['schedule_id'].'&'.$tail;
            $msg = urlencode('タイトルを入力してください。');
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&members='.$requests['sc_j_mem'].
                        '&writer='.$requests['writer'].
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&schedule_id='.$requests['schedule_id'];

            $_REQUEST['schedule_id'] = $requests['schedule_id'];
            $_REQUEST['msg'] = 'タイトルを入力してください。';
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_edit");
            exit;
        }
        //---------------------


        if (($requests['sc_b_hour'] && !$requests['sc_b_minute'])) {
            $requests['sc_b_minute'] = '00';
        }
        if (($requests['sc_f_hour'] && !$requests['sc_f_minute'])) {
            $requests['sc_f_minute'] = '00';
        }

        //日付のフォーマットを設定
        $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
        $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
        $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];

        //ERROR---------------
        if ((strtotime($finish_time) < strtotime($begin_time)) && ($finish_time != ':')) {
            //終了時間と開始時間が変
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_edit&id='.$requests['schedule_id'].'&'.$tail;
            $msg = urlencode('終了時刻が開始時刻より先です。');
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&sc_title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&members='.$requests['sc_j_mem'].
                        '&writer='.$requests['writer'].
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&schedule_id='.$requests['schedule_id'];

            $_REQUEST['schedule_id'] = $requests['schedule_id'];
            $_REQUEST['msg'] = '終了時刻が開始時刻より先です。';
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_edit");
            exit;
        }
        //--------------------

        $mem = unserialize($requests['sc_j_mem']);

        $requests['sc_j_mem'] = array();

        $i = 0;
        if ($mem) {
            foreach ($mem as $key => $value) {
                $requests['sc_j_mem'][$i] = $key;
                $i++;
            }
        }

        if (!($requests['sc_b_hour'] || $requests['sc_b_minute'] || $requests['sc_f_hour'] || $requests['sc_f_minute'])) {
            //時刻指定なし
            $begin_time = $finish_time = null;
        } elseif (!($requests['sc_f_hour'] || $requests['sc_f_minute'])) {
            $finish_time = null;
        }

        $finish_date = $begin_date;  //当日中に終わる予定は、開始日と終了日は同一でなければならない

        $schedule_id = '';

        $biz_schedule_member = biz_getJoinIdSchedule($requests['schedule_id']);

        biz_editSchedule($requests['sc_title'], $schedule['c_member_id'], $begin_date, $finish_date, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, 0, $requests['sc_j_mem'], $requests['public_flag'], $requests['schedule_id'], $biz_schedule_member);
        $schedule_id = $requests['schedule_id'];


        $first_id = biz_getScheduleMax() + 1;  //登録される予定のプライマリキー

        $week = date("W", abs(strtotime($begin_date)-strtotime(date("Y-m-d"))))-1;
        if (strtotime($begin_date) - strtotime(date('Y-m-d')) < 0) {
            $week = $week - $week * 2;
        }

        $_REQUEST['msg'] = '予定を編集しました。';
        $_REQUEST['w'] = $week;
        $_REQUEST['target_id'] = $requests['target_id'];
        $_REQUEST['id'] = biz_getScheduleMax();

        openpne_forward('ktai_biz', 'page', "fh_calendar_week");
        exit;
    }
}

?>
