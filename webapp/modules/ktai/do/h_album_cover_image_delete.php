<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバム表紙削除
 */
class ktai_do_h_album_cover_image_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        // ----------

        //--- 権限チェック
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        $c_album_cover = $c_album['album_cover_image'];
        db_album_image_data_delete($c_album_cover, $u);
        db_album_update_c_album_album_cover_image($target_c_album_id,'');

        $p = array('target_c_member_id' => $u, 'target_c_album_id' => $target_c_album_id);
        openpne_redirect('ktai', 'page_h_album_edit', $p);
    }
}

?>
