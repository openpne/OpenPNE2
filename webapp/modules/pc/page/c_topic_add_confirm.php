<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }

        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);

        //トピック作成権限チェック
        if ($c_commu['topic_authority'] == 'admin_only' && !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            $_REQUEST['target_c_commu_id'] = $c_commu_id;
            $_REQUEST['msg'] = "トピックは管理者だけが作成できます";
            openpne_forward('pc', 'page', "c_home");
            exit;
        }
        //---

        //TODO:画像バリデータ
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];

        $err_msg = array();

        if ($upfile_obj1['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj1))) {
                $err_msg[] = '画像1は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
        }
        if ($upfile_obj2['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj2))) {
                $err_msg[] = '画像2は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
        }
        if ($upfile_obj3['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj3))) {
                $err_msg[] = '画像3は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_topic_add");
            exit;
        }
        //-----

        //画像をvar/tmpフォルダにコピー
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        $tmpfile1 = t_image_save2tmp($upfile_obj1, $sessid, "t_1");
        $tmpfile2 = t_image_save2tmp($upfile_obj2, $sessid, "t_2");
        $tmpfile3 = t_image_save2tmp($upfile_obj3, $sessid, "t_3");

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
        );

        $this->set('c_topic', $c_topic);
        return 'success';
    }
}

?>
