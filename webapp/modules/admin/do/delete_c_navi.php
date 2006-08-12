<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_delete_c_navi extends OpenPNE_Action
{
    function execute($requests)
    {
        db_delete_c_navi(
            $requests['navi_type'],
            $requests['sort_order']);
        admin_client_redirect('edit_c_navi', 'リセットしました');
    }
}

?>
