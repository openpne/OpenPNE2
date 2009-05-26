<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_blacklist_add extends OpenPNE_Action
{
    function execute($requests)
    {
        if ($requests['easy_access_id'] && db_member_easy_access_id_is_blacklist($requests['easy_access_id'])) {
            admin_client_redirect('blacklist', 'その携帯個体識別番号(暗号化済)は既に登録されています');
        }

        $this->set('requests', $requests);

        return 'success';
    }
}

?>
