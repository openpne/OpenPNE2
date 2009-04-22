<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
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
        $subject = $requests['subject'];
        $image_description1 = $requests['image_description1'];
        $image_description2 = $requests['image_description2'];
        $image_description3 = $requests['image_description3'];
        $image_description4 = $requests['image_description4'];
        $image_description5 = $requests['image_description5'];
        // ----------

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }

        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $upfiles = array(
            1 => $_FILES['upfile_1'],
            $_FILES['upfile_2'],
            $_FILES['upfile_3'],
            $_FILES['upfile_4'],
            $_FILES['upfile_5'],
        );
        $tmpfiles = array(
            1 => '',
            '',
            '',
            '',
            '',
        );

        $is_set_file = false;
        foreach ($upfiles as $key => $upfile) {
            if($upfile['name']) {
                $is_set_file = true;
                break;
            }
        }
        if(!$is_set_file) {
            $_REQUEST['msg'] = '写真を指定してください';
            openpne_forward('pc', 'page', 'h_album_image_add');
            exit;
        }

        $filesize_all = 0;
        foreach ($upfiles as $key => $upfile) {
            if ($upfile['error'] !== UPLOAD_ERR_NO_FILE) {
                if (!($image = t_check_image($upfile))) {
                    $_REQUEST['msg'] = '写真は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
                    openpne_forward('pc', 'page', 'h_album_image_add');
                    exit;
                } else {
                    $filesize_all += $image['size'];
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "a_{$target_c_album_id}_{$key}", $image['format']);
                }
            }
        }

        // 画像アップロード可能サイズチェック
        $result = util_image_check_add_image_upload($filesize_all, $u, 'album');
        if ($result) {
            if ($result == 2) {
                $result = 3;
            }
            t_image_clear_tmp($sessid);

            $msg = util_image_get_upload_err_msg($result);
            $p = array(
                'msg' => $msg,
                'target_c_album_id' => $target_c_album_id,
            );
            openpne_redirect('pc', 'page_h_album_image_add', $p);
        }

        if (!db_album_is_insertable4c_member_id($u, $filesize_all)) {
            t_image_clear_tmp($sessid);
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

        $this->set('inc_navi', fetch_inc_navi('h'));

        $form_val = array(
            "target_c_album_id" => $target_c_album_id,
            "subject" => $subject,
            "upfile_1" => $_FILES['upfile_1'],
            "upfile_2" => $_FILES['upfile_2'],
            "upfile_3" => $_FILES['upfile_3'],
            "upfile_4" => $_FILES['upfile_4'],
            "upfile_5" => $_FILES['upfile_5'],
            "tmpfile_1" => $tmpfiles[1],
            "tmpfile_2" => $tmpfiles[2],
            "tmpfile_3" => $tmpfiles[3],
            "tmpfile_4" => $tmpfiles[4],
            "tmpfile_5" => $tmpfiles[5],
        );

        //ファイル写真を指定しているものだけ説明文を設定
        foreach ($tmpfiles as $key => $tmpfile) {
            $name = "image_description{$key}";
            if($tmpfile){
                $form_val["$name"] = $$name;
            }
        }

        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
