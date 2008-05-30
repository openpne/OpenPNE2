<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像削除
class admin_do_delete_skin_image extends OpenPNE_Action
{
    function execute($requests)
    {
        db_delete_c_skin_filename($requests['skinname']);

        // スキンディレクトリの画像からコピーするスキン名
        $skinname_list = array(
            'no_image',
            'no_logo',
            'no_logo_small',
        );
        if (in_array($requests['skinname'], $skinname_list)) {
            db_insert_c_image4skin_filename($requests['skinname']);
        }

        pne_cache_drop('fetch_inc_navi', 'h');

        admin_client_redirect('edit_skin_image', '画像をデフォルトに戻しました');
    }
}

?>
