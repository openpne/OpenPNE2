<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/***
 *
 */
class admin_do_update_c_admin_config_use_ktai_logo extends OpenPNE_Action
{
    function execute($requests)
    {
        db_delete_c_skin_filename('skin_ktai_header');
        pne_cache_drop('fetch_inc_navi', 'h');

        if (is_null(db_admin_c_admin_config4name('OPENPNE_USE_KTAI_LOGO'))) {
            db_admin_insert_c_admin_config('OPENPNE_USE_KTAI_LOGO', !OPENPNE_USE_KTAI_LOGO);
        } else {
            db_admin_update_c_admin_config('OPENPNE_USE_KTAI_LOGO', !OPENPNE_USE_KTAI_LOGO);
        }
        admin_client_redirect('edit_skin_image', '携帯版ロゴ画像の表示設定を変更しました');
    }
}

?>
