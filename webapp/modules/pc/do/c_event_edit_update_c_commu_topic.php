<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_edit_update_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];
        $upfile_obj4 = $_FILES['filename4'];


        list($event, $errors) = p_c_event_add_confirm_event4request(true);
        if ($event['invite_period_year'].$event['invite_period_month'].$event['invite_period_day'] != '') {
            $invite_period = $event['invite_period_year']."-".$event['invite_period_month']."-".$event['invite_period_day'];
        } else {
            $invite_period = "";
        }
        $c_commu_id = $event['c_commu_id'];

        //--- 権限チェック
        //イベント管理者 or コミュニティ管理者

        if (!db_commu_is_c_event_admin($c_commu_topic_id, $u) &&
            !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }
        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
        if ($c_commu['is_topic'] == 'admin_only' &&
            !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        //エラーチェック
        $err_msg = $errors;
        $filesize = 0;
        $del_file = array();

        if (!$event['open_date_month'] || !$event['open_date_day'] || !$event['open_date_year']) {
            $err_msg[] = "開催日時を入力してください";
        } elseif (!t_checkdate($event['open_date_month'], $event['open_date_day'], $event['open_date_year'])) {
            $err_msg[] = "開催日時は存在しません";
        } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year']) < mktime(0, 0, 0)) {
            $err_msg[] = "開催日時は過去に指定できません";
        }

        if ($event['invite_period_month'].$event['invite_period_day'].$event['invite_period_year'] != "") {
            if (!$event['invite_period_month'] || !$event['invite_period_day'] || !$event['invite_period_year']) {
                $err_msg[] = "募集期限は存在しません";
            } elseif (!t_checkdate($event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "募集期限は存在しません";
            } elseif (mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year']) < mktime(0, 0, 0)) {
                $err_msg[] = "募集期限は過去に指定できません";
            } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year'])
                    < mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "募集期限は開催日時より未来に指定できません";
            }
        }

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        if (!empty($upfile_obj1) && $upfile_obj1['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj1))) {
                $err_msg[] = '画像1は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }

            $filesize += $image['size'];
            if ($c_topic['image_filename1']) {
                $del_file[] = $c_topic['image_filename1'];
            }
        }
        if (!empty($upfile_obj2) && $upfile_obj2['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj2))) {
                $err_msg[] = '画像2は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }

            $filesize += $image['size'];
            if ($c_topic['image_filename2']) {
                $del_file[] = $c_topic['image_filename2'];
            }
        }
        if (!empty($upfile_obj3) && $upfile_obj3['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj3))) {
                $err_msg[] = '画像3は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }

            $filesize += $image['size'];
            if ($c_topic['image_filename3']) {
                $del_file[] = $c_topic['image_filename3'];
            }
        }

        // 画像アップロード可能サイズチェック
        if (!$err_msg && $filesize) {
            $result = util_image_check_change_image_upload($filesize, $del_file, $u, 'commu');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $err_msg[] = util_image_get_upload_err_msg($result);
            }
        }

        if (OPENPNE_USE_FILEUPLOAD) {
            if (!empty($upfile_obj4) && $upfile_obj4['error'] !== UPLOAD_ERR_NO_FILE) {
                // ファイルサイズ制限
                if ($upfile_obj4['size'] === 0 || $upfile_obj4['size'] > FILE_MAX_FILESIZE * 1024) {
                    $err_msg[] = 'ファイルは' . FILE_MAX_FILESIZE . 'KB以内のファイルにしてください（ただし空のファイルはアップロードできません）';
                }

                // 拡張子制限
                if (!util_check_file_extention($upfile_obj4['name'])) {
                    $err_msg[] = sprintf('アップロードできるファイルの種類は(%s)です', util_get_file_allowed_extensions('string'));
                }
            }
        }

        if ($err_msg) {
            $_REQUEST = $event;
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['target_c_commu_topic_id'] = $c_commu_topic_id;
            openpne_forward('pc', 'page', "c_event_edit");
            exit;
        }

        // 画像アップデート
        $filename1 = image_insert_c_image_direct($upfile_obj1, "t_{$c_commu_topic_id}_1", $u);
        $filename2 = image_insert_c_image_direct($upfile_obj2, "t_{$c_commu_topic_id}_2", $u);
        $filename3 = image_insert_c_image_direct($upfile_obj3, "t_{$c_commu_topic_id}_3", $u);

        //ファイルアップロード
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        if (OPENPNE_USE_FILEUPLOAD) {
            $tmpfile4 = t_file_save2tmp($upfile_obj4, $sessid, "t_4");
        }
        if ($tmpfile4) {
            $filename4 = file_insert_c_file4tmp("t_{$c_commu_topic_id}_4", $tmpfile4, $upfile_obj4['name']);
        }
        t_file_clear_tmp(session_id());

        $update_c_commu_topic = array(
            'name'              => $event['title'],
            'open_date'         => $event['open_date_year']."-".$event['open_date_month']."-".$event['open_date_day'],
            'open_date_comment' => $event['open_date_comment'],
            'open_pref_id'      => $event['open_pref_id'],
            'open_pref_comment' => $event['open_pref_comment'],
            'invite_period'     => $invite_period,
            'event_flag'        => 1,
            'capacity'        => $event['capacity'],
        );
        db_commu_update_c_commu_topic($c_commu_topic_id, $update_c_commu_topic);


        $update_c_commu_topic_comment = array(
            'body' => $event['detail'],
        );
        // 画像アップロード可能サイズチェックで使用するため移動
//        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        if ($filename1) {
            $update_c_commu_topic_comment["image_filename1"] = $filename1;
            db_image_data_delete($c_topic['image_filename1'], $u);
        }
        if ($filename2) {
            $update_c_commu_topic_comment["image_filename2"] = $filename2;
            db_image_data_delete($c_topic['image_filename2'], $u);
        }
        if ($filename3) {
            $update_c_commu_topic_comment["image_filename3"] = $filename3;
            db_image_data_delete($c_topic['image_filename3'], $u);
        }
        if ($filename4) {
            $update_c_commu_topic_comment['filename4'] = $filename4;
            db_file_delete_c_file($c_topic['filename']);
        }
        db_commu_update_c_commu_topic_comment($c_commu_topic_id, $update_c_commu_topic_comment);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_event_detail', $p);
    }
}

?>
