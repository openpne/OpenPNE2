<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_s_add_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        if(empty($requests['start_time'])) {
            $begin_time = date("H:00:00");
        }
        else {
            $begin_time = $requests['start_time'].':00:00';
        }

        $term = date("i", $begin_time) + $requests['finish_time'];
        $finish_time = date("H:i:00", strtotime(date("Ymd H:".$term.":s", strtotime($begin_time))));

        //終了時間と開始時間が変
        if(strtotime($finish_time) < strtotime($begin_time)) {
            $p = array('msg' => '日をまたがる施設予約はできません');
            openpne_redirect('biz', 'page_s_list', $p);
        }

        $y = date("Y", $requests['start_date']);
        $m = date("m", $requests['start_date']);
        $d = date("d", $requests['start_date']);

        if(!biz_isBatting($requests['shisetsu_id'], $y, $m, $d, $begin_time, $finish_time)) {
            $p = array('msg' => '施設予約がバッティングしたため、登録ができませんでした');
            openpne_redirect('biz', 'page_s_list', $p);

        }

    //($shisetsu_id, $member_id, $date, $begin_time, $finish_time)
        biz_addShisetsuSchedule($requests['shisetsu_id'], $u, $requests['start_date'], $begin_time, $finish_time);

        $p = array(
            'msg' => '施設予定を追加しました',
            'id'  => biz_getShisetsuScheduleMax(),
        );
        openpne_redirect('biz', 'page_s_view_schedule', $p);
    }
}

?>
