<?php
class portal_do_edit_portal_use_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $use_portal = $requests['use_portal'];

        $tmp = db_portal_config('USE_PORTAL_KTAI');

        if (!isset($tmp)) {
            db_portal_insert_portal_config('USE_PORTAL_KTAI', $use_portal);
        } else {
            db_portal_update_portal_config('USE_PORTAL_KTAI', $use_portal);
        }

        if ($use_portal) {
            $this->_replace_c_admin_config('LOGIN_URL_KTAI', openpne_gen_url('portal', 'page_portal_user_top_ktai'));
            $this->_replace_c_admin_config('DISPLAY_LOGIN', '0');
        } else {
            $this->_replace_c_admin_config('LOGIN_URL_KTAI', '');
        }

        portal_client_redirect('edit_portal_use_ktai', '携帯版ポータル使用設定を変更しました');
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
