<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function create_message_friend_invite($u, $body, $target_c_member_id)
{
    $msg_subject = 'メンバー紹介メッセージ';

    $c_member = db_common_c_member4c_member_id_LIGHT($u);
    $p = array('target_c_member_id' => $target_c_member_id);
    $url = openpne_gen_url('pc', 'page_f_home', $p);
    $msg_body = <<<EOD
{$c_member['nickname']}さんからメンバー紹介メッセージが届いています。

メッセージ：
$body

このメンバーのURL：
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_invite($u, $body, $c_commu_id)
{
    $msg_subject = 'コミュニティ紹介メッセージ';

    $c_member = db_common_c_member4c_member_id_LIGHT($u);
    $c_commu = _db_c_commu4c_commu_id($c_commu_id);
    $p = array('target_c_commu_id' => $c_commu_id);
    $url = openpne_gen_url('pc', 'page_c_home', $p);
    $msg_body = <<<EOD
{$c_member['nickname']}さんからコミュニティ紹介メッセージが届いています。

コミュニティ名：
{$c_commu['name']}

メッセージ：
$body

このコミュニティのURL
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_event_invite($u, $body, $c_commu_topic_id)
{
    $msg_subject = 'イベント紹介メッセージ';

    $c_member = db_common_c_member4c_member_id_LIGHT($u);
    $c_commu_topic = _do_c_bbs_c_commu_topic4c_commu_topic_id($c_commu_topic_id);
    $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
    $url = openpne_gen_url('pc', 'page_c_event_detail', $p);
    $msg_body = <<<EOD
{$c_member['nickname']}さんからイベント紹介メッセージが届いています。

イベント名：
{$c_commu_topic['name']}

メッセージ：
$body

このイベントのURL
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_event_message($u, $body, $c_commu_topic_id)
{
    $msg_subject = 'イベントのお知らせ';

    $c_member = db_common_c_member4c_member_id_LIGHT($u);

    $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
    $url = openpne_gen_url('pc', 'page_c_event_detail', $p);
    $msg_body = <<<EOD
イベントの企画者{$c_member['nickname']}さんからイベントに関してのお知らせが届いています。

メッセージ：
$body

このイベントのURL
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_admin_request($u, $body, $target_c_member_id, $target_c_commu_id)
{
    $msg_subject = 'コミュニティ管理者交代要請メッセージ';

    $c_member_id_from = $u;
    $c_member = db_common_c_member4c_member_id_LIGHT($u);
    $c_member_to = $target_c_member_id;
    $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

    $msg_body = <<<EOD
{$c_member['nickname']} さんから{$c_commu['name']} コミュニティの管理者交代希望メッセージが届いています。

メッセージ：
{$body}

この要請について、承認待ちリストから承認または拒否を選択してください。
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_sub_admin_request($u, $body, $target_c_member_id, $target_c_commu_id)
{
    $msg_subject = '副管理者要請メッセージ';

    $c_member_id_from = $u;
    $c_member = db_common_c_member4c_member_id_LIGHT($u);
    $c_member_to = $target_c_member_id;
    $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

    $msg_body = <<<EOD
{$c_member['nickname']} さんから{$c_commu['name']} コミュニティの副管理者要請メッセージが届いています。

メッセージ：
{$body}

この要請について、承認待ちリストから承認または拒否を選択してください。
EOD;
    return array($msg_subject, $msg_body);
}
?>
