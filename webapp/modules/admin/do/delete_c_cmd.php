<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// CMD削除
class admin_do_delete_c_cmd extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_delete_c_cmd($requests['c_cmd_id']);

        admin_client_redirect('list_c_cmd', 'CMDを削除しました');
    }
}

?>
