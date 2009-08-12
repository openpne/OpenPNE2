<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムの追加・編集
 */
class ktai_do_h_album_cover_image_copy extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        // ----------

        $target_c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        //targetのアルバム写真が存在しない
        if (!$target_c_album_image) {
            openpne_redirect('ktai', 'page_h_err_fh_album');
        }
        $target_c_album_id = $target_c_album_image['c_album_id'];

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        //targetのアルバムが存在しない
        if (!$c_album) {
            openpne_redirect('ktai', 'page_h_err_fh_album');
        }
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        $image_filename = $target_c_album_image['image_filename'];
        $path_parts = pathinfo($image_filename);
        $ext = $path_parts['extension'];
        $new_filename = 'a_' . $target_c_album_id . '_1_' . time() . '.' . $ext;
        $c_image_id = db_image_data_copy($image_filename, $new_filename, $u, $target_c_album_image['filesize']);

        if (!$c_image_id) {
            openpne_redirect('ktai', 'page_h_err_fh_album');
        }

        $c_album_cover = $c_album['album_cover_image'];
        db_album_image_data_delete($c_album_cover, $u);
        db_album_update_c_album_album_cover_image($target_c_album_id, $new_filename);

        $p = array('target_c_member_id' => $u, 'target_c_album_id' => $target_c_album_id);
        openpne_redirect('ktai', 'page_fh_album', $p);
    }
}

?>
