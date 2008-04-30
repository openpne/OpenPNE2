<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 前日のアクセスランキング
function db_ranking_c_ashiato_ranking($limit = 10)
{
    $today = date('Y-m-d 00:00:00');
    $yesterday = date('Y-m-d 00:00:00', strtotime('-1 day'));

    $sql = 'SELECT c_member_id_to AS c_member_id, COUNT(*) AS count' .
        ' FROM c_ashiato' .
        ' WHERE r_datetime >= ? AND r_datetime < ?' .
        ' GROUP BY c_member_id_to' .
        ' ORDER BY count DESC';
    $params = array($yesterday, $today);
    return db_get_all_limit($sql, 0, $limit, $params);
}

function db_ranking_c_friend_ranking($limit = 10)
{
    $sql = 'SELECT c_member_id_to as c_member_id, count(*) as count' .
        ' FROM c_friend';
    if (!IS_CLOSED_SNS) {
      $sql .= ' WHERE c_member_id_to != 1';
    }
    $sql .= ' GROUP BY c_member_id_to' .
        ' ORDER BY count DESC';
    return db_get_all_limit($sql, 0, $limit);
}

function db_ranking_c_commu_member_ranking($limit = 10)
{
    $sql = 'SELECT c_commu_id, count(*) as count' .
        ' FROM c_commu_member' .
        ' GROUP BY c_commu_id' .
        ' ORDER BY count DESC';
    return db_get_all_limit($sql, 0, $limit);
}

// 前日のランキング
function db_ranking_c_commu_topic_comment_ranking($limit = 10)
{
    $today = date('Y-m-d 00:00:00');
    $yesterday = date('Y-m-d 00:00:00', strtotime('-1 day'));

    $sql = 'SELECT c_commu_id, count(*) as count' .
        ' FROM c_commu_topic_comment' .
        ' WHERE r_datetime >= ? AND r_datetime < ?' .
        ' GROUP BY c_commu_id' .
        ' ORDER BY count DESC';
    $params = array($yesterday, $today);
    return db_get_all_limit($sql, 0, $limit, $params);
}

?>
