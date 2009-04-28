<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_delete_album_confirm_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $v = array();

        $target_c_album_ids = $requests['target_c_album_ids'];

        // アルバムが選択されていない場合はエラー
        if (!$target_c_album_ids) {
            admin_client_redirect('edit_album_list', "アルバムが選択されていません");
        }

        $id_ary = split(":", $target_c_album_ids);

        $album_list = array();
        foreach ($id_ary as $id) {
            $album = db_album_get_c_album4c_album_id($id);

            if (!$album) {
                admin_client_redirect('edit_album_list', '指定されたアルバムは存在しません');
            }

            $member = db_member_c_member4c_member_id($album['c_member_id']);
            $album['c_member'] = $member;

            array_push($album_list, $album);
        }
        $this->set('album_list', $album_list);
        $this->set('target_c_album_ids', $target_c_album_ids);

        $this->set($v);
        return 'success';
    }
}

?>
