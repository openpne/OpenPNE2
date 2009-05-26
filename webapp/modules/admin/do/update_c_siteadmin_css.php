<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_siteadmin_css extends OpenPNE_Action
{
    function execute($requests)
    {
        if (db_admin_c_siteadmin('inc_custom_css')) {
            //update
            db_admin_update_c_siteadmin('inc_custom_css', $requests['body']);
        } else {
            //insert
            db_admin_insert_c_siteadmin('inc_custom_css', $requests['body']);
        }

        admin_client_redirect('edit_c_sns_config', 'カスタムCSSを変更しました');
    }
}

?>
