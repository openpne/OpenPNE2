<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムを修正
 */
class pc_do_h_album_image_edit_insert_c_album_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_album_image_edit', $errors);
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $image_description = $requests['image_description'];
        $tmpfile = $requests['tmpfile_1'];
        // ----------

        $filename = '';
        $filesize = 0;
        $c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $target_c_album_id = $c_album_image['c_album_id'];
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }

        // 画像アップロード可能サイズチェック
        if ($tmpfile) {
            $del_file = array();
            $filesize = util_image_get_c_tmp_filesize4filename("a_{$target_c_album_id}_1", $tmpfile);
            if ($c_album_image['image_filename']) {
                $del_file[] = $c_album_image['image_filename'];
            }

            $result = util_image_check_change_image_upload($filesize, $del_file, $u, 'album');
            if ($result) {
                $sessid = session_id();
                t_image_clear_tmp($sessid);

                $msg = util_image_get_upload_err_msg($result);
                $p = array(
                    'msg' => $msg,
                    'target_c_album_id' => $target_c_album_id,
                    'target_c_album_image_id' => $target_c_album_image_id
                );
                openpne_redirect('pc', 'page_h_album_image_edit', $p);
            }
        }

        // アルバム写真登録処理
        if ($tmpfile) {
            if (!list($filename, $filesize) = image_insert_c_image_album4tmp("a_{$target_c_album_id}_1", $tmpfile, $u)) {
                $this->handleError(array('写真が登録できませんでした'));
            }

            $sessid = session_id();
            t_image_clear_tmp($sessid);

            if (!db_album_is_insertable4c_member_id($u, $filesize - $c_album_image['filesize'])) {
                db_album_image_data_delete($filename, $u);

                $msg = 'これ以上写真を投稿することができません。';
                if (!db_album_is_insertable4c_member_id($u)) {
                    $msg .= '登録済みの写真を削除してからやり直してください。';
                } else {
                    $msg .= 'ファイルサイズを変更してやり直してください。';
                }
                $p = array(
                    'msg' => $msg,
                    'target_c_album_id' => $target_c_album_id,
                    'target_c_album_image_id' => $target_c_album_image_id
                );
                openpne_redirect('pc', 'page_h_album_image_edit', $p);
            }

            db_album_image_data_delete($c_album_image['image_filename'], $u);
        }

        db_album_update_c_album_image($target_c_album_image_id, $filename, $image_description, $filesize);

        // c_albumの更新時間UPDATE
        db_album_update_c_album_u_datetime($target_c_album_id);

        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);

    }
}

?>
