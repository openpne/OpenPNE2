<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理用アカウント削除
class admin_do_delete_c_admin_user extends OpenPNE_Action
{
    function execute($requests)
    {
        if ($requests['target_id'] > 1) {
            db_admin_delete_c_admin_user($requests['target_id']);
            admin_client_redirect('list_c_admin_user', 'アカウントを削除しました');
        } else {
            admin_client_redirect('list_c_admin_user', 'アカウントを削除できませんでした');
        }
    }
}

?>
