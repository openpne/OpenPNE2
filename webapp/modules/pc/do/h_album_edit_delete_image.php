<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_album_edit_delete_image extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_album_image_id = $requests['target_c_album_image_id'];
        // ----------

        //--- 権限チェック
        $c_album_image = db_album_image_get_c_album_image4id($c_album_image_id);
        $c_album = db_album_get_c_album4c_album_id($c_album_image['c_album_id']);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }

        db_album_delete_c_album_image($c_album_image_id, $u);

        $p = array('target_c_album_id' => $c_album_image['c_album_id']);
        openpne_redirect('pc', 'page_fh_album', $p);
    }
}

?>
