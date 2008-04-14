<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記を修正
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
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $image_description = $requests['image_description'];
        $tmpfile_1 = $requests['tmpfile_1'];
        // ----------
        
        //アルバム画像登録処理
        /*
         * ※tmpfile_1にファイル画像がある場合
         * 1.既存の変更する画像データを削除
         *   削除対象テーブル c_image_album
         * 2.tmpfile_1の画像データ登録
         *   登録対象テーブル c_image_album
         * 3.登録した画像ファイル名をc_album_imageデータに更新
         */
        $filename = '';
        $c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        if($tmpfile_1){
            db_album_image_data_delete($c_album_image['image_filename']);
            $filename = image_insert_c_image_album4tmp("a_{$target_c_album_id}_1", $tmpfile_1);
            $filesize_1 = filesize($img_tmp_dir_path . basename($tmpfile_1));
        }
        
        //画像データ一時ファイル削除
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        db_album_update_c_album_image($target_c_album_image_id,  $filename, $image_description,$filesize_1);

        //c_albumの更新時間UPDATE
        db_album_update_c_album_u_datetime($target_c_album_id);
        
        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);

    }
}

?>
