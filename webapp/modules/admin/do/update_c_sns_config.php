<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_sns_config 更新
class admin_do_update_c_sns_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $sets = array();
        for ($i = 0; $i <= 10; $i++) {
            $name = sprintf('border_%02d', $i);
            if ($requests[$name]) {
                $sets[$name] = $requests[$name];
            }
        }
        for ($i = 0; $i <= 10; $i++) {
            $name = sprintf('bg_%02d', $i);
            if ($requests[$name]) {
                $sets[$name] = $requests[$name];
            }
        }
        if (!$sets) {
            admin_client_redirect('edit_c_sns_config');
        }
        db_admin_update_c_sns_config($sets);

        // bg_11 - bg_13
        for ($i = 11; $i <= 13; $i++) {
            $key  = 'bg_'.$i;
            $name = 'SKIN_BG_'.$i;
            if ($requests[$key]) {
                if (is_null(db_admin_c_admin_config4name($name))) {
                    db_admin_insert_c_admin_config($name, $requests[$key]);
                } else {
                    db_admin_update_c_admin_config($name, $requests[$key]);
                }
            }
        }

        admin_client_redirect('edit_c_sns_config', '色を変更しました');
    }
}

?>
