<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_blacklist_edit_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('blacklist_edit', array_shift($errors), 'target_c_blacklist_id='.$this->requests['target_c_blacklist_id']);
    }

    function execute($requests)
    {
        if (db_member_easy_access_id_is_blacklist($requests['easy_access_id'], $requests['target_c_blacklist_id'])) {
            admin_client_redirect('blacklist_edit', 'その携帯個体識別番号(暗号化済)は既に登録されています', 'target_c_blacklist_id='.$requests['target_c_blacklist_id']);
        }

        $c_black_list = db_admin_c_blacklist($requests['target_c_blacklist_id']);
        if (!$c_black_list) {
            admin_client_redirect('blacklist', 'ブラックリストに登録されていません');
        }

        $c_member_id = db_member_c_member_id4easy_access_id($requests['easy_access_id'], false);
        $c_member = array();
        if ($c_member_id) {
            $c_member = db_member_c_member4c_member_id($c_member_id, true);
        }

        $this->set('target_c_blacklist_id', $requests['target_c_blacklist_id']);
        $this->set('easy_access_id', $requests['easy_access_id']);
        $this->set('info', $requests['info']);
        $this->set('member', $c_member);

        return 'success';
    }
}

?>
