<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_do_fhg_biz_schedule_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        //target_id縺ｮ謖・ｮ
        if (!$requests['target_id']) {
            $requests['target_id'] = $u;
        }
        
        $requests['sc_b_year'] = $requests['sc_b_year'] + 2000;

        $biz_schedule_member = array();
 
        // 閾ｪ蛻・・莠亥ｮ壹・蝣ｴ蜷医・閾ｪ蛻・・縺ｿ繧貞盾蜉閠・→縺吶ｋ
        if ($requests['sc_j_mem'] == 'my') {
            $biz_schedule_member = array($requests['target_id']);
        }

        //ERROR----------------
        //蟄伜惠縺励↑縺・律莉
        if (!checkdate($requests['sc_b_month'], $requests['sc_b_date'], $requests['sc_b_year'])) {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_add&'.$tail;
            $msg = '蟄伜惠縺励↑縺・律莉倥′謖・ｮ壹＆繧後∪縺励◆縲・;

            //譌･莉倬未騾｣縺ｮ蠑墓焚縺ｯ霑斐＆縺ｪ縺上※繧ゅｈ縺
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&biz_group_id='.serialize($requests['biz_group_id']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&target_id='.$requests['target_id'];

            $_REQUEST['sc_title'] = $requests['sc_title'];
            $_REQUEST['sc_rp'] = $requests['sc_rp'];
            $_REQUEST['sc_memo'] = $requests['sc_memo'];
            $_REQUEST['biz_group_id'] = serialize($requests['biz_group_id']);
            $_REQUEST['sc_rwk_enc'] = serialize($requests['sc_rwk_enc']);
            $_REQUEST['sc_rcount'] = $requests['sc_rcount'];
            $_REQUEST['target_id'] = $requests['target_id'];


            $_REQUEST['msg'] = '蟄伜惠縺励↑縺・律莉倥′謖・ｮ壹＆繧後∪縺励◆縲・;
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_add");
            exit;
        }
        //---------------------

        //ERROR----------------
        //繧ｿ繧､繝医Ν譛ｪ蜈･蜉
        if (empty($requests['sc_title'])) {
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_add&'.$tail;
            $msg = '繧ｿ繧､繝医Ν繧貞・蜉帙＠縺ｦ縺上□縺輔＞縲・;
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
                        '&biz_group_id='.serialize($requests['biz_group_id']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&target_id='.$requests['target_id'];

            $_REQUEST['begin_date'] = $begin_date;
            $_REQUEST['begin_time'] = $begin_time;
            $_REQUEST['finish_time'] = $finish_time;
            $_REQUEST['sc_rp'] = $requests['sc_rp'];
            $_REQUEST['sc_memo'] = $requests['sc_memo'];
            $_REQUEST['biz_group_id'] = serialize($requests['biz_group_id']);
            $_REQUEST['sc_rwk_enc'] = serialize($requests['sc_rwk_enc']);
            $_REQUEST['sc_rcount'] = $requests['sc_rcount'];
            $_REQUEST['target_id'] = $requests['target_id'];
            $_REQUEST['msg'] = '繧ｿ繧､繝医Ν繧貞・蜉帙＠縺ｦ縺上□縺輔＞縲・;
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_add");
            exit;
        }   
        //---------------------

        //譌･莉倥・繝輔か繝ｼ繝槭ャ繝医ｒ險ｭ螳
        $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];

        $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
        $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];

        //ERROR---------------
        if ((strtotime($finish_time) < strtotime($begin_time)) && ($finish_time != ':')) {
            //邨ゆｺ・凾髢薙→髢句ｧ区凾髢薙′螟
            $redirect_script = '?m=ktai_biz&a=page_fh_biz_schedule_add&'.$tail;
            $msg = '邨ゆｺ・凾蛻ｻ縺碁幕蟋区凾蛻ｻ繧医ｊ蜈医〒縺吶・;
            $begin_date = $requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.$requests['sc_b_date'];
            $begin_time = $requests['sc_b_hour'].':'.$requests['sc_b_minute'];
            $finish_time = $requests['sc_f_hour'].':'.$requests['sc_f_minute'];
            $url = $redirect_script.
                        '&msg='.$msg.
                        '&begin_date='.$begin_date.
                        '&sc_title='.$requests['sc_title'].
                        '&sc_rp='.$requests['sc_rp'].
                        '&sc_memo='.$requests['sc_memo'].
                        '&biz_group_id='.serialize($requests['biz_group_id']).
                        '&sc_rwk_enc='.serialize($requests['sc_rwk_enc']).
                        '&sc_rcount='.$requests['sc_rcount'].
                        '&target_id='.$requests['target_id'];

            $_REQUEST['begin_date'] = $begin_date;
            $_REQUEST['sc_title'] = $requests['sc_title'];
            $_REQUEST['sc_rp'] = $requests['sc_rp'];
            $_REQUEST['sc_memo'] = $requests['sc_memo'];
            $_REQUEST['biz_group_id'] = serialize($requests['biz_group_id']);
            $_REQUEST['sc_rwk_enc'] = serialize($requests['sc_rwk_enc']);
            $_REQUEST['sc_rcount'] = $requests['sc_rcount'];
            $_REQUEST['target_id'] = $requests['target_id'];

            $_REQUEST['msg'] = '邨ゆｺ・凾蛻ｻ縺碁幕蟋区凾蛻ｻ繧医ｊ蜈医〒縺吶・;
            openpne_forward('ktai_biz', 'page', "fh_biz_schedule_add");
            exit;
        }
        //--------------------

        $finish_date = $begin_date;

        if (!($requests['sc_b_hour'] || $requests['sc_b_minute'] || $requests['sc_f_hour'] || $requests['sc_f_minute'])) {
            //譎ょ綾謖・ｮ壹↑縺
            $begin_time = $finish_time = null;
        } elseif (!($requests['sc_f_hour'] || $requests['sc_f_minute'])) {
            $finish_time = null;
        }

        if (!$requests['sc_rp']) {
            //郢ｰ繧願ｿ斐＠繧偵＠縺ｪ縺・ｺ亥ｮ夂匳骭ｲ
            biz_insertSchedule($requests['sc_title'], $u, $begin_date, $finish_date, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, 0, $requests['biz_group_id'], $requests['public_flag'], $biz_schedule_member);
        } else {
            //郢ｰ繧願ｿ斐＠莠亥ｮ
            $tmp = $begin_date;  //蜃ｦ逅・ｸｭ縺ｮ譌･莉

            for ($i=0; date("Ymd", strtotime($tmp)) < date("Ymd", strtotime($finish_date)); $i++) {
                $nowday = strtotime($requests['sc_b_year'].'-'.$requests['sc_b_month'].'-'.($requests['sc_b_date']+$i));
                $tmp = date("Ymd", $nowday);
                if ($rp_rule & (1 << date("w",$nowday))) {
                    biz_insertSchedule($requests['sc_title'], $u, $tmp, $tmp, $begin_time, $finish_time, $requests['sc_memo'], $rp_rule, $first_id, $requests['biz_group_id'], $requests['public_flag'], $biz_schedule_member);
                }
            }
        }

        $week = date("W", abs(strtotime($begin_date)-strtotime(date("Y-m-d"))))-1;
        $target_id = $requests['target_id'];
        $_REQUEST['msg'] = '莠亥ｮ壹ｒ霑ｽ蜉縺励∪縺励◆縲・;
        $_REQUEST['w'] = $week;
        $_REQUEST['target_id'] = $target_id;
        $_REQUEST['id'] = biz_getScheduleMax();
        openpne_forward('ktai_biz', 'page', "fh_calendar_week");
        exit;
    }
}

?>
