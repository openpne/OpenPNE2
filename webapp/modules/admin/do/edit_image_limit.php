<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_edit_image_limit extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_image_limit', array_shift($errors));
        exit;
    }

    function execute($requests)
    {
        $limit_user  = $requests['limit_user'];
        $limit_album = $requests['limit_album'];
        $limit_diary = $requests['limit_diary'];
        $limit_commu = $requests['limit_commu'];

        if ($limit_user == '') {
            $limit_user = 0;
        }
        if ($limit_album == '') {
            $limit_album = 0;
        }
        if ($limit_diary == '') {
            $limit_diary = 0;
        }
        if ($limit_commu == '') {
            $limit_commu = 0;
        }

        $limit_other = 0;
        if ($limit_user) {
            $limit_all = $limit_album + $limit_diary + $limit_commu;
            if ($limit_all >= $limit_user) {
                admin_client_redirect('edit_image_limit', 
                    '個別の容量制限の合計が全体画像容量制限の値以上になっています');
            }

            $limit_other = $limit_user - $limit_album - $limit_diary - $limit_commu;
        }

        // 全体画像容量制限
        $name = 'OPENPNE_IMAGE_USER_LIMIT';
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $limit_user);
        } else {
            db_admin_update_c_admin_config($name, $limit_user);
        }

        // アルバム容量制限
        $name = 'OPENPNE_ALBUM_LIMIT';
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $limit_album);
        } else {
            db_admin_update_c_admin_config($name, $limit_album);
        }

        // 日記画像容量制限
        $name = 'OPENPNE_IMAGE_DIARY_LIMIT';
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $limit_diary);
        } else {
            db_admin_update_c_admin_config($name, $limit_diary);
        }

        // コミュニティ画像容量制限
        $name = 'OPENPNE_IMAGE_COMMU_LIMIT';
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $limit_commu);
        } else {
            db_admin_update_c_admin_config($name, $limit_commu);
        }

        // その他画像容量制限
        $name = 'OPENPNE_IMAGE_OTHER_LIMIT';
        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $limit_other);
        } else {
            db_admin_update_c_admin_config($name, $limit_other);
        }

        admin_client_redirect('edit_image_limit', '設定を変更しました');
    }
}

?>
