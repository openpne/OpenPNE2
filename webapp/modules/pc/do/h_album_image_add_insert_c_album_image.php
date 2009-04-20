<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムに写真を登録
 */
class pc_do_h_album_image_add_insert_c_album_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['target_c_album_id'];
        openpne_forward('pc', 'page', 'h_album_image_add', $errors);
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        // ----------

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }

        // 画像アップロード可能サイズチェック
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        $tmpfile_4 = $requests['tmpfile_4'];
        $tmpfile_5 = $requests['tmpfile_5'];
        $filesize_all = 0;
        if ($tmpfile_1) {
            $filesize_all += util_image_get_c_tmp_filesize4filename("a_{$target_c_album_id}_1", $tmpfile_1);
        }
        if ($tmpfile_2) {
            $filesize_all += util_image_get_c_tmp_filesize4filename("a_{$target_c_album_id}_2", $tmpfile_2);
        }
        if ($tmpfile_3) {
            $filesize_all += util_image_get_c_tmp_filesize4filename("a_{$target_c_album_id}_3", $tmpfile_3);
        }
        if ($tmpfile_4) {
            $filesize_all += util_image_get_c_tmp_filesize4filename("a_{$target_c_album_id}_4", $tmpfile_4);
        }
        if ($tmpfile_5) {
            $filesize_all += util_image_get_c_tmp_filesize4filename("a_{$target_c_album_id}_5", $tmpfile_5);
        }
        if ($filesize_all) {
            $result = util_image_check_add_image_upload($filesize_all, $u, 'album');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                t_image_clear_tmp(session_id());

                $msg = util_image_get_upload_err_msg($result);
                $p = array(
                    'msg' => $msg,
                    'target_c_album_id' => $target_c_album_id,
                );
                openpne_redirect('pc', 'page_h_album_image_add', $p);
            }
        }

        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $insert_data = array();
        $filesize_all = 0;

        // 写真登録用の連想配列を作成
        for ($i = 1; $i <= 5; $i++) {
            $tmpfile = $requests['tmpfile_' . $i];

            if ($tmpfile) {
                $description = $requests['image_description' . $i];
                if (!list($filename, $filesize) = image_insert_c_image_album4tmp("a_{$target_c_album_id}_{$i}", $tmpfile, $u)) {
                    continue;
                }

                // 説明文が空の場合はファイル名を挿入する
                if (!$description) {
                    $description = $filename;
                }

                $insert_data[] = array(
                    'filename' => $filename,
                    'description' => $description,
                    'filesize' => $filesize,
                );

                $filesize_all += $filesize;
            }
        }

        t_image_clear_tmp(session_id());

        // 容量制限
        if (!db_album_is_insertable4c_member_id($u, $filesize_all)) {
            $msg = 'これ以上写真を投稿することができません。';
            if (!db_album_is_insertable4c_member_id($u)) {
                $msg .= '登録済みの写真を削除してからやり直してください。';
            } else {
                $msg .= '投稿する写真を減らすか、ファイルサイズを変更してやり直してください。';
            }
            $p = array(
                'msg' => $msg,
                'target_c_album_id' => $target_c_album_id,
            );
            openpne_redirect('pc', 'page_h_album_image_add', $p);
        }

        // 写真を登録する
        foreach ($insert_data as $value) {
            db_insert_c_album_image($target_c_album_id, $u, $value['filename'], $value['description'], $value['filesize']);
        }

        // 写真が登録されたので、アルバムの更新日時も更新する
        db_album_update_c_album_u_datetime($target_c_album_id);

        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);
    }
}

?>
