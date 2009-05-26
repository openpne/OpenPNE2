<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_album_image_show extends OpenPNE_Action
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

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        // ----------

        //targetのアルバム写真が存在しない
        if (!p_common_is_active_c_album_image_id($target_c_album_image_id)) {
            $this->handleError();
        }

        $target_c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $target_c_album_id = $target_c_album_image['c_album_id'];

        //targetのアルバムが存在しない
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

            //check public flag
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
        $this->set('c_album_image', $target_c_album_image);
        $this->set('c_album_image_id_prev', db_album_image_c_album_image_id_prev4c_album_id($target_c_album_id, $target_c_album_image_id));
        $this->set('c_album_image_id_next', db_album_image_c_album_image_id_next4c_album_id($target_c_album_id, $target_c_album_image_id));

        $this->set('album_info', $target_c_album);
        $this->set('target_member', $target_c_member);

        return 'success';
    }
}

?>
