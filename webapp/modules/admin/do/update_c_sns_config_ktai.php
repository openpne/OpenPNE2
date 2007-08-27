<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_sns_config_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $color = array();
        foreach ($requests as $key => $value) {
            if (!strncmp($key, 'bg', strlen('bg')) || !strncmp($key, 'border', strlen('border')) || !strncmp($key, 'font', strlen('font'))) {
                $color[$key] = $value;
            }
        }
        db_admin_update_c_sns_config_ktai($color);

        admin_client_redirect('edit_c_sns_config_ktai', '色を変更しました');
    }
}

?>
