<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール選択肢追加
class admin_do_insert_c_profile_option extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_profile', array_shift($errors));
    }

    function execute($requests)
    {
        if ($requests['c_profile_id'] && $requests['value']) {
            db_admin_insert_c_profile_option($requests['c_profile_id'], $requests['value'], $requests['sort_order']);
        }

        admin_client_redirect('edit_c_profile', 'プロフィール選択肢を追加しました');
    }
}

?>
