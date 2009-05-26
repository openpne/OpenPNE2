<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_delete_c_album_image_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $id_ary = split(":", $requests['target_c_album_image_ids']);

        $album_image_list = array();
        foreach ($id_ary as $id) {
            $album_image = db_album_image_get_c_album_image4id($id);

            if (!$album_image) {
                admin_client_redirect('edit_album_image_list', '指定された写真は存在しません');
            }

            array_push($album_image_list, $album_image);
        }

        foreach ($album_image_list as $album_image) {
            db_album_delete_c_album_image($album_image['c_album_image_id'], $album_image['c_member_id']);
        }

        admin_client_redirect('edit_album_image_list', 'アルバムを削除しました');
    }
}

?>
