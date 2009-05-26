<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_delete_c_album_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $id_ary = split(":", $requests['target_c_album_ids']);

        foreach ($id_ary as $id) {
            $album = db_album_get_c_album4c_album_id($id);

            if (!$album) {
                admin_client_redirect('edit_album_list', '指定されたアルバムは存在しません');
            }
        }

        foreach ($id_ary as $id) {
            db_album_delete_c_album($id);
        }

        admin_client_redirect('edit_album_list', 'アルバムを削除しました');
    }
}

?>
