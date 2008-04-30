<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function xmlrpc_002_get_member_point($message)
{
    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return false;
    }
    $params = XML_RPC_decode($param);

    if (empty($params['c_member_id'])) {
        return false;
    }

    $point = get_point($params['c_member_id']);
    return xmlrpc_get_response($point);
}

function get_point($c_member_id)
{
    $sql = 'SELECT c_profile_id FROM c_profile WHERE name = \'PNE_POINT\'';
    if (!$c_profile_id = db_get_one($sql)) {
        return 0;
    }

    $sql = 'SELECT value FROM c_member_profile WHERE c_member_id = ? AND c_profile_id = ?';
    $params = array(intval($c_member_id), intval($c_profile_id));
    $point = db_get_one($sql, $params);

    return intval($point);
}

?>
