<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール選択肢編集
class admin_do_update_c_profile_option extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_profile', array_shift($errors));
    }

    function execute($requests)
    {
        if ($requests['c_profile_option_id'] && $requests['value']) {
            db_admin_update_c_profile_option($requests['c_profile_option_id'], $requests['value'], $requests['sort_order']);
        }

        admin_client_redirect('edit_c_profile', 'プロフィール選択肢を変更しました');
    }
}

?>
