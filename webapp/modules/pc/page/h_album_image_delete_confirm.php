<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        // ----------

        $target_c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $target_c_album_id = $target_c_album_image['c_album_id'];

        $album = db_album_get_c_album4c_album_id($target_c_album_id);
        if($album['c_member_id'] != $u){
            handle_kengen_error();
        }

        // target が指定されていない
        if (!$target_c_album_image_id) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        // target の写真が存在しない
        if (!p_common_is_active_c_album_image_id($target_c_album_image_id)) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        $this->set('target_c_album_image',$target_c_album_image);

        $form_val = array(
            "target_c_album_id" => $target_c_album_id,
            "target_c_album_image_id" => $target_c_album_image_id,
        );
        $this->set("form_val",$form_val);

        return 'success';
    }
}

?>
