<?php
/**
 * OpenPNE2.5以前のBIZスケジュールデータを、OpenPNE2.6以降向けに変換するスクリプト
 */

set_time_limit(0);

//OpenPNEからconfig.phpの情報を読み込む
define('OPENPNE_DIR', realpath('../../../'));
require_once OPENPNE_DIR . '/config.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

//biz_schedule_idのリストを取得
$sql = 'SELECT biz_schedule_id FROM biz_schedule';
$biz_schedule_id_list = db_get_col($sql);
$result = array();

foreach ($biz_schedule_id_list as $biz_schedule_id) {
    //スケジュールの内容を得る
    $sql = 'SELECT * FROM biz_schedule WHERE biz_schedule_id = ?';
    $schedule = db_get_row($sql, array($biz_schedule_id));
    array_shift($schedule);

    //スケジュールの参加者を得る
    $sql = 'SELECT c_member_id FROM biz_schedule_member WHERE biz_schedule_id = ?';
    $schedule_member_list = db_get_col($sql, array($biz_schedule_id));

    //新規スケジュール挿入
    foreach ($schedule_member_list as $c_member_id) {
        $schedule['c_member_id'] = $c_member_id;
        db_insert('biz_schedule', $schedule);
    }

    //既存のスケジュールの削除
    if (!empty($schedule_member_list))
    {
        $sql = 'DELETE FROM biz_schedule WHERE biz_schedule_id = ?';
        db_query($sql, array($biz_schedule_id));
    }
}
?>
