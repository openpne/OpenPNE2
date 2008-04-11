<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_fhg_biz_schedule_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        if ($requests['sc_b_hour'] && !$requests['sc_b_minute']) {
            $requests['sc_b_minute'] = '00';
        }
        if ($requests['sc_f_hour'] && !$requests['sc_f_minute']) {
            $requests['sc_f_minute'] = '00';
        }

        //日付のフォーマットを設定
        $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

        // 入力された時刻のチェック
        if (!($requests['sc_b_hour']||$requests['sc_b_minute']||$requests['sc_f_hour']||$requests['sc_f_minute'])) {
            // 時刻が未入力
            $begin_time = $finish_time = null;
        } elseif (!($requests['sc_f_hour']||$requests['sc_f_minute'])) {
            // 終了時刻が未入力
            $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
            $finish_time = null;
        } else {
            // 開始時刻と終了時刻が両方とも入力されている
            $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
            $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];
        }

        //ERROR----------------
        //存在しない日付
        if (!checkdate($requests['sc_b_month'], $requests['sc_b_date'], $requests['sc_b_year'])) {
            $msg = '存在しない日付が指定されました。';

            $p = array('msg' => $msg, 'sc_title' => $requests['sc_title'], 'sc_rp' => $requests['sc_rp'],
                'sc_memo' => $requests['sc_memo'], 'sc_j_mem_enc' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk']), 'sc_rcount' => $requests['sc_rcount'], 'sc_bn' => $requests['sc_bn']);
            openpne_redirect('biz', 'page_fh_biz_schedule_add', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //---------------------

        //ERROR----------------
        //タイトル未入力
        if (empty($requests['sc_title'])) {
            $msg = 'タイトルを入力してください。';
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&begin_time='.$begin_time.
                        '&finish_time='.$finish_time.
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&sc_j_mem_enc='.serialize($requests['sc_j_mem']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&sc_bn='.$requests['sc_bn'];

                $p = array('msg' => $msg, 'begin_date' => $begin_date, 'begin_time' => $begin_time,
                'finish_time' => $finish_time, 'sc_rp' => $requests['sc_rp'], 'sc_memo' => $requests['sc_memo'],
                'sc_j_mem_enc' => serialize($requests['sc_j_mem']), 'sc_rwk_enc' => serialize($requests['sc_rwk']),
                'sc_rcount' => $requests['sc_rcount'], 'sc_bn' => $requests['sc_bn']);
            openpne_redirect('biz', 'page_fh_biz_schedule_add', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //---------------------

        //ERROR----------------
        //繰り返し予定::曜日指定なし
        if ($requests['sc_rp'] && empty($requests['sc_rwk'])) {
            $msg = '繰り返し予定を登録する場合は、曜日を指定してください。';

            $p = array('msg' => $msg, 'begin_date' => $begin_date, 'begin_time' => $begin_time, 'sc_title' => $requests['sc_title'],
                'finish_time' => $finish_time, 'sc_rp' => $requests['sc_rp'], 'sc_memo' => $requests['sc_memo'],
                'sc_j_mem_enc' => serialize($requests['sc_j_mem']), 'sc_rwk_enc' => serialize($requests['sc_rwk']),
                'sc_rcount' => $requests['sc_rcount'], 'sc_bn' => $requests['sc_bn']);
            openpne_redirect('biz', 'page_fh_biz_schedule_add', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //--------------------

        //ERROR---------------
        if ((strtotime($finish_time) < strtotime($begin_time)) && isset($finish_time)) {
            //終了時間と開始時間が変
            $msg = '終了時刻が開始時刻より先です。';
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&sc_title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&sc_j_mem_enc='.serialize($requests['sc_j_mem']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&sc_bn='.$requests['sc_bn'];

            $p = array('msg' => $msg, 'begin_date' => $begin_date, 'sc_rp' => $requests['sc_rp'], 'sc_title' => $requests['sc_title'],
                'sc_memo' => $requests['sc_memo'], 'sc_j_mem_enc' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk']), 'sc_rcount' => $requests['sc_rcount'], 'sc_bn' => $requests['sc_bn']);
            openpne_redirect('biz', 'page_fh_biz_schedule_add', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //--------------------

        //ERROR---------------
        //グループまで公開の予定なのにグループが指定されていない
        //--------------------
        if(($requests['public_flag'] == 'group') && empty($requests['biz_group_id'])) {
            $msg = '「グループまで公開」予定の場合はグループを指定してください';
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&sc_title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&sc_j_mem_enc='.serialize($requests['sc_j_mem']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&sc_bn='.$requests['sc_bn'];

            $p = array('msg' => $msg, 'begin_date' => $begin_date, 'sc_rp' => $requests['sc_rp'],
                'sc_memo' => $requests['sc_memo'], 'sc_j_mem_enc' => serialize($requests['sc_j_mem']),
                'sc_rwk_enc' => serialize($requests['sc_rwk']), 'sc_rcount' => $requests['sc_rcount'], 'sc_bn' => $requests['sc_bn']);
            openpne_redirect('biz', 'page_fh_biz_schedule_add', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }
        //参加者のチェック
        if (in_array('0', $requests['sc_j_mem'])) {
            //「全員」が含まれている場合は、配列を空に
            $requests['sc_j_mem'] = array();
        }

        if (!$requests['sc_rp'] && ($requests['sc_bn'] == 1)) {
            //当日中に終わる予定は、開始日と終了日は同一でなければならない
            $finish_date = $begin_date;
        }

        //繰り返し予定
        if ($requests['sc_rp']) {
            //終了日の決定
            if (in_array(date('w', strtotime($begin_date)), $requests['sc_rwk'])) {
                $finish_date = date("Y-m-d", strtotime($begin_date . ' + ' . ($requests['sc_rcount'] - 1) * 7 . 'days'));
            } else {
                $finish_date = date("Y-m-d", strtotime($begin_date . ' + ' . ($requests['sc_rcount']) * 7 . 'days'));
            }

            //first_idの決定
            $first_id = biz_getScheduleMax() + 1;
            if (!$first_id) {
                $first_id = 1;
            }

            //繰り返しルールの決定
            foreach ($requests['sc_rwk'] as $value) {
                $rp_rule += 1 << $value;
            }
        } else {
            //繰り返しなし
            $finish_date = date("Y-m-d", strtotime($requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.($requests['sc_b_date']+($requests['sc_bn']-1))));
        }

        if (!$requests['sc_rp']) {
            //繰り返しをしない予定登録
            biz_insertSchedule($requests['sc_title'], $u, $begin_date, $finish_date, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, 0, $requests['biz_group_id'], $requests['public_flag'], $requests['sc_j_mem']);
        } else {
            //繰り返し予定
            $tmp = $begin_date;  //処理中の日付

            for ($i=0; strtotime($tmp) < strtotime($finish_date); $i++) {
                $nowday = strtotime($begin_date . ' + ' . $i . 'days');
                $tmp = date("Y-m-d", $nowday);
                if ($rp_rule & (1 << date("w",$nowday))) {
                    biz_insertSchedule($requests['sc_title'], $u, $tmp, $tmp, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, $first_id, $requests['biz_group_id'], $requests['public_flag'], $requests['sc_j_mem']);
                }
            }
        }

        $week = date("W", abs(strtotime($begin_date) - strtotime(date("Y-m-d")))) - 1;

        $p = array('w' => $week, 'msg' => '予定を追加しました。', 'id' => biz_getScheduleMax(), 'target_id' => $requests['target_c_member_id']);
        openpne_redirect('biz', 'page_fh_biz_schedule_view', $p);
    }
}

?>
