<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_message_send_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['subject'];
        $_REQUEST['msg2'] = $errors['body'];
        openpne_forward('pc', 'page', 'f_message_send', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $form_val['target_c_member_id'] = $requests['target_c_member_id'];
        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];
        $form_val['target_c_message_id'] = $requests['target_c_message_id'];
        $form_val['jyusin_c_message_id'] = $requests['jyusin_c_message_id'];
        $save = $requests['save'];
        // ----------
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        if ($form_val['target_c_member_id'] == $u) {  // 自分にメッセージは送れない
            handle_kengen_error();
        }

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

        //添付ファイル
        $upfile_4 = $_FILES['uploadfile'];

        $target_member = db_member_c_member4c_member_id($form_val['target_c_member_id']);
        if (empty($target_member)) {
            handle_kengen_error();
        }

        $filesize = 0;
        foreach ($upfiles as $key => $upfile) {
            if (!empty($upfile) && $upfile['error'] !== UPLOAD_ERR_NO_FILE) {
                if (!($image = t_check_image($upfile))) {
                    $_REQUEST['msg'] = '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
                    openpne_forward('pc', 'page', 'f_message_send');
                    exit;
                } else {
                    $filesize += $image['size'];
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "d_{$key}", $image['format']);
                }
            }
        }

        //---画像アップロードサイズチェック
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'other');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $_REQUEST['msg'] = util_image_get_upload_err_msg($result);
                openpne_forward('pc', 'page', 'f_message_send');
                exit;
            }
        }

        if (OPENPNE_USE_FILEUPLOAD) {
            if (!empty($upfile_4) && $upfile_4['error'] !== UPLOAD_ERR_NO_FILE) {
                // ファイルサイズ制限
                if ($upfile_4['size'] === 0 || $upfile_4['size'] > FILE_MAX_FILESIZE * 1024) {
                    $err_msg[] = 'ファイルは' . FILE_MAX_FILESIZE . 'KB以内のファイルにしてください（ただし空のファイルはアップロードできません）';
                }

                // 拡張子制限
                if (!util_check_file_extention($upfile_4['name'])) {
                    $err_msg[] = sprintf('アップロードできるファイルの種類は(%s)です', util_get_file_allowed_extensions('string'));
                }
            }
        }
        $form_val['upfile_1'] = $_FILES['upfile_1'];
        $form_val['upfile_2'] = $_FILES['upfile_2'];
        $form_val['upfile_3'] = $_FILES['upfile_3'];
        $form_val['tmpfile_1'] = $tmpfiles[1];
        $form_val['tmpfile_2'] = $tmpfiles[2];
        $form_val['tmpfile_3'] = $tmpfiles[3];
        if (OPENPNE_USE_FILEUPLOAD) {
            $form_val['upfile_4'] = $upfile_4;
            $form_val['tmpfile_4'] = t_file_save2tmp($upfile_4, $sessid, "tc_4");
        }

        $target_c_member_id = $form_val['target_c_member_id'];

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi("f", $target_c_member_id));

        //ターゲット情報
        $this->set("target_member", $target_member);

        //ターゲットのid
        $this->set("target_c_member_id", $form_val['target_c_member_id']);

        $this->set("form_val", $form_val);

        //下書き保存
        if (!empty ($save)) {
            //下書き保存が存在しない
            if ($form_val['target_c_message_id'] == $form_val['jyusin_c_message_id']) {
                db_message_insert_message_to_is_save($form_val['target_c_member_id'], $u, $form_val['subject'], $form_val['body'], $_REQUEST['jyusin_c_message_id']);
            } else { //下書き保存が存在する
                db_message_update_message_to_is_save($form_val['target_c_message_id'], $form_val['subject'], $form_val['body']);
            }

            $p = array('msg' => 2);
            openpne_redirect('pc', 'page_h_reply_message', $p);
        }

        return 'success';
    }
}

?>
