<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_api_get_member_token($c_member_id)
{
    $sql = 'SELECT token FROM c_api_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    if ($token = db_get_one($sql, $params)) {
        return $token;
    } else {
        return db_api_insert_token($c_member_id);
    }
}

function db_api_insert_token($c_member_id, $token = '')
{
    if (!$token) $token = create_hash();
    $data = array(
        'c_member_id' => intval($c_member_id),
        'token' => $token,
    );
    if (db_insert('c_api_member', $data)) {
        return $token;
    } else {
        return false;
    }
}

function db_api_update_token($c_member_id)
{
    $token = create_hash();

    $data  = array('token' => $token);
    $where = array('c_member_id' => intval($c_member_id));
    db_update('c_api_member', $data, $where);

    if (!db_affected_rows()) {
        db_api_insert_token($c_member_id, $token);
    }
    return $token;
}

function get_api_sessionid($c_member_id)
{
    if (!$c_member_id) {
        return;
    }
    // Session
    $api_token = OPENPNE_API_TOKEN;
    $c_member_token = db_api_get_member_token($c_member_id);
    $datetime=date("YmdHis");
    $api_session_id = md5($api_token . $c_member_id . $c_member_token . $datetime)."&mid=".$c_member_id."&dt=".$datetime;
    return $api_session_id;
}

function db_api_get_c_api_one($name)
{
    $sql = 'SELECT * FROM c_api WHERE name = ?';
    $params = array(strval($name));

    return db_get_row($sql, $params);
}

function db_api_check_ip($name, $ip)
{
    $api = db_api_get_c_api_one($name);
    if ($api['ip'] == '*' || $api['ip'] == $ip) {
        return true;
    } else {
        return false;
    }
}

?>
