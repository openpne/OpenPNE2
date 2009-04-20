<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_topic_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'c_topic_add', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $title = $requests['title'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
        
        switch ($c_commu['is_topic']) {
            case 'public' :
                //誰でも作成可能
                break;
            case 'member' :
                if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
                    handle_kengen_error();
                }
                break;
            case 'admin_only' :
                //トピック作成権限チェック
                if (!db_commu_is_c_commu_admin($c_commu_id, $u)) {
                    handle_kengen_error();
                }
                break;
        }

        //画像ファイル
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];

        //添付ファイル
        $upfile_obj4 = $_FILES['uploadfile'];

        $err_msg = array();
        $filesize = 0;

        if (!empty($upfile_obj1) && $upfile_obj1['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj1))) {
                $err_msg[] = '画像1は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
            $filesize += $image['size'];
        }
        if (!empty($upfile_obj2) && $upfile_obj2['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj2))) {
                $err_msg[] = '画像2は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
            $filesize += $image['size'];
        }
        if (!empty($upfile_obj3) && $upfile_obj3['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj3))) {
                $err_msg[] = '画像3は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
            $filesize += $image['size'];
        }

        // 画像アップロードサイズチェック
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'commu');
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
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_topic_add");
            exit;
        }
        $sessid = session_id();

        //-----

        t_image_clear_tmp($sessid);
        t_file_clear_tmp($sessid);

        //画像をvar/tmpフォルダにコピー
        $tmpfile1 = t_image_save2tmp($upfile_obj1, $sessid, "t_1");
        $tmpfile2 = t_image_save2tmp($upfile_obj2, $sessid, "t_2");
        $tmpfile3 = t_image_save2tmp($upfile_obj3, $sessid, "t_3");
        if (OPENPNE_USE_FILEUPLOAD) {
            // 一次ファイルをvar/tmpにコピー
            $tmpfile4 = t_file_save2tmp($upfile_obj4, $sessid, "t_4");
        }

        $this->set('inc_navi', fetch_inc_navi("c", $c_commu_id));
        $c_topic = array(
            'c_commu_id' => $c_commu_id,
            'title'      => $title,
            'body'       => $body,
            'image_filename1_tmpfile' => $tmpfile1,
            'image_filename2_tmpfile' => $tmpfile2,
            'image_filename3_tmpfile' => $tmpfile3,
            'image_filename1'         => $upfile_obj1["name"],
            'image_filename2'         => $upfile_obj2["name"],
            'image_filename3'         => $upfile_obj3["name"],
             // 添付ファイル
            'filename4_tmpfile' => $tmpfile4,
            'filename4_original_filename' => $upfile_obj4["name"],
        );

        $this->set('c_topic', $c_topic);
        return 'success';
    }
}

?>
