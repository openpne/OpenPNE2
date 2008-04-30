<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_s_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数

        $this->set("list", biz_getShisetsuList());
        //カレンダー表示用
        require_once 'Calendar/Week.php';
        $w = intval($_REQUEST['w']);
        if (empty($w)) {
            $w = 0;
        }
        $this->set('w', $w);
        $time = strtotime($w . " week");
        $Week = new Calendar_Week(date('Y', $time), date('m', $time), date('d', $time), 0);
        $Week->build();
        $calendar = array();
        $dayofweek = array('日','月','火','水','木','金','土');
        $i = 0;

        $schedule = array();

        while ($Day = $Week->fetch()) {

            $y = sprintf("%02d",$Day->thisYear());
            $m = sprintf("%02d",$Day->thisMonth());
            $d = sprintf("%02d",$Day->thisDay());

            $schedule = biz_getShisetsuSchedule($y,$m,$d);

            $item = array(
                'year'=> $y,
                'month'=>$m,
                'day' => $d,
                'dayofweek'=>$dayofweek[$i++],
                'now' => false,
                'schedule' => $schedule,
            );
            if ($w == 0 && $d == date('d')) {
                $item['now'] = true;
            }

            $calendar[] = $item;
        }

        $list= biz_getShisetsuList();

        $calendar = '';
        foreach ($list as $key => $value) {
            $calendar .= biz_getScheduleWeek($u, $value['biz_shisetsu_id'], $requests['w'], 's_list', true, true, true);
        }

        $this->set('calendar', $calendar);

        $hours = biz_makeSerialArray(23);  //時
        $this->set("hours", $hours);

        $config = biz_getConfig();

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('is_closed_shisetsu', $config['IS_CLOSED_SHISETSU']);

        return 'success';
    }
}

?>
