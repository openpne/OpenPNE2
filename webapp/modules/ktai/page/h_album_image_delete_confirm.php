<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_album_image_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

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

        $this->set('c_album_image', $target_c_album_image);

        return 'success';
    }
}

?>
