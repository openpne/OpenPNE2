<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ユーザー強制退会 確認画面
class admin_page_delete_c_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_profile_list'] = db_common_c_profile_list4null();
        $v['c_member'] = db_common_c_member4c_member_id($requests['target_c_member_id'], true, true, 'private');

        $this->set($v);
        return 'success';
    }
}

?>
