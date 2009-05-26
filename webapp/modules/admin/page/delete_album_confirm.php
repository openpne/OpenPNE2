<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_delete_album_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $v = array();
        $target_c_album_id = $requests['target_c_album_id'];
        $album = db_album_get_c_album4c_album_id($target_c_album_id);

        if (!$album) {
            admin_client_redirect('edit_album_list', '指定されたアルバムは存在しません');
        }

        $member = db_member_c_member4c_member_id($album['c_member_id']);
        $album['c_member'] = $member;
        $this->set('album', $album);

        $this->set($v);
        return 'success';
    }
}

?>
