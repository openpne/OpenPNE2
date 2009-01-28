<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_s_add_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();


        // start_timeが指定されていない場合
        if (empty($requests['start_time'])) {
            $begin_time_str = date("H:00:00");
        } else {
        // start_timeが指定されている場合
            $begin_time_str = $requests['start_time'].':00:00';
        }

        $begin_time = strtotime($begin_time_str);
        $begin_time_english = date("H:i d M Y", $begin_time);

        $finish_time = $begin_time + $requests['finish_time'] * 60;
        $finish_time_str = date("H:i:00", $finish_time);

        //終了時間と開始時間が変
        if (date("H", $finish_time) < date("H", $begin_time)) {
            $p = array('msg' => '日をまたがる施設予約はできません');
            openpne_redirect('biz', 'page_s_list', $p);
        }

        $start_date = $requests['start_date'] . ' 00:00:00';

        $y = date("Y", strtotime($start_date));
        $m = date("m", strtotime($start_date));
        $d = date("d", strtotime($start_date));

        if (!biz_isBatting($requests['shisetsu_id'], $y, $m, $d, $begin_time_str, $finish_time_str)) {
            $p = array('msg' => '施設予約がバッティングしたため、登録ができませんでした');
            openpne_redirect('biz', 'page_s_list', $p);
        }

        //($shisetsu_id, $member_id, $date, $begin_time, $finish_time)
        biz_addShisetsuSchedule($requests['shisetsu_id'], $u, $requests['start_date'], $begin_time_str, $finish_time_str);

        $p = array(
            'msg' => '施設予定を追加しました',
            'id'  => biz_getShisetsuScheduleMax(),
        );
        openpne_redirect('biz', 'page_s_view_schedule', $p);
    }
}

?>
