<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_delete_c_album_image extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);

        if (!$album_image) {
            admin_client_redirect('edit_album_image_list', '指定された写真は存在しません');
        }

        db_album_delete_c_album_image($target_c_album_image_id, $album_image['c_member_id']);

        admin_client_redirect('edit_album_image_list', 'アルバムを削除しました');
    }
}

?>
