<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_g_home_add_biz_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $start = $requests['start_date'];
        $target_id = $requests['target_id'];
        $text = $requests['title'];

        //書式チェック
        preg_match("/([0-2][0-9].*?[0-5][0-9]).*?([0-2][0-9].*?[0-5][0-9])\s*(.*)/", $text, $matches);

        if ($matches) {
            //クイック入力に対応した書式
            $title = $matches[3];
            $begin_date = $finish_date = $start;
            $begin_time = date("H:i", strtotime($matches[1]));

            if (empty($matches[2])) {
                $finish_time = null;
            } else {
                $finish_time = date("H:i", strtotime($matches[2]));
            }
        } else {
            //通常の予定入力
            $title = $text;
            $begin_date = $finish_date = $start;
            $begin_time = $finish_time = null;
        }

        $members = biz_getGroupMember($target_id);
        $members_id = array();
        foreach ($members as $key => $values) {
            array_push($members_id, $values['c_member_id']);
        }
        if (empty($text)) {
            $p = array('target_c_commu_id' => $target_id, 'msg' => 'タイトルを入力してください。');
            openpne_redirect('biz', 'page_g_home', $p);
            exit();  //強制的にスクリプトを終了しなければいけない
        }

        biz_insertSchedule($title, $u, $begin_date, $finish_date, $begin_time, $finish_time, '', 0, 0, $target_id, 'group', $members_id);  //予定の登録
        biz_readSchedule($u, biz_getScheduleMax());  //既読済みに

        $p = array('target_c_commu_id' => $target_id);
        openpne_redirect('biz', 'page_g_home', $p);
    }
}

?>
