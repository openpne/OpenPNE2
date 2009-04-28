<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記を書く
 */
class pc_do_h_diary_add_insert_c_diary extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['subject'];
        $_REQUEST['msg2'] = $errors['body'];
        $_REQUEST['msg3'] = $errors['public_flag'];
        openpne_forward('pc', 'page', 'h_diary_add', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $subject = $requests['subject'];
        $body = $requests['body'];
        $public_flag = util_cast_public_flag_diary($requests['public_flag']);
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        $category = preg_split('/\s+/', $requests['category']);
        $is_comment_input = $requests['is_comment_input'];
        // ----------

        $sessid = session_id();
        $c_member_id = $u;

        if (count($category) > 5) {
            $_REQUEST['msg'] = 'カテゴリは5つまでしか指定できません';
            openpne_forward('pc', 'page', 'h_diary_add');
            exit;
        }
        foreach($category as $value) {
            if (mb_strwidth($value) > 20) {
                $_REQUEST['msg'] = 'カテゴリはひとつにつき全角10文字（半角20文字）以内で入力してください';
                openpne_forward('pc', 'page', 'h_diary_add');
                exit;
            }
        }

        // 画像アップロード可能サイズチェック
        $filesize = 0;
        if ($tmpfile_1) {
            $filesize += util_image_get_c_tmp_filesize4filename("d_{$c_diary_id}_1", $tmpfile_1);
        }
        if ($tmpfile_2) {
            $filesize += util_image_get_c_tmp_filesize4filename("d_{$c_diary_id}_2", $tmpfile_2);
        }
        if ($tmpfile_3) {
            $filesize += util_image_get_c_tmp_filesize4filename("d_{$c_diary_id}_3", $tmpfile_3);
        }
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'diary');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $_REQUEST['msg'] = util_image_get_upload_err_msg($result);
                openpne_forward('pc', 'page', 'h_diary_add');
                exit;
            }
        }

        if (!OPENPNE_USE_DIARY_COMMENT) {
            $is_comment_input = 1;
        }

        $c_diary_id = db_diary_insert_c_diary($c_member_id, $subject, $body, $public_flag, $is_comment_input);

        foreach($category as $value) {
            if (empty($value)) {
                break;
            }

            $c_category_id = db_diary_get_category_id4category_name($c_member_id, $value);
            if (is_null($c_category_id)) {
                $c_category_id = db_diary_category_insert_category($c_member_id, $value);
            }
            db_diary_category_insert_c_diary_category_diary($c_diary_id, $c_category_id);
        }

        $filename_1 = image_insert_c_image4tmp("d_{$c_diary_id}_1", $tmpfile_1, $u);
        $filename_2 = image_insert_c_image4tmp("d_{$c_diary_id}_2", $tmpfile_2, $u);
        $filename_3 = image_insert_c_image4tmp("d_{$c_diary_id}_3", $tmpfile_3, $u);
        t_image_clear_tmp($sessid);

        db_diary_update_c_diary($c_diary_id, $subject, $body, $public_flag, $is_comment_input, $filename_1, $filename_2, $filename_3);

        if (OPENPNE_USE_POINT_RANK) {
            //日記を書いた人にポイント付与
            $point = db_action_get_point4c_action_id(4);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_diary_id' => $c_diary_id);
        openpne_redirect('pc', 'page_fh_diary', $p);
    }
}

?>
