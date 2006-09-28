<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_do_fhg_biz_schedule_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        //target_idの指定
        if(!$requests['target_id'])
                $requests['target_id'] = $u;

        //ERROR----------------
        //存在しない日付
        if(!checkdate($requests['sc_b_month'], $requests['sc_b_date'], $requests['sc_b_year']))
        {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_add&'.$tail;
            $msg = '存在しない日付が指定されました。';

            //日付関連の引数は返さなくてもよい
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&sc_j_mem_enc='.serialize($requests['sc_j_mem']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&target_id='.$requests['target_id'];

            $_REQUEST['sc_title'] = $requests['sc_title'];
            $_REQUEST['sc_rp'] = $requests['sc_rp'];
            $_REQUEST['sc_memo'] = $requests['sc_memo'];
            $_REQUEST['sc_j_mem_enc'] = serialize($requests['sc_j_mem']);
            $_REQUEST['sc_rwk_enc'] = serialize($requests['sc_rwk_enc']);
            $_REQUEST['sc_rcount'] = $requests['sc_rcount'];
            $_REQUEST['target_id'] = $requests['target_id'];


            $_REQUEST['msg'] = '存在しない日付が指定されました。';
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_add");
            exit;
        }
        //---------------------

        //ERROR----------------
        //タイトル未入力
        if(empty($requests['sc_title']))
        {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_add&'.$tail;
            $msg = 'タイトルを入力してください。';
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
            $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
            $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&begin_time='.$begin_time.
                        '&finish_time='.$finish_time.
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&sc_j_mem_enc='.serialize($requests['sc_j_mem']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&target_id='.$requests['target_id'];

            $_REQUEST['begin_date'] = $begin_date;
            $_REQUEST['begin_time'] = $begin_time;
            $_REQUEST['finish_time'] = $finish_time;
            $_REQUEST['sc_rp'] = $requests['sc_rp'];
            $_REQUEST['sc_memo'] = $requests['sc_memo'];
            $_REQUEST['sc_j_mem_enc'] = serialize($requests['sc_j_mem']);
            $_REQUEST['sc_rwk_enc'] = serialize($requests['sc_rwk_enc']);
            $_REQUEST['sc_rcount'] = $requests['sc_rcount'];
            $_REQUEST['target_id'] = $requests['target_id'];
            $_REQUEST['msg'] = 'タイトルを入力してください。';
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_add");
            exit;
        }   
        //---------------------

        //施設、参加者のチェック

        if(!$requests['sc_j_mem']){     //「全員」が含まれている場合は、配列を空に
                $requests['sc_j_mem'] = array();

        }elseif($requests['sc_j_mem'] == "my"){     //本人またはフレンドのみの場合
                $requests['sc_j_mem']=array($requests['target_id']);

        }else{
            $join_group = biz_getGroupMember($requests['sc_j_mem']);
            $i = 0;

            $requests['sc_j_mem'] = array();
            foreach($join_group as $key){
                    $requests['sc_j_mem'][$i] = $key['c_member_id'];
                    $i++;
            }

        }

        //日付のフォーマットを設定
        $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

        $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
        $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];

        //ERROR---------------
        if((strtotime($finish_time) < strtotime($begin_time))&&($finish_time != ':'))  //終了時間と開始時間が変
        {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_add&'.$tail;
            $msg = '終了時刻が開始時刻より先です。';
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
            $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
            $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&sc_title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&sc_j_mem_enc='.serialize($requests['sc_j_mem']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&target_id='.$requests['target_id'];

            $_REQUEST['begin_date'] = $begin_date;
            $_REQUEST['sc_title'] = $requests['sc_title'];
            $_REQUEST['sc_rp'] = $requests['sc_rp'];
            $_REQUEST['sc_memo'] = $requests['sc_memo'];
            $_REQUEST['sc_j_mem_enc'] = serialize($requests['sc_j_mem']);
            $_REQUEST['sc_rwk_enc'] = serialize($requests['sc_rwk_enc']);
            $_REQUEST['sc_rcount'] = $requests['sc_rcount'];
            $_REQUEST['target_id'] = $requests['target_id'];

            $_REQUEST['msg'] = '終了時刻が開始時刻より先です。';
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_add");
            exit;

        }
        //--------------------

        $finish_date = $begin_date;

        if(!($requests['sc_b_hour']||$requests['sc_b_minute']||$requests['sc_f_hour']||$requests['sc_f_minute']))  //時刻指定なし
            $begin_time = $finish_time = null;
        elseif(!($requests['sc_f_hour']||$requests['sc_f_minute']))
            $finish_time = null;

        if(!$requests['sc_rp'])  //繰り返しをしない予定登録
            biz_insertSchedule($requests['sc_title'], $u, $begin_date, $finish_date, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, 0, $requests['sc_j_mem'], $requests['sc_j_plc']);
        else  //繰り返し予定
        {
            $tmp = $begin_date;  //処理中の日付

            for($i=0; date("Ymd", strtotime($tmp)) < date("Ymd", strtotime($finish_date)); $i++)
            {
                $nowday = strtotime($requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.($requests['sc_b_date']+$i));
                $tmp = date("Ymd", $nowday);
                if($rp_rule & (1 << date("w",$nowday)))
                    biz_insertSchedule($requests['sc_title'], $u, $tmp, $tmp, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, $first_id, $requests['sc_j_mem'], $requests['sc_j_plc']);
            }
        }

        $week = date("W", abs(strtotime($begin_date)-strtotime(date("Y-m-d"))))-1;
        $target_id = $requests['target_id'];
        $_REQUEST['msg'] = '予定を追加しました。';
        $_REQUEST['w'] = $week;
        $_REQUEST['target_id'] = $target_id;
        $_REQUEST['id'] = biz_getScheduleMax();
        openpne_forward('ktai_biz', 'page', "fh_calendar_week");
        exit;

    }
}
?>
