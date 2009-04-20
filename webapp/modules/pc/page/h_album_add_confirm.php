<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'h_album_add');
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $subject = $requests['subject'];
        $description = $requests['description'];
        $public_flag = $requests['public_flag'];
        // ----------
        $upfile_obj = $_FILES['image_filename'];

        //表紙の写真
        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $err_msg[] = '写真は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
            } else {
                // 画像アップロード可能サイズチェック
                $result = util_image_check_add_image_upload($image['size'], $u, 'other');
                if ($result) {
                    $err_msg[] = util_image_get_upload_err_msg($result);
                }
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "h_album_add");
            exit;
        }

        $this->set('inc_navi', fetch_inc_navi('h'));

        //写真をvar/tmpフォルダにコピー
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        if (file_exists($upfile_obj["tmp_name"])) {
            $tmpfile = t_image_save2tmp($upfile_obj, $sessid, "c");
        }

        $form_val = array(
            "subject" => $subject,
            "description" => $description,
            "public_flag" => $public_flag,
            'tmpfile'=>$tmpfile,
            'image_filename' => $upfile_obj['name'],
        );
        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
