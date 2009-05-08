<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_topic_add_insert_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $c_commu_id = $requests['c_commu_id'];
        $title  = $requests['title'];
        $image_filename1_tmpfile = $requests['image_filename1_tmpfile'];
        $image_filename2_tmpfile = $requests['image_filename2_tmpfile'];
        $image_filename3_tmpfile = $requests['image_filename3_tmpfile'];
        $body = $requests['body'];

        //---添付ファイル
        if (OPENPNE_USE_FILEUPLOAD) {
            $filename4_tmpfile = $requests['filename4_tmpfile'];
            $filename4_original_filename = $requests['filename4_original_filename'];

            if ($filename4_tmpfile) {
                // 拡張子制限
                if (!util_check_file_extention($filename4_original_filename)) {
                    $_REQUEST['target_c_commu_id'] = $c_commu_id;
                    $_REQUEST['err_msg'] = sprintf('アップロードできるファイルの種類は(%s)です', util_get_file_allowed_extensions('string'));
                    openpne_forward('pc', 'page', "c_topic_add");
                    exit;
                }
            }
        }

        //---権限チェック
        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
        switch ($c_commu['is_topic']) {
            case 'public' :
                //誰でも作成可能
                break;
            case 'member' :
                //コミュニティ参加者
                $status = db_common_commu_status($u, $c_commu_id);
                if (!$status['is_commu_member']) {
                    handle_kengen_error();
                }
                break;
            case 'admin_only' :
                //トピック作成権限チェック
                if (!db_commu_is_c_commu_admin($c_commu_id, $u)) {
                    $_REQUEST['target_c_commu_id'] = $c_commu_id;
                    $_REQUEST['msg'] = "トピックは管理者だけが作成できます";
                    openpne_forward('pc', 'page', "c_home");
                    exit;
                }
                break;
        }

        //---画像アップロードサイズチェック
        $filesize = 0;
        if ($image_filename1_tmpfile) {
            $filesize += util_image_get_c_tmp_filesize4filename("t_{$c_commu_topic_id}_1", $image_filename1_tmpfile);
        }
        if ($image_filename2_tmpfile) {
            $filesize += util_image_get_c_tmp_filesize4filename("t_{$c_commu_topic_id}_2", $image_filename2_tmpfile);
        }
        if ($image_filename3_tmpfile) {
            $filesize += util_image_get_c_tmp_filesize4filename("t_{$c_commu_topic_id}_3", $image_filename3_tmpfile);
        }
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'commu');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $_REQUEST['target_c_commu_id'] = $c_commu_id;
                $_REQUEST['msg'] = util_image_get_upload_err_msg($result);
                openpne_forward('pc', 'page', "c_topic_add");
                exit;
            }
        }
        //---

        $insert_c_commu_topic = array(
            "name"        => $title,
            "c_commu_id"  => $c_commu_id,
            "c_member_id" => $u,
            "event_flag"  => 0
        );

        $c_commu_topic_id = db_commu_insert_c_commu_topic($insert_c_commu_topic);

        if ($image_filename1_tmpfile) {
            $filename1 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_1", $image_filename1_tmpfile, $u);
        }
        if ($image_filename2_tmpfile) {
            $filename2 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_2", $image_filename2_tmpfile, $u);
        }
        if ($image_filename3_tmpfile) {
            $filename3 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_3", $image_filename3_tmpfile, $u);
        }

        if (OPENPNE_USE_FILEUPLOAD) {
            // 添付ファイルをDBに入れる
            if ($filename4_tmpfile) {
                $filename4 = file_insert_c_file4tmp("t_{$c_commu_topic_id}_4", $filename4_tmpfile, $filename4_original_filename);
            }
        }

        //テンポラリファイルを削除(画像と同時)
        t_image_clear_tmp(session_id());
        t_file_clear_tmp(session_id());

        $insert_c_commu_topic_comment = array(
            "c_commu_id"       => $c_commu_id,
            "c_member_id"      => $u,
            "body"             => $body,
            "number"           => 0,
            "c_commu_topic_id" => $c_commu_topic_id,
            "image_filename1"  => !empty($filename1) ? $filename1 : '',
            "image_filename2"  => !empty($filename2) ? $filename2 : '',
            "image_filename3"  => !empty($filename3) ? $filename3 : '',
            "filename4"  => !empty($filename4) ? $filename4 : '',
        );
        $insert_id = db_commu_insert_c_commu_topic_comment_3($insert_c_commu_topic_comment);

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($insert_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($insert_id, $u);

        if (OPENPNE_USE_POINT_RANK) {
            //トピックを作成した人にポイント付与
            $point = db_action_get_point4c_action_id(9);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_topic_detail', $p);
    }
}

?>
