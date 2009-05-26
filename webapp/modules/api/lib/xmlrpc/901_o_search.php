<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function xmlrpc_901_o_search($message)
{
    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return false;
    }
    $params = XML_RPC_decode($param);

    if (!array_key_exists('searchword', $params)) {
        return false;
    }

    if (empty($params['type'])) {
        return false;
    }

    $searchword = $params['searchword'];
    if (empty($searchword)) {
        $searchword = '';
    }
    $type = $params['type'];

    $number = 0;

    switch ($type) {
    case 'DIARY':
        $diary = p_h_diary_list_all_search_c_diary4c_diary($searchword, 0, 1);
        $number += (int)$diary[3];
        break;
    case 'COMMUNITY':
        $commu = db_commu_search_c_commu4c_commu_category($searchword, 0, 0, 1);
        $number += (int)$commu[3];
        break;
    case 'ALL':
    default:
        $diary = p_h_diary_list_all_search_c_diary4c_diary($searchword, 0, 1);
        $number += (int)$diary[3];
        $commu = db_commu_search_c_commu4c_commu_category($searchword, 0, 0, 1);
        $number += (int)$commu[3];
        break;
    }

    $result = array(
        'number' => intval($number),
        'sns_name' => SNS_NAME,
    );

    return xmlrpc_get_response($result);
}

?>
