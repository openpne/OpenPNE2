<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_diary_comment_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'fh_diary', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $body = $requests['body'];
        // ----------

        $target_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $target_diary['c_member_id'];

        if (!$target_c_member_id) {
            $target_c_member_id = $u;
        }

        if ($target_c_member_id == $u) {
            $type = 'h';

        } else {
            $type = 'f';
            $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

            // check public_flag
            if (!pne_check_diary_public_flag($target_c_diary_id, $u)) {
                openpne_redirect('pc', 'page_h_err_diary_access');
            }
            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
        }

        //日記コメント停止設定
        if (OPENPNE_USE_DIARY_COMMENT && !$target_diary['is_comment_input']) {
            openpne_forward('pc', 'page', 'fh_diary');
            exit;
        }

        if (!db_diary_is_writable_comment4c_diary_id($target_c_diary_id)) {
            $_REQUEST['msg'] = 'コメントが1000番に達したので、この' . WORD_DIARY . 'にはコメントできません';
            openpne_forward('pc', 'page', 'fh_diary');
            exit;
        }

        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $upfiles = array(
            1 => $_FILES['upfile_1'],
            $_FILES['upfile_2'],
            $_FILES['upfile_3'],
        );
        $tmpfiles = array(
            1 => '',
            '',
            '',
        );

        $filesize = 0;
        foreach ($upfiles as $key => $upfile) {
            if (!empty($upfile) && $upfile['error'] !== UPLOAD_ERR_NO_FILE) {
                if (!($image = t_check_image($upfile))) {
                    $_REQUEST['msg'] = '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
                    openpne_forward('pc', 'page', 'fh_diary');
                    exit;
                } else {
                    $filesize += $image['size'];
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "dc_{$key}", $image['format']);
                }
            }
        }

        //---画像アップロードサイズチェック
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'diary');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $_REQUEST['msg'] = util_image_get_upload_err_msg($result);
                openpne_forward('pc', 'page', 'fh_diary');
                exit;
            }
        }

        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $form_val = array(
            "target_c_diary_id" => $target_c_diary_id,
            "body" => $body,
            "upfile_1" => $_FILES['upfile_1'],
            "upfile_2" => $_FILES['upfile_2'],
            "upfile_3" => $_FILES['upfile_3'],
            "tmpfile_1" => $tmpfiles[1],
            "tmpfile_2" => $tmpfiles[2],
            "tmpfile_3" => $tmpfiles[3],
        );

        $this->set("form_val", $form_val);
        return 'success';
    }
}

?>
