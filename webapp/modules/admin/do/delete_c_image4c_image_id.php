<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像削除
class admin_do_delete_c_image4c_image_id extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_image = db_image_c_image4c_image_id($requests['target_c_image_id']);

        if (strpos($c_image['filename'], 'skin_') === 0 || strpos($c_image['filename'], 'no_') === 0) {
            admin_client_redirect('list_c_image', 'この画像は削除できません');
        }

        image_data_delete($c_image['filename']);

        // biz_groupの画像データを削除
        $data = array('image_filename' => 0);
        $where = array('image_filename' => addslashes($c_image['filename']));
        db_update('biz_group', $data, $where);

        $data = array('image_filename' => 0);
        $where = array('image_filename' => addslashes($c_image['filename']));
        db_update('biz_shisetsu', $data, $where);

        db_admin_delete_c_image_link4image_filename($c_image['filename']);

        admin_client_redirect('list_c_image', '画像を削除しました');
    }
}

?>
