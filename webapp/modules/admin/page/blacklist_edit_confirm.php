<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_blacklist_edit_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        if (db_member_easy_access_id_is_blacklist($requests['easy_access_id'], $requests['target_c_blacklist_id'])) {
            admin_client_redirect('blacklist_edit', 'その個体識別番号は既に登録されています', 'target_c_blacklist_id='.$requests['target_c_blacklist_id']);
        }
        
        $c_member_id = db_member_c_member_id4easy_access_id($requests['easy_access_id'], false);
        $c_member = db_member_c_member4c_member_id($c_member_id, true);
        
        $this->set('target_c_blacklist_id', $requests['target_c_blacklist_id']);
        $this->set('easy_access_id', $requests['easy_access_id']);
        $this->set('info', $requests['info']);
        $this->set('member', $c_member);
        
        return 'success';
    }
}

?>
