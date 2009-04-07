<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_sns_info($params, &$smarty)
{
    if (empty($params['var'])) {
        return array();
    }

    $member_count = _getMemberCount();
    $member_count_active = _getMemberCountActive();
    $member_rate_active = ($member_count_active / $member_count) * 100;
    $friend_count = _getFriendCount();
    $friend_count_avg = $friend_count / $member_count;

    $result = array(
        'info_member_count' => $member_count,
        'info_member_rate_active' => $member_rate_active,
        'info_member_count_yesterday' => _getMemberCountYesterday(),
        'info_commu_count' => _getCommuCount(),
        'info_friend_count_avg' => $friend_count_avg,
        'info_diary_count_today' => _getDiaryCountToday(),
        'info_diary_count_yesterday' => _getDiaryCountYesterday(),
        'info_message_count_today' => _getMessageCountToday(),
        'info_message_count_yesterday' => _getMessageCountYesterday(),
    );

    $smarty->assign($params['var'], $result);
}

/**
 * 総メンバー数
 */
function _getMemberCount()
{
    $sql = 'SELECT COUNT(*) FROM c_member';
    return db_get_one($sql);
}

/**
 * 前日登録メンバー数
 */
function _getMemberCountYesterday()
{
    $yesterday = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')));
    $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));

    $sql = 'SELECT COUNT(*) FROM c_member WHERE r_date >= ? AND r_date < ?';
    $params = array($yesterday, $today);
    return db_get_one($sql, $params);
}

/**
 * 総コミュニティ数
 */
function _getCommuCount()
{
    $sql = 'SELECT COUNT(*) FROM c_commu';
    return db_get_one($sql);
}

/**
 * アクティブメンバー数
 */
function _getMemberCountActive()
{
    $threedaysago = date('Y-m-d H:i:s', strtotime('-3 days'));

    $sql = 'SELECT COUNT(*) FROM c_member WHERE access_date > ?';
    $params = array($threedaysago);
    return db_get_one($sql, $params);
}

/**
 * 総フレンド数
 */
function _getFriendCount()
{
    $sql = 'SELECT COUNT(*) FROM c_friend';
    return db_get_one($sql);
}

/**
 * 今日の日記件数
 */
function _getDiaryCountToday()
{
    $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));

    $sql = 'SELECT COUNT(*) FROM c_diary WHERE r_datetime >= ?';
    $params = array($today);
    return db_get_one($sql, $params);
}

/**
 * 前日の日記件数
 */
function _getDiaryCountYesterday()
{
    $yesterday = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')));
    $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));

    $sql = 'SELECT COUNT(*) FROM c_diary WHERE r_datetime >= ? AND r_datetime < ?';
    $params = array($yesterday, $today);
    return db_get_one($sql, $params);
}

/**
 * 今日のメッセージ件数
 */
function _getMessageCountToday()
{
    $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));

    $sql = 'SELECT COUNT(*) FROM c_message WHERE r_datetime >= ? AND is_send = 1';
    $params = array($today);
    return db_get_one($sql, $params);
}

/**
 * 前日のメッセージ件数
 */
function _getMessageCountYesterday()
{
    $yesterday = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')));
    $today = date('Y-m-d H:i:s', mktime(0, 0, 0, date('m'), date('d'), date('Y')));

    $sql = 'SELECT COUNT(*) FROM c_message WHERE r_datetime >= ? AND r_datetime < ? AND is_send = 1';
    $params = array($yesterday, $today);
    return db_get_one($sql, $params);
}

?>
