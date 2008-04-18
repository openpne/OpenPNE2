<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムに画像を登録
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

        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $insert_data = array();
        $filesize_all = 0;

        // 画像登録用の連想配列を作成
        for ($i = 1; $i <= 5; $i++) {
            $tmpfile = $requests['tmpfile_' . $i];

            if ($tmpfile) {
                $description = $requests['image_description' . $i];
                $filename = image_insert_c_image_album4tmp("a_{$target_c_album_id}_{$i}", $tmpfile);
                $filesize = filesize($img_tmp_dir_path . basename($tmpfile));

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
            $msg = 'これ以上画像を投稿することができません。';
            if (!db_album_is_insertable4c_member_id($u)) {
                $msg .= '登録済みの画像を削除してからやり直してください。';
            } else {
                $msg .= '投稿する画像を減らすか、ファイルサイズを変更してやり直してください。';
            }
            $p = array(
                'msg' => $msg,
                'target_c_album_id' => $target_c_album_id,
            );
            openpne_redirect('pc', 'page_h_album_image_add', $p);
        }

        // 画像を登録する
        foreach ($insert_data as $value) {
            db_insert_c_album_image($target_c_album_id, $u, $value['filename'], $value['description'], $value['filesize']);
        }

        // 画像が登録されたので、アルバムの更新日時も更新する
        db_album_update_c_album_u_datetime($target_c_album_id);

        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);
    }
}

?>
