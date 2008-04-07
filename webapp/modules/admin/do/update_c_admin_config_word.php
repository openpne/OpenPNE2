<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// SNS内名称設定変更
class admin_do_update_c_admin_config_word extends OpenPNE_Action
{
    function execute($requests)
    {
        $config =& OpenPNE_Config::getInstance();

        foreach ($requests as $name => $value) {
            if (!$config->is_allowed($name)) continue;

            // 配列の場合はカンマ区切りに
            if (is_array($value)) {
                $value = implode(',', $value);
            }

            if (is_null(db_admin_c_admin_config4name($name))) {
                db_admin_insert_c_admin_config($name, $value);
            } else {
                db_admin_update_c_admin_config($name, $value);
            }
        }

        admin_client_redirect('edit_c_admin_config_word', '設定を変更しました');
    }
}

?>
