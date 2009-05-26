<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//bizモジュール用 Smarty操作用ライブラリ

//予期しない多重定義を避けるため、必ず関数名にはbiz_というprefixをつける

//テンプレートリソースの登録-------------------------------------------

//テンプレートリソースの定義
define('PC_TPL_DIR', OPENPNE_DIR.'/webapp/modules/pc/templates/');

function pc_get_template($tpl_name, &$tpl_source, &$smarty_obj)
{
    $filename = PC_TPL_DIR.$tpl_name;
    $tpl = @file($filename);

    if ($tpl) {
        $tpl_source = join("\n", $tpl);
        return true;
    } else {
        return false;
    }
}

function pc_get_timestamp($tpl_name, &$tpl_timestamp, &$smarty_obj)
{
    $filename = PC_TPL_DIR.$tpl_name;
    $tpl_timestamp = filemtime($filename);

    return $tpl_timestamp;
}

function pc_get_secure($tpl_name, &$smarty_obj)
{
    return true;
}

function pc_get_trusted($tpl_name, &$smarty_obj)
{
}

//GET---------------------------------------------

//スケジュール用カレンダーを得る
function biz_getScheduleWeek($u, $member_id, $w, $cmd, $head = true, $value = true, $foot = true, $member_info = false, $start_day = 0 )
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->assign("PHPSESSID", md5(session_id()));
    $inc_smarty->templates_dir = 'biz/templates';

    $inc_smarty->assign("cmd", $cmd);  //操作の対象ページ
    $inc_smarty->assign("target_id", $member_id);  //予定参加者

    require_once 'Calendar/Week.php';
    $w = intval($w);
    if (empty($w)) {
        $w = 0;
    }
    $inc_smarty->assign('w', $w);
    $time = strtotime($w . " week");
    $Week = new Calendar_Week(date('Y', $time), date('m', $time), date('d', $time), $start_day);
    $Week->build();
    $calendar = array();
    $dayofweek = array('日','月','火','水','木','金','土');
    $i = $start_day;
    $dayofweek = array_merge($dayofweek,
        array_slice($dayofweek, 0, ($start_day + 1)));
    $schedule = array();

    while ($Day = $Week->fetch()) {
        $y = sprintf("%02d",$Day->thisYear());
        $m = sprintf("%02d",$Day->thisMonth());
        $d = sprintf("%02d",$Day->thisDay());
        $m_disp = sprintf("%2d",$Day->thisMonth());
        $d_disp = sprintf("%2d",$Day->thisDay());

        if ($cmd != 's_list') {
            $schedule = biz_getDateMemberSchedule($y, $m, $d, $member_id, $u);
            $banner = biz_isBannerSchedule($y, $m, $d, $member_id);

            if (!empty($banner)) {
                foreach ($banner as $value) {
                    array_push($schedule, $value);
                }
            }
        } else {
            $schedule = biz_getShisetsuSchedule($y,$m,$d, $member_id);
        }

        $item = array(
                'year'=> $y,
                'month'=>$m,
                'day' => $d,
                'month_disp'=>$m_disp,
                'day_disp' => $d_disp,
                'dayofweek'=>$dayofweek[$i++],
                'now' => false,
                'birth' => db_member_birth4c_member_id($m, $d, $member_id),
                'event' => db_commu_event4c_member_id($y, $m, $d, $member_id),
                'schedule' => $schedule,
                'todo' => biz_schedule_todo4c_member_id($u, $member_id, $y, $m, $d),
                'holiday' => db_c_holiday_list4date($m, $d),
            );

        if ($w == 0 && $d == date('d')) {
            $item['now'] = true;
        }

        $calendar[] = $item;
    }

    $daylist = $calendar;  //コピー

    for ($i = 1; $i <= 2; $i++) {
        $j = $start_day;  //曜日ポインタを示す

        $time = strtotime($w+$i . " week");
        $Week = new Calendar_Week(date('Y', $time), date('m', $time), date('d', $time),$start_day);
        $Week->build();

        while ($Day = $Week->fetch()) {
            $y = sprintf("%02d",$Day->thisYear());
            $m = sprintf("%02d",$Day->thisMonth());
            $d = sprintf("%02d",$Day->thisDay());

            $item = array(
                'year' => $y,
                'month' => $m,
                'day' => $d,
                'dayofweek' => $dayofweek[$j++],
            );

            $daylist[] = $item;
        }
    }

    $inc_smarty->assign("daylist", $daylist);


    if ($cmd == 's_list') {
        $hours = biz_makeSerialArray(23);  //時
        $inc_smarty->assign("hours", $hours);
        $mins = biz_makeSerialArray(300, 30, 30);  //分
        $inc_smarty->assign("mins", $mins);
        $inc_smarty->assign("list", biz_getShisetsuData($member_id));
        $config = biz_getConfig();

        $inc_smarty->assign('is_closed_shisetsu', $config['IS_CLOSED_SHISETSU']);
    }

    $inc_smarty->assign('calendar', $calendar);
    $inc_smarty->assign('head', $head);
    $inc_smarty->assign('value', $value);
    $inc_smarty->assign('foot', $foot);
    if ($member_info) {
        $inc_smarty->assign('member_info', $member_info);
    }

    if ($cmd == 'h') {
        if (OPENPNE_USE_POINT_RANK) {
            // ポイント
            $point = db_point_get_point($member_id);
            $inc_smarty->assign("point", $point);

            // ランク
            $inc_smarty->assign("rank", db_point_get_rank4point($point));
        }
    }

    $content = $inc_smarty->fetch('file:'.OPENPNE_MODULES_BIZ_DIR.'/biz/templates/inc_biz_schedule_week.tpl');

    return $content;
}

