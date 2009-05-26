<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_update_skin_theme extends OpenPNE_Action
{
    function execute($requests)
    {
        $value = $requests['value'];
        if (!$value || preg_match('/[^\.\w]/', $value)) {
            admin_client_redirect('edit_skin_image', 'スキン画像を変更できませんでした');
        }

        $name = 'OPENPNE_SKIN_THEME';
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $value);
        } else {
            db_admin_update_c_admin_config($name, $value);
        }

        // カスタマイズスキン画像を全削除
        db_delete_all_c_skin_filename($value);
        pne_cache_drop('fetch_inc_navi', 'h');

        admin_client_redirect('edit_skin_image', 'スキン画像を変更しました');
    }
}

?>
