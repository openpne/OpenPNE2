<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムを修正
 */
class pc_do_h_album_cover_edit_insert_c_album extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['description'];
        openpne_forward('pc', 'page', 'h_album_cover_edit', $errors);
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $subject = $requests['subject'];
        $description = $requests['description'];
        $public_flag = $requests['public_flag'];
        $tmpfile_1 = $requests['tmpfile_1'];
        // ----------

        //--- 権限チェック
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        $filename_1  = '';
        $c_album_cover = $c_album['album_cover_image'];

        if ($tmpfile_1) {
            db_album_image_data_delete($c_album_cover);
            $filename_1 = image_insert_c_image4tmp("a_{$target_c_album_id}_1", $tmpfile_1);
        }
        
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        //アルバムデータの変更
        db_album_update_c_album_cover($target_c_album_id, $subject,$description,$filename_1,$public_flag);

        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);
    }
}

?>
