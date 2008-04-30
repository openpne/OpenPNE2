<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class portal_do_edit_portal_use extends OpenPNE_Action
{
    function execute($requests)
    {
        $use_portal = $requests['use_portal'];

        $tmp = db_portal_config(PORTAL_CONFIG_USE_PORTAL);

        if (!isset($tmp)) {
            db_portal_insert_portal_config(PORTAL_CONFIG_USE_PORTAL, $use_portal);
        } else {
            db_portal_update_portal_config(PORTAL_CONFIG_USE_PORTAL, $use_portal);
        }

        if ($use_portal) {
            $this->_replace_c_admin_config('LOGIN_URL_PC', openpne_gen_url('portal', 'page_user_top'));
            $this->_replace_c_admin_config('DISPLAY_LOGIN', '0');
        } else {
            $this->_replace_c_admin_config('LOGIN_URL_PC', '');
        }

        portal_client_redirect('edit_portal_use', 'ポータル使用設定を変更しました');
    }

    function _replace_c_admin_config($name, $value)
    {
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $value);
        } else {
            db_admin_update_c_admin_config($name, $value);
        }
    }
}
?>
