<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['subject'];
        $_REQUEST['msg2'] = $errors['body'];
        $_REQUEST['msg3'] = $errors['public_flag'];
        if (OPENPNE_USE_DIARY_COMMENT && is_null($_REQUEST['is_comment_input'])) {
            $_REQUEST['is_comment_input'] = 0;
        }
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
        $category = $requests['category'];
        $is_comment_input = $requests['is_comment_input'];
        // ----------

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
                    openpne_forward('pc', 'page', 'h_diary_add');
                    exit;
                } else {
                    $filesize += $image['size'];
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "d_{$key}", $image['format']);
                }
            }
        }

        $category_list = array_unique(preg_split('/\s+/', $category));
        if (count($category_list) > 5) {
            $_REQUEST['msg'] = 'カテゴリは5つまでしか指定できません';
            openpne_forward('pc', 'page', 'h_diary_add');
            exit;
        }
        foreach ($category_list as $value) {
            if (mb_strwidth($value) > 20) {
                $_REQUEST['msg'] = 'カテゴリはひとつにつき全角10文字（半角20文字）以内で入力してください';
                openpne_forward('pc', 'page', 'h_diary_add');
                exit;
            }
        }

        // 画像アップロード可能サイズチェック
        if ($filesize) {
            $result = util_image_check_add_image_upload($filesize, $u, 'diary');
            if ($result) {
                if ($result == 2) {
                    $result = 3;
                }
                $msg = util_image_get_upload_err_msg($result);
                $_REQUEST['msg'] = $msg;
                openpne_forward('pc', 'page', 'h_diary_add');
                exit;
            }
        }

        $this->set('inc_navi', fetch_inc_navi('h'));

        //プロフィール
        $this->set("member", db_member_c_member4c_member_id($u));

        $form_val = array(
            "subject" => $subject,
            "body" => $body,
            "public_flag" => $public_flag,
            "upfile_1" => $_FILES['upfile_1'],
            "upfile_2" => $_FILES['upfile_2'],
            "upfile_3" => $_FILES['upfile_3'],
            "tmpfile_1" => $tmpfiles[1],
            "tmpfile_2" => $tmpfiles[2],
            "tmpfile_3" => $tmpfiles[3],
            "category" => join(" ", $category_list),
            "is_comment_input" => $is_comment_input,
        );
        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
