<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_delete_c_cmd_caster extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_cmd_caster_id = $requests['c_cmd_caster_id'];

        db_admin_delete_c_cmd_caster($c_cmd_caster_id);

        admin_client_redirect('list_c_cmd_caster', 'CMDキャストURLを削除しました');
    }
}

?>
