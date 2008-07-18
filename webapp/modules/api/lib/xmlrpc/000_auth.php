<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 認証API
 */
function xmlrpc_000_auth($message)
{
    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return false;
    }
    $params = XML_RPC_decode($param);

    if (empty($params['sid'])) {
        return false;
    }
    if (empty($params['mid'])) {
        return false;
    }
    if (empty($params['dt'])) {
        return false;
    }

    $c_member_id = $params['mid'];
    $datetime    = $params['dt'];

    if (!db_member_c_member4c_member_id_LIGHT($c_member_id)) {
        return xmlrpc_get_fault_response(56);
    }

    if (!$member_token = db_api_get_member_token($c_member_id)) {
        return xmlrpc_get_fault_response(52);
    }

    $session_id = api_get_sid($c_member_id, $member_token, $datetime);
    if ($params['sid'] != $session_id) {
        return xmlrpc_get_fault_response(52);
    }

    return xmlrpc_get_response($c_member_id);
}

?>
