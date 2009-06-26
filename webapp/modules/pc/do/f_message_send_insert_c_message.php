<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージ送信
 */
class pc_do_f_message_send_insert_c_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_member_id_to = $requests['c_member_id_to'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        // ----------

        // 添付ファイル
        $fileupload_error = '';
        if (OPENPNE_USE_FILEUPLOAD) {
            $tmpfile_4 = $requests['tmpfile_4'];
            $tmpfile_4_original_filename = $requests['tmpfile_4_original_filename'];

            if ($tmpfile_4) {
                // 拡張子制限
                if (!util_check_file_extention($tmpfile_4_original_filename)) {
                    $fileupload_error = sprintf('アップロードできるファイルの種類は(%s)です', util_get_file_allowed_extensions('string'));
                }
            }
        }

        $msg1 = "";
        $msg2 = "";

        if (null == $subject) {
            $msg1 = "件名を入力してください";
        }
        if (null == $body) {
            $msg2 = "メッセージを入力してください";
        }
        if (!$msg1 && !$msg2 && $fileupload_error) {
            $msg1 = $fileupload_error;
        } else if (!$msg1 && !$msg2 && !$fileupload_error) {
            //---画像アップロードサイズチェック
            $filesize = 0;
            if ($tmpfile_1) {
                $filesize += util_image_get_c_tmp_filesize4filename("ms_{$c_message_id}_1", $tmpfile_1);
            }
            if ($tmpfile_2) {
                $filesize += util_image_get_c_tmp_filesize4filename("ms_{$c_message_id}_2", $tmpfile_2);
            }
            if ($tmpfile_3) {
                $filesize += util_image_get_c_tmp_filesize4filename("ms_{$c_message_id}_3", $tmpfile_3);
            }
            if ($filesize) {
                $result = util_image_check_add_image_upload($filesize, $u, 'other');
                if ($result) {
                    if ($result == 2) {
                        $result = 3;
                    }
                    $msg1 = util_image_get_upload_err_msg($result);
                }
            }
        }

        if ($requests['target_c_message_id'] == $requests['jyusin_c_message_id']) {
            $is_savebox = false;
        } else {
            $is_savebox = true;
        }

        if ($msg1 || $msg2) {
            $p = array(
                'target_c_member_id' => $c_member_id_to,
                'target_c_message_id' => $requests['target_c_message_id'],
                'jyusin_c_message_id' => $requests['jyusin_c_message_id'],
                'body' => $requests['body'],
                'subject' => $requests['subject'],
                'msg1' => $msg1,
                'msg2' => $msg2,
            );
            if ($is_savebox) {
                $p['box'] = 'savebox';
            }
            openpne_redirect('pc', 'page_f_message_send', $p);
        }

        //修正
        if ($requests['no']) {
            $p = array(
                'target_c_member_id' => $c_member_id_to,
                'target_c_message_id' => $requests['target_c_message_id'],
                'jyusin_c_message_id' => $requests['jyusin_c_message_id'],
                'body' => $requests['body'],
                'subject' => $requests['subject'],
            );
            openpne_redirect('pc', 'page_f_message_send', $p);
        }

        //--- 権限チェック
        //送信先が自分以外

        if ($c_member_id_to == $u) {
            handle_kengen_error();
        }

        //存在しないメンバー
        $target_member = db_member_c_member4c_member_id($c_member_id_to);
        if (empty($target_member)) {
            handle_kengen_error();
        }

        //アクセスブロック設定
        if (db_member_is_access_block($u, $c_member_id_to)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        if ($requests['jyusin_c_message_id']) {
            $c_message = db_message_c_message4c_message_id($requests['jyusin_c_message_id']);
            if ($c_message['c_member_id_to'] != $u || !$c_message['is_send']) {
                handle_kengen_error();
            }
        }
        if ($requests['target_c_message_id'] != $requests['jyusin_c_message_id']) {
            $c_message = db_message_c_message4c_message_id($requests['target_c_message_id']);
            if ($c_message['c_member_id_from'] != $u || $c_message['is_send']) {
                handle_kengen_error();
            }
        }
        //---

        //返信済みにする
        if ($requests['jyusin_c_message_id']) {
            db_message_update_is_hensin($requests['jyusin_c_message_id']);
        }

        //下書き保存が存在しない
        if (!$is_savebox) {
            $c_message_id = db_message_send_message($u, $c_member_id_to, $subject, $body);
        } else {
            $c_message_id = $requests['target_c_message_id'];
            db_message_update_message_to_is_save($requests['target_c_message_id'], $subject, $body, 1);
            do_common_send_message_mail_send($c_member_id_to, $u, $subject, $body, $requests['target_c_message_id']);
            do_common_send_message_mail_send_ktai($c_member_id_to, $u, $subject, $body);
        }

        //画像・ファイル挿入
        $sessid = session_id();
        $filename_1 = image_insert_c_image4tmp("ms_{$c_message_id}_1", $tmpfile_1, $u);
        $filename_2 = image_insert_c_image4tmp("ms_{$c_message_id}_2", $tmpfile_2, $u);
        $filename_3 = image_insert_c_image4tmp("ms_{$c_message_id}_3", $tmpfile_3, $u);
        $filename_4 = '';
        if (OPENPNE_USE_FILEUPLOAD) {
            if ($tmpfile_4) {
                $filename_4 = file_insert_c_file4tmp("ms_{$c_message_id}_4", $tmpfile_4, $tmpfile_4_original_filename);
            }
        }
        t_image_clear_tmp($sessid);
        t_file_clear_tmp($sessid);
        db_message_update_c_message($c_message_id, $subject, $body, $filename_1, $filename_2, $filename_3, $filename_4);

        $p = array('msg' => 1);
        openpne_redirect('pc', 'page_h_reply_message', $p);
    }
}

?>
