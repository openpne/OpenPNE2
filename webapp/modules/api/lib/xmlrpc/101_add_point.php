<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function xmlrpc_101_add_point($message)
{
    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return false;
    }
    $params = XML_RPC_decode($param);

    if (empty($params['c_member_id'])) {
        return false;
    }
    if (!isset($params['point'])) {
        return false;
    }
    $c_member_id = intval($params['c_member_id']);
    $point = intval($params['point']);

    if (!db_member_c_member4c_member_id_LIGHT($c_member_id)) {
        return xmlrpc_get_fault_response(56);
    }

    $c_point_log_id = db_point_insert_log($c_member_id, $point, $params['memo']);
    db_point_insert_tags($c_point_log_id, $params['tags']);

    $point = db_point_add_point($c_member_id, $point);

    return xmlrpc_get_response($point);
}

?>
