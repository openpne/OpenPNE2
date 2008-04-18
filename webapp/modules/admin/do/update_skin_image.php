<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_update_skin_image extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$_FILES['upfile']['size']) {
            admin_client_redirect('edit_skin_image', 'ファイルが指定されていません');
        }

        $prefix = sprintf('skin_%s', $requests['skinname']);
        if ($fn = image_insert_c_image($_FILES['upfile'], $prefix)) {
            if ($old_fn = db_get_c_skin_filename4skinname($requests['skinname'])) {
                db_image_data_delete($old_fn);
            }

            // 携帯版ロゴ画像がアップロードされた場合は、ロゴの非表示設定を解除する
            if ($requests['skinname'] == 'skin_ktai_header') {
                if (is_null(db_admin_c_admin_config4name('OPENPNE_USE_KTAI_LOGO'))) {
                    db_admin_insert_c_admin_config('OPENPNE_USE_KTAI_LOGO', true);
                } else {
                    db_admin_update_c_admin_config('OPENPNE_USE_KTAI_LOGO', true);
                }
            }

            db_replace_c_skin_filename($requests['skinname'], $fn);
            pne_cache_drop('fetch_inc_navi', 'h');
            admin_client_redirect('edit_skin_image', 'スキン画像を変更しました');
        }

        admin_client_redirect('edit_skin_image', 'スキン画像を変更できませんでした');
    }
}

?>
