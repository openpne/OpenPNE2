<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_write_insert_c_commu_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $body = $requests['body'];
        $tmpfile1 = $requests['image_filename1_tmpfile'];
        $tmpfile2 = $requests['image_filename2_tmpfile'];
        $tmpfile3 = $requests['image_filename3_tmpfile'];
        $add_event_member = $requests['add_event_member'];
        // ----------

        //---添付ファイル
        if (OPENPNE_USE_FILEUPLOAD) {
            $filename4_tmpfile = $requests['filename4_tmpfile'];
            $filename4_original_filename = $requests['filename4_original_filename'];

            if ($filename4_tmpfile) {
                // 拡張子制限
                if (!util_check_file_extention($filename4_original_filename)) {
                    $_REQUEST['target_c_commu_id'] = $requests['c_commu_id'];
                    $_REQUEST['err_msg'] = sprintf('アップロードできるファイルの種類は(%s)です', util_get_file_allowed_extensions('string'));
                    openpne_forward('pc', 'page', "c_event_add");
                    exit;
                }
            }
        }

        //-- 権限チェック
        //コミュニティ参加者

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];
        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);
        switch ($c_commu['is_comment']) {
            case 'public' :
                //誰でもコメント可能
                break;
            case 'member' :
                $status = db_common_commu_status($u, $c_commu_id);
                if (!$status['is_commu_member']) {
                    handle_kengen_error();
                }
                break;
        }

        if (!db_commu_is_writable_c_commu_topic_comment4c_commu_topic_id($c_commu_topic_id)) {
            $err_msg[] = 'コメントが1000番に達したので、このイベントにはコメントできません';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_event_detail");
            exit;
        }
        //---

        //---画像アップロードサイズチェック
        $filesize = 0;
        if ($tmpfile1) {
            $filesize += util_image_get_c_tmp_filesize4filename("tc_{$tc_id}_1", $tmpfile1);
        }
        if ($tmpfile2) {
            $filesize += util_image_get_c_tmp_filesize4filename("tc_{$tc_id}_2", $tmpfile2);
        }
        if ($tmpfile3) {
            $filesize += util_image_get_c_tmp_filesize4filename("tc_{$tc_id}_3", $tmpfile3);
        }
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'commu');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $_REQUEST['err_msg'] = util_image_get_upload_err_msg($result);
                openpne_forward('pc', 'page', "c_event_detail");
                exit;
            }
        }

        if ($add_event_member == 1 && $c_topic['capacity'] && $c_topic['capacity'] <= $c_topic['member_num'] ) {
            $err_msg[] = 'イベントの参加者数制限を超えています';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_event_detail");
            exit;
        }

        if ($add_event_member) {
            if (!db_commu_is_event_join_date($c_commu_topic_id)) {
                handle_kengen_error();
            }
        }

        //イベントのメンバーに追加
        if ($add_event_member == 1) {
            db_commu_insert_c_event_member($c_commu_topic_id, $u);
        } elseif ($add_event_member == -1) {
            db_commu_delete_c_event_member($c_commu_topic_id, $u);
        }

        $number = db_commu_c_commu_topic_comment_number4c_commu_topic_id($c_commu_topic_id);
        $insert_c_commu_topic_comment = array(
            "c_commu_id"       => $c_commu_id,
            "c_member_id"      => $u,
            "body"             => $body,
            "number"           => $number,
            "c_commu_topic_id" => $c_commu_topic_id,
        );
        $tc_id = db_commu_insert_c_commu_topic_comment_3($insert_c_commu_topic_comment);

        if ($tmpfile1) {
            $filename1 = image_insert_c_image4tmp("tc_{$tc_id}_1", $tmpfile1, $u);
        }
        if ($tmpfile2) {
            $filename2 = image_insert_c_image4tmp("tc_{$tc_id}_2", $tmpfile2, $u);
        }
        if ($tmpfile3) {
            $filename3 = image_insert_c_image4tmp("tc_{$tc_id}_3", $tmpfile3, $u);
        }

        db_commu_update_c_commu_topic_comment_images($tc_id,
                $filename1, $filename2, $filename3);

        if (OPENPNE_USE_FILEUPLOAD) {
            // 添付ファイルをDBに入れる
            if ($filename4_tmpfile) {
                $filename4 = file_insert_c_file4tmp("tc_{$tc_id}_4", $filename4_tmpfile, $filename4_original_filename);
                db_commu_update_c_commu_topic_comment_file($tc_id, $filename4);
            }
        }

        //テンポラリファイルを削除(画像と同時)
        t_image_clear_tmp(session_id());
        t_file_clear_tmp(session_id());

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($tc_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($tc_id, $u);

        if (OPENPNE_USE_POINT_RANK) {
            //トピック・イベントにコメントした人にポイント付与
            $point = db_action_get_point4c_action_id(11);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_event_detail', $p);
    }
}

?>
