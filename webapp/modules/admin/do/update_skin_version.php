<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_skin_version extends OpenPNE_Action
{
    function execute($requests)
    {
        $name = 'SKIN_VERSION';
        $value = $requests['version'];

        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $value);
        } else {
            db_admin_update_c_admin_config($name, $value);
        }

        admin_client_redirect('edit_skin_image', 'スキン画像設定を変更しました');
    }
}

?>
