<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_delete_album_image_confirm_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $v = array();

        $target_c_album_image_ids = $requests['target_c_album_image_ids'];

        // アルバム写真が選択されていない場合はエラー
        if (!$target_c_album_image_ids) {
            admin_client_redirect('edit_album_image_list', "アルバム写真が選択されていません");
        }

        $id_ary = split(":", $target_c_album_image_ids);

        $album_image_list = array();
        foreach ($id_ary as $id) {
            $album_image = db_album_image_get_c_album_image4id($id);

            if (!$album_image) {
                admin_client_redirect('edit_album_image_list', '指定されたアルバムは存在しません');
            }

            $member = db_member_c_member4c_member_id($album_image['c_member_id']);
            $album_image['c_member'] = $member;

            array_push($album_image_list, $album_image);
        }
        $this->set('album_image_list', $album_image_list);
        $this->set('target_c_album_image_ids', $target_c_album_image_ids);

        $this->set($v);
        return 'success';
    }
}

?>
