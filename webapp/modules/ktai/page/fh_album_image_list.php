<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_album_image_list extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $page = $requests['page'];
        $is_thumbnail = $requests['is_thumbnail'];
        $desc = $requests['desc'];
        // ----------
        $page_size = 10;

        // target が指定されていない
        if (!$target_c_album_id) {
            openpne_redirect('ktai', 'page_h_err_fh_album');
        }
        // target のアルバムが存在しない
        if (!p_common_is_active_c_album_id($target_c_album_id)) {
            openpne_redirect('ktai', 'page_h_err_fh_album');
        }

        $target_c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        $target_c_member_id = $target_c_album['c_member_id'];
        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

        // メンバーが存在しない
        if (!$target_c_member) {
            openpne_redirect('ktai', 'page_h_err_fh_album');
        }

        if ($target_c_member_id == $u) {
            $type = 'h';
            if (MAIL_ADDRESS_HASHED) {
                $mail_address = "ai{$target_c_album_id}-".t_get_user_hash($u).'@'.MAIL_SERVER_DOMAIN;
            } else {
                $mail_address = "ai{$target_c_album_id}".'@'.MAIL_SERVER_DOMAIN;
            }
            $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
            $this->set('mail_address', $mail_address);
        } else {
            $type = 'f';

            //check public flag
            if (!pne_check_album_public_flag($target_c_album_id, $u)) {
                openpne_redirect('ktai', 'page_h_err_fh_album');
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

        // メンバー情報
        $this->set('target_member', $target_c_member);

        // 写真の順番を入れ替える
        $this->set('desc', $desc);

        // アルバムに登録された写真
        list($album_image_list, $is_prev, $is_next, $total_num) =
            db_album_c_album_image_list4c_album_id($target_c_album_id, $page, $page_size, $desc);
        $this->set('album_image_list', $album_image_list);
        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $is_prev);
        $this->set('is_next', $is_next);
        $this->set('total_num', $total_num);

        $start = ($page - 1) * $page_size + 1;
        $end = $start + count($album_image_list) - 1;
        $this->set('start', $start);
        $this->set('end', $end);

        // サムネイルフラグ
        if (!$is_thumbnail) {
            $is_thumbnail = false;
        }
        $this->set('is_thumbnail', $is_thumbnail);

        return 'success';
    }
}

?>
