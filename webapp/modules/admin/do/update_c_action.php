<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// アクション編集
class admin_do_update_c_action extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('list_c_action', array_shift($errors));
    }

    function execute($requests)
    {
        db_admin_update_c_action($requests['c_action_id'], $requests['name'], $requests['point']);

        admin_client_redirect('list_c_action', 'アクションを編集しました');
    }
}

?>
