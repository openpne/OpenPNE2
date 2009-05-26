<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール項目削除
class admin_do_delete_c_profile extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_delete_c_profile($requests['c_profile_id']);

        admin_client_redirect('edit_c_profile', 'プロフィール項目を削除しました');
    }
}

?>
