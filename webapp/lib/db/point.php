<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_point_insert_log($c_member_id, $point, $memo)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'point' => intval($point),
        'memo' => strval($memo),
        'r_datetime' => db_now(),
    );
    return db_insert('c_point_log', $data);
}

function db_point_insert_tags($c_point_log_id, $tags)
{
    $data = array(
        'c_point_log_id' => intval($c_point_log_id),
    );
    foreach ((array)$tags as $tag) {
        if ($tag) {
            $data['tag'] = strval($tag);
            db_insert('c_point_log_tag', $data);
        }
    }
}

function db_point_add_point($c_member_id, $point)
{
    if (!OPENPNE_USE_POINT_RANK) {
        return false;
    }

    // 管理者は加算しない
    if (!OPENPNE_IS_POINT_ADMIN && $c_member_id == 1) {
        return false;
    }

    $sql = 'SELECT c_profile_id, public_flag_default FROM c_profile WHERE name = \'PNE_POINT\'';
    if (!$c_profile = db_get_row($sql, array(), 'main')) {
        return false;
    }
    $c_profile_id = $c_profile['c_profile_id'];
    $public_flag  = $c_profile['public_flag_default'];

    $sql = 'SELECT value FROM c_member_profile WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), intval($c_profile_id));
    $p = db_get_one($sql, $params, 'main');

    // プロフィールにポイントがなければ追加
    if (is_null($p)) {
        $data = array(
            'c_member_id' => intval($c_member_id),
            'c_profile_id' => intval($c_profile_id),
            'c_profile_option_id' => 0,
            'value' => '0',
            'public_flag' => $public_flag,
        );
        db_insert('c_member_profile', $data);
    }

    $before_rank = db_point_get_rank4point($p);

    // ポイント加算
    $p = intval($p) + intval($point);

    $after_rank = db_point_get_rank4point($p);

    $data = array('value' => $p);
    $where = array('c_member_id' => intval($c_member_id), 'c_profile_id' => intval($c_profile_id));
    db_update('c_member_profile', $data, $where);

    //ランクアップしたらメール送信
    if (!empty($after_rank) && $before_rank['point'] != $after_rank['point']) {
        send_mail_pcktai_rank_up($c_member_id, $before_rank, $after_rank);
        send_mail_admin_rank_up($c_member_id, $before_rank, $after_rank);
    }

    return $p;
}

function db_point_get_point($c_member_id)
{
    $sql = 'SELECT c_profile_id, public_flag_default FROM c_profile WHERE name = \'PNE_POINT\'';
    if (!$c_profile = db_get_row($sql)) {
        return false;
    }
    $c_profile_id = $c_profile['c_profile_id'];
    $public_flag  = $c_profile['public_flag_default'];

    $sql = 'SELECT value FROM c_member_profile WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), intval($c_profile_id));
    return db_get_one($sql, $params);
}

//ポイントからランクを取得
function db_point_get_rank4point($point)
{
    $sql = "SELECT * FROM c_rank WHERE point <= ? ORDER BY point DESC";
    $params = array(intval($point));
    return db_get_row($sql, $params);
}

//ランク情報を全部取得
function db_point_get_rank_all()
{
    $sql = "SELECT * FROM c_rank ORDER BY point";
    return db_get_all($sql);
}

//引数で指定したポイントのランクが存在するかどうか
function db_point_is_rank4point($point)
{
    $sql = 'SELECT c_rank_id FROM c_rank WHERE point = ?';
    return (bool)db_get_one($sql, array(intval($point)));
}

// ランクから到達ポイントを取得
function db_point_get_rank_point4rank_id($c_rank_id)
{
    $sql = "SELECT point FROM c_rank WHERE c_rank_id = ?";
    $params = array(intval($c_rank_id));
    return db_get_one($sql, $params);
}

// 指定したランクの次のランクの到達ポイントを取得
function db_point_get_next_rank_point4rank_id($c_rank_id)
{
    $pre_point = db_point_get_rank_point4rank_id($c_rank_id);

    $sql = 'SELECT point FROM c_rank WHERE point > ? ORDER BY point';
    $params = array(intval($pre_point));

    return db_get_one($sql, $params);
}

// 指定したランクの情報を取得
function db_point_get_rank4rank_id($c_rank_id)
{
    $sql = "SELECT * FROM c_rank WHERE c_rank_id = ?";
    $params = array(intval($c_rank_id));
    return db_get_row($sql, $params);
}

?>
