<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_sns_message($params, &$smarty)
{
    if (empty($params['var'])) {
        return array();
    }

    $result = array(
        'unread_message_list' => _getUnreadMessageList(),
        'unread_messsage_count' => db_message_count_c_message_not_is_read4c_member_to_id(1),
    );
    $smarty->assign($params['var'], $result);
}

function _getUnreadMessageList()
{
    $sql = 'SELECT * FROM c_message WHERE c_member_id_to = ? AND is_read = 0 AND is_send = 1 ORDER BY c_message_id DESC';
    $list = db_get_all_limit($sql, 0, 5, array(1));
    foreach ($list as $key => $value) {
        $list[$key]['c_member'] = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
    }
    return $list;
}

?>