//Todoリストを得る
function biz_getTodoList($u, $member_id, $cmd, $nickname = null)
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->assign("PHPSESSID", md5(session_id()));
    $inc_smarty->templates_dir = 'pc/templates';;

    $inc_smarty->assign("cmd", $cmd);  //操作の対象ページ
    $inc_smarty->assign("target_id", $member_id);  //予定登録者
    if ($nickname) {
        $inc_smarty->assign("nickname", $nickname);  //予定登録者
    }

    $todolist = biz_getMemberTodo($u, $member_id);
    $checkedlist = biz_getMemberTodo($u, $member_id, 1);

    foreach ($todolist as $key => $value) {
        if ($value['writer_name']) {
            $writer_name = db_member_c_member4c_member_id($value['writer_id']);
            $todolist[$key]['writer_name'] = $writer_name['nickname'];
        }
    }

    $inc_smarty->assign("todolist", $todolist);
    $inc_smarty->assign("checkedlist", $checkedlist);
    $content = $inc_smarty->fetch('file:'.OPENPNE_MODULES_BIZ_DIR.'/biz/templates/inc_biz_todo.tpl');
    return $content;
}

function biz_getNewSchedule($member_id)
{
    $newschedule = biz_getJoinIdNewSchedule($member_id);

    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->assign("PHPSESSID", md5(session_id()));
    $inc_smarty->templates_dir = 'pc/templates';;
    $inc_smarty->assign("newlist", $newschedule);

    $content = $inc_smarty->fetch('file:'.OPENPNE_MODULES_BIZ_DIR.'/biz/templates/inc_biz_new_schedule.tpl');
    return $content;
}

function biz_getPostedTodoList($member_id)
{
    $posted = biz_getPostedTodo($member_id, 5);

    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->assign("PHPSESSID", md5(session_id()));
    $inc_smarty->templates_dir = 'pc/templates';;
    $inc_smarty->assign("posted_todo", $posted);
    $content = $inc_smarty->fetch('file:'.OPENPNE_MODULES_BIZ_DIR.'/biz/templates/inc_biz_posted_todo.tpl');
    return $content;
}

function biz_getHomeGroupList($c_member_id)
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);

    $inc_smarty->assign('PHPSESSID', md5(session_id()));
    $inc_smarty->templates_dir = 'pc/templates';;
    $inc_smarty->assign("group_list", biz_getJoinGroup($c_member_id, 9));
    $inc_smarty->assign("group_count", biz_getGroupCount($c_member_id));
    $inc_smarty->assign("c_member_id", $c_member_id);

    $content = $inc_smarty->fetch('file:'.OPENPNE_MODULES_BIZ_DIR.'/biz/templates/inc_biz_home_group_list.tpl');

    return $content;
}

//SET---------------------------------------------


?>
