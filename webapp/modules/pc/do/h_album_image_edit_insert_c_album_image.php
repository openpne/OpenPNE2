<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムを修正
 */
class pc_do_h_album_image_edit_insert_c_album_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['image_description'];
        openpne_forward('pc', 'page', 'h_album_image_edit', $errors);
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $image_description = $requests['image_description'];
        $tmpfile_1 = $requests['tmpfile_1'];
        // ----------
        
        $filename = '';
        $c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $target_c_album_id = $c_album_image['c_album_id'];
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }

        // アルバム写真登録処理
        if ($tmpfile_1) {
            db_album_image_data_delete($c_album_image['image_filename']);
            $filename = image_insert_c_image_album4tmp("a_{$target_c_album_id}_1", $tmpfile_1);
            $filesize_1 = filesize($img_tmp_dir_path . basename($tmpfile_1));
        }
        
        // 写真データ一時ファイル削除
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        db_album_update_c_album_image($target_c_album_image_id,  $filename, $image_description, $filesize_1);

        // c_albumの更新時間UPDATE
        db_album_update_c_album_u_datetime($target_c_album_id);
        
        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);

    }
}

?>
