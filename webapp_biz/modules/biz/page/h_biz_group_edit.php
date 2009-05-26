<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_h_biz_group_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $sql = 'SELECT c_member_id, nickname FROM c_member WHERE c_member_id <>  ?';
        $params = array(
            $u,
        );

        $members = db_get_all($sql, $params);

        $sql = 'SELECT c_member_id, nickname FROM c_member WHERE c_member_id = ?';
        $params = array(
            $u,
        );

        $my_info = db_get_row($sql, $params);

        array_unshift($members, $my_info);

        $id = $requests['target_id'];
        $group = biz_getGroupData($id);

        if ($u != $group['admin_id']) {
            die('アクセスできません。');
        }

        foreach ($members as $key => $value) {
            if (biz_isGroupMember($value['c_member_id'], $id)) {
                $members[$key]['joined'] = true;
            } else {
                $members[$key]['joined'] = false;
            }
        }
        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set("c_invite_list", $members);
        $this->set("group", $group);
        $this->set("c_member_id", $u);
        return 'success';
    }
}

?>
