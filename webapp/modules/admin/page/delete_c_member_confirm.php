<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー強制退会 確認画面
class admin_page_delete_c_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {

        // ID 1 のメンバーは強制退会できない
        if ($requests['target_c_member_id'] == 1) {
            admin_client_redirect('top', 'ID 1 のメンバーを強制退会させることはできません');
        }

        $v = array();

        $v['c_profile_list'] = db_member_c_profile_list4null();
        $v['c_member'] = db_member_c_member4c_member_id($requests['target_c_member_id'], true, true, 'private');

        $this->set($v);
        return 'success';
    }
}

?>
