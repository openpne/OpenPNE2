<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_album extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('ktai', 'page_h_err_fh_album');
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        // ----------

        // target のアルバムが存在しない
        if (!p_common_is_active_c_album_id($target_c_album_id)) {
            $this->handleError();
        }

        $target_c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        $target_c_member_id = $target_c_album['c_member_id'];
        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

        // メンバーが存在しない
        if (!$target_c_member) {
            $this->handleError();
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
        } else {
            $type = 'f';

            // check public flag
            if (!pne_check_album_public_flag($target_c_album_id, $u)) {
                $this->handleError();
            }

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('ktai', 'page_h_access_block');
            }

            // あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }

        $this->set('type', $type);
        $this->set('album_info', $target_c_album);

        //メンバー情報
        $this->set("target_member", $target_c_member);

        return 'success';
    }
}

?>
