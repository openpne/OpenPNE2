<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

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

?>
