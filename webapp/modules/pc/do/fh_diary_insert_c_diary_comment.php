<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_fh_diary_insert_c_diary_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        $body = $requests['body'];
        // ----------

        if (is_null($body) || $body === '') {
            $p = array(
                'target_c_diary_id' => $target_c_diary_id,
                'msg' => "コメントを入力してださい"
            );
            openpne_redirect('pc', 'page_fh_diary', $p);
        }

        //--- 権限チェック

        $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
        $target_c_member_id = $c_diary['c_member_id'];
        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

        if ($u != $target_c_member_id) {
            // check public_flag
            if (!pne_check_diary_public_flag($target_c_diary_id, $u)) {
                openpne_redirect('pc', 'page_h_err_diary_access');
            }
            //アクセスブロック設定
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
        }

        //日記コメント停止設定
        if (OPENPNE_USE_DIARY_COMMENT && !$c_diary['is_comment_input']) {
            openpne_forward('pc', 'page', 'fh_diary');
            exit;
        }

        if (!db_diary_is_writable_comment4c_diary_id($target_c_diary_id)) {
            $_REQUEST['msg'] = 'コメントが1000番に達したので、この' . WORD_DIARY . 'にはコメントできません';
            openpne_forward('pc', 'page', 'fh_diary');
            exit;
        }
        //---

        //---画像アップロードサイズチェック
        $filesize = 0;
        if ($tmpfile_1) {
            $filesize += util_image_get_c_tmp_filesize4filename("dc_{$c_diary_comment_id}_1", $tmpfile_1);
        }
        if ($tmpfile_2) {
            $filesize += util_image_get_c_tmp_filesize4filename("dc_{$c_diary_comment_id}_2", $tmpfile_2);
        }
        if ($tmpfile_3) {
            $filesize += util_image_get_c_tmp_filesize4filename("dc_{$c_diary_comment_id}_3", $tmpfile_3);
        }
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

        //日記コメント書き込み
        $c_diary_comment_id = db_diary_insert_c_diary_comment($u, $target_c_diary_id, $body);

        $sessid = session_id();
        $filename_1 = image_insert_c_image4tmp("dc_{$c_diary_comment_id}_1", $tmpfile_1, $u);
        $filename_2 = image_insert_c_image4tmp("dc_{$c_diary_comment_id}_2", $tmpfile_2, $u);
        $filename_3 = image_insert_c_image4tmp("dc_{$c_diary_comment_id}_3", $tmpfile_3, $u);
        t_image_clear_tmp($sessid);

        db_diary_insert_c_diary_comment_images($c_diary_comment_id, $filename_1, $filename_2, $filename_3);

        //日記コメント記入履歴更新
        if ($u != $target_c_member_id) {
            db_diary_insert_c_diary_comment_log($u, $target_c_diary_id);
        }
        db_diary_update_c_diary_comment_log($target_c_diary_id);

        //日記コメントが書き込まれたので日記自体を未読扱いにする
        db_diary_update_c_diary_is_checked($target_c_diary_id, 0);

        // お知らせメール送信(携帯へ)
        if ($u != $target_c_member_id) {
            send_diary_comment_info_mail($c_diary_comment_id, $u);
        }

        if (OPENPNE_USE_POINT_RANK) {
            // コメント者と被コメント者が違う場合にポイント加算
            if ($u != $target_c_member_id) {
                //書いた人にポイント付与
                $point = db_action_get_point4c_action_id(3);
                db_point_add_point($u, $point);

                //書かれた人にポイント付与
                $point = db_action_get_point4c_action_id(2);
                db_point_add_point($target_c_member_id, $point);
            }
        }

        $p = array(
            'target_c_diary_id' => $target_c_diary_id,
            'comment_count' => db_diary_count_c_diary_comment4c_diary_id($target_c_diary_id)
        );
        openpne_redirect('pc', 'page_fh_diary', $p);
    }
}

?>
