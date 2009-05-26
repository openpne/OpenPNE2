<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_is_login_rejected extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_update_is_login_rejected($requests['target_c_member_id']);
        admin_client_redirect('list_c_member', 'ログイン停止設定を変更しました');
    }
}

?>
