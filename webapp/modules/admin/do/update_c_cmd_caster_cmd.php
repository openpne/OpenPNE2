<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_cmd_caster_cmd extends OpenPNE_Action
{
    function handleError($errors)
    {
        openpne_forward('admin', 'page', 'list_c_cmd_caster', $errors);
        exit;
    }

    function execute($requests)
    {
        $c_cmd_caster_id = $requests['c_cmd_caster_id'];

        $result = db_admin_update_c_cmd4c_cmd_caster_id($c_cmd_caster_id);
        if ($result) {
            admin_client_redirect('list_c_cmd_caster', 'CMD情報を更新しました');
        } else {
            admin_client_redirect('list_c_cmd_caster', 'CMD情報を更新できませんでした');
        }
    }
}

?>
