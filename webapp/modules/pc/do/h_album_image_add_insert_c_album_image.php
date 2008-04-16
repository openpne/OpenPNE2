<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムに画像を登録
 */
class pc_do_h_album_image_add_insert_c_album_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['target_c_album_id'];
        openpne_forward('pc', 'page', 'h_album_image_add', $errors);
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
        $image_description1 = $requests['image_description1'];
        $image_description2 = $requests['image_description2'];
        $image_description3 = $requests['image_description3'];
        $image_description4 = $requests['image_description4'];
        $image_description5 = $requests['image_description5'];
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        $tmpfile_4 = $requests['tmpfile_4'];
        $tmpfile_5 = $requests['tmpfile_5'];
        // ----------

        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        if($tmpfile_1){
            $filename_1 = image_insert_c_image_album4tmp("a_{$target_c_album_id}_1", $tmpfile_1);
            $filesize_1 = filesize($img_tmp_dir_path . basename($tmpfile_1));
        }
        if($tmpfile_2){
            $filename_2 = image_insert_c_image_album4tmp("a_{$target_c_album_id}_2", $tmpfile_2);
            $filesize_2 = filesize($img_tmp_dir_path . basename($tmpfile_2));
        }
        if($tmpfile_3){
            $filename_3 = image_insert_c_image_album4tmp("a_{$target_c_album_id}_3", $tmpfile_3);
            $filesize_3 = filesize($img_tmp_dir_path . basename($tmpfile_3));
        }
        if($tmpfile_4){
            $filename_4 = image_insert_c_image_album4tmp("a_{$target_c_album_id}_4", $tmpfile_4);
            $filesize_4 = filesize($img_tmp_dir_path . basename($tmpfile_4));
        }
        if($tmpfile_5){
            $filename_5 = image_insert_c_image_album4tmp("a_{$target_c_album_id}_5", $tmpfile_5);
            $filesize_5 = filesize($img_tmp_dir_path . basename($tmpfile_5));
        }

        $sessid = session_id();
        t_image_clear_tmp($sessid);
        
        // 説明がなければ画像の名前を設定
        if(!$image_description1){
            $image_description1 = $filename_1;
        }
        if(!$image_description2){
            $image_description2 = $filename_2;
        }
        if(!$image_description3){
            $image_description3 = $filename_3;
        }
        if(!$image_description4){
            $image_description4 = $filename_4;
        }
        if(!$image_description5){
            $image_description5 = $filename_5;
        }
        
        $insert_data = array(
                            0=>array('image_description'=>$image_description1,'image_filename'=>$filename_1,'image_size'=>$filesize_1),
                            1=>array('image_description'=>$image_description2,'image_filename'=>$filename_2,'image_size'=>$filesize_2),
                            2=>array('image_description'=>$image_description3,'image_filename'=>$filename_3,'image_size'=>$filesize_3),
                            3=>array('image_description'=>$image_description4,'image_filename'=>$filename_4,'image_size'=>$filesize_4),
                            4=>array('image_description'=>$image_description5,'image_filename'=>$filename_5,'image_size'=>$filesize_5),
        );
        
        foreach($insert_data as $value){
            db_insert_c_album_image($target_c_album_id,$value[image_filename],$value[image_description],$value[image_size]);
        }
        
        //c_albumの更新日時UPDATE
        db_album_update_c_album_u_datetime($target_c_album_id);
        
        $p = array('target_c_album_id' => $target_c_album_id);

        openpne_redirect('pc', 'page_fh_album', $p);
    }
}

?>
