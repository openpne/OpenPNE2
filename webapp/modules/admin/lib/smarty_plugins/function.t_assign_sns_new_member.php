<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_sns_new_member($params, &$smarty)
{
    if (empty($params['var'])) {
        return array();
    }

    $result = _getNewMemberList();

    $smarty->assign($params['var'], $result);
}

function _getNewMemberList()
{
    $sql = 'SELECT * FROM c_member WHERE c_member_id <> 1 ORDER BY c_member_id DESC';
    $list = db_get_all_limit($sql, 0, 5);
    foreach ($list as $key => $value) {
        $list[$key]['c_member_invite'] = db_member_c_member4c_member_id_LIGHT($value['c_member_id_invite']);
    }
    return $list;
}
?>
