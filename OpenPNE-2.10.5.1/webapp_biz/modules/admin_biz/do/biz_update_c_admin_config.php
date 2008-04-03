<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// SNS設定変更

class admin_biz_do_biz_update_c_admin_config extends OpenPNE_Action
{
    function execute($requests)
    {

        $allowed_names = array(
            'IS_CLOSED_SHISETSU',
        );

        foreach ($requests as $name => $value) {
            if (!in_array($name, $allowed_names)) continue;

            // 配列の場合はカンマ区切りに
            if (is_array($value)) {
                $value = implode(',', $value);
            }

            biz_admin_updateConfig($name, $value);
        }

        admin_biz_client_redirect('biz_edit_c_admin_config', "設定を変更しました");
    }
}

?>
