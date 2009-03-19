<?php

// 連続投稿確認用
//
// 連続投稿のチェック対象とするアクション
$GLOBALS['CHECK_POST_ACTIONS'] = array(
'pc' => array(
    'do_h_diary_add_insert_c_diary',
    'do_fh_diary_insert_c_diary_comment',
    'do_h_com_add_insert_c_commu',
    'do_c_topic_add_insert_c_commu_topic',
    'do_c_topic_write_insert_c_commu_topic_comment',
    'do_c_event_add_insert_c_commu_topic',
    'do_c_event_write_insert_c_commu_topic_comment',
    'do_f_message_send_insert_c_message',
    'do_f_link_request_insert_c_friend_confirm',
));

// 連続投稿と判断する間隔(秒)
// 0を指定した場合、チェックしない
define('POST_INTERVAL_UNFAIR_SECOND', 10);

// 前回から[POST_INTERVAL_UNFAIR_SECOND]秒以内の投稿が、
// 何回行われた時に、連続投稿と判断するか
define('POST_INTERVAL_UNFAIR_COUNT', 1);

// 前回投稿から何秒以上あいていたら、連続投稿回数をリセットするか
// 0を指定した場合、リセットしない
define('POST_INTERVAL_UNFAIR_COUNT_RESET_SECOND', 60*60);

// 前回投稿時刻と投稿回数の保存先
// 0:セッション
// 1:データベース
define('POST_INFO_STORAGE', 1);

?>
