<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// CMD編集&追加
class admin_do_update_c_cmd extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$requests['name']) {
            admin_client_redirect('list_c_cmd', 'URLを入力して下さい');
        }

        $permit = 0;
        foreach ($requests['permit'] as $item) {
            $permit += $item;
        }
        if ($requests['c_cmd_id']) {
            db_admin_update_c_cmd($requests['c_cmd_id'], $requests['name'], $permit);
            admin_client_redirect('list_c_cmd', 'CMDを編集しました');
        } else {
            db_admin_insert_c_cmd($requests['name'], $permit);
            admin_client_redirect('list_c_cmd', 'CMDを追加しました');
        }

    }
}

?>
