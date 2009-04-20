<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムを追加する
 */
class pc_do_h_album_add_insert_c_album extends OpenPNE_Action
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
        $tmpfile = $requests['tmpfile'];
        // ----------

        // 画像アップロード可能サイズチェック
        if ($tmpfile) {
            $filesize = util_image_get_c_tmp_filesize4filename("a_{$c_album_id}_1", $tmpfile);
            $result = util_image_check_add_image_upload($filesize, $u, 'other');
            if ($result) {
                $_REQUEST['err_msg'] = util_image_get_upload_err_msg($result);
                openpne_forward('pc', 'page', "h_album_add");
                exit;
            }
        }

        $c_member_id = $u;
        $c_album_id = db_album_insert_c_album($c_member_id, $subject, $description, $public_flag);

        if ($tmpfile) {
            $filename = image_insert_c_image4tmp("a_{$c_album_id}_1", $tmpfile, $u, 'other');

            $sessid = session_id();
            t_image_clear_tmp($sessid);

            //アルバムの表紙に写真ファイル名を登録
            db_album_update_c_album_album_cover_image($c_album_id,$filename);
        }

        $p = array('target_c_album_id' => $c_album_id);
        openpne_redirect('pc', 'page_h_album_image_add', $p);
    }
}

?>
