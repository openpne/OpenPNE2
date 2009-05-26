<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function xmlrpc_001_get_c_member($message)
{
    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return false;
    }
    $params = XML_RPC_decode($param);

    if (empty($params['target_c_member_id'])) {
        return false;
    }
    if (empty($params['my_c_member_id'])) {
        return false;
    }

    $t_id = intval($params['target_c_member_id']);
    $m_id = intval($params['my_c_member_id']);

    // my_c_member_id が不正
    if (!db_member_c_member4c_member_id_LIGHT($m_id)) {
        return xmlrpc_get_fault_response(56);
    }

    if ($t_id == $m_id) { // 自分
        $public_flag = 'private';
    } elseif (db_friend_is_friend($t_id, $m_id)) {
        $public_flag = 'friend';
    } else {
        $public_flag = 'public';
    }

    // target_c_member_id が不正
    if (!$c_member = db_member_c_member4c_member_id($t_id, false, true, $public_flag)) {
        return xmlrpc_get_fault_response(56);
    }

    // アクセスブロック判定
    if (db_member_is_access_block($m_id, $t_id)) {
        $result = array(
            'c_member_id' => $t_id,
            'nickname'    => $c_member['nickname'],
            'image_url'   => xmlrpc_get_image_url(),
        );
    } else {
        $result = array(
            'c_member_id' => $t_id,
            'nickname'    => $c_member['nickname'],
            'image_url'   => xmlrpc_get_image_url($c_member['image_filename']),
            'image_url_1' => xmlrpc_get_image_url($c_member['image_filename_1'], false),
            'image_url_2' => xmlrpc_get_image_url($c_member['image_filename_2'], false),
            'image_url_3' => xmlrpc_get_image_url($c_member['image_filename_3'], false),
            'birth_year'  => intval($c_member['birth_year']),
            'birth_month' => intval($c_member['birth_month']),
            'birth_day'   => intval($c_member['birth_day']),
            'access_date' => xmlrpc_get_date($c_member['access_date']),
            'r_date'      => xmlrpc_get_date($c_member['r_date']),
            'profile'     => array(),
        );
        foreach ($c_member['profile'] as $key => $profile) {
            $result['profile'][$key] = $profile['value'];
        }
    }

    return xmlrpc_get_response($result);
}

?>
