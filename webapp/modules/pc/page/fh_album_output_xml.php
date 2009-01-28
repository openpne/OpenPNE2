<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_album_output_xml extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        // ----------

        if (!p_common_is_active_c_album_id($target_c_album_id)) {
            util_send_header_internal_server_error();
        }

        //--- 権限チェック
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        $target_c_member_id = $c_album['c_member_id'];
        $c_album['c_member'] = db_member_c_member4c_member_id_LIGHT($target_c_member_id);
        $c_album['album_cover_image'] = util_get_img_url($c_album['album_cover_image'], 180, 180);
        $c_album['word_my_friend'] = WORD_MY_FRIEND;

        if ($u != $target_c_member_id) {
            // メンバーが存在しない
            if (!$c_album['c_member']) {
                util_send_header_internal_server_error();
            }

            // check public_flag
            if (!pne_check_album_public_flag($target_c_album_id, $u)) {
                util_send_header_internal_server_error();
            }

            // アクセスブロック設定
            if (db_member_is_access_block($u, $target_c_member_id)) {
                util_send_header_internal_server_error();
            }
        }
        //---

        util_output_xml4array($c_album, 'c_album');
    }
}

?>
