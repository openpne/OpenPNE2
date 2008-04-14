<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'h_album_image_add', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $subject = $requests['subject'];
        $image_description1 = $requests['image_description1'];
        $image_description2 = $requests['image_description2'];
        $image_description3 = $requests['image_description3'];
        $image_description4 = $requests['image_description4'];
        $image_description5 = $requests['image_description5'];
        // ----------

        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $upfiles = array(
            1 => $_FILES['upfile_1'],
            $_FILES['upfile_2'],
            $_FILES['upfile_3'],
            $_FILES['upfile_4'],
            $_FILES['upfile_5'],
        );
        $tmpfiles = array(
            1 => '',
            '',
            '',
            '',
            '',
        );
        
        //画像指定判定 1個も画像をしていない場合はワーニグ表示
        $file_no = false;
        foreach ($upfiles as $key => $upfile){
            if($upfile['name']) {
                $file_no = true;
                break;
            }
        }
        if(!$file_no){
            $_REQUEST['msg'] = '画像を指定してください';
            openpne_forward('pc', 'page', 'h_album_image_add');
            exit;
        }

        foreach ($upfiles as $key => $upfile) {
            if ($upfile['error'] !== UPLOAD_ERR_NO_FILE) {
                if (!($image = t_check_image($upfile))) {
                    $_REQUEST['msg'] = '画像は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
                    openpne_forward('pc', 'page', 'h_album_image_add');
                    exit;
                } else {
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "a_{$target_c_album_id}_{$key}", $image['format']);
                }
            }
        }

        $this->set('inc_navi', fetch_inc_navi('h'));

        $form_val = array(
            "target_c_album_id" => $target_c_album_id,
            "subject" => $subject,
            "upfile_1" => $_FILES['upfile_1'],
            "upfile_2" => $_FILES['upfile_2'],
            "upfile_3" => $_FILES['upfile_3'],
            "upfile_4" => $_FILES['upfile_4'],
            "upfile_5" => $_FILES['upfile_5'],
            "tmpfile_1" => $tmpfiles[1],
            "tmpfile_2" => $tmpfiles[2],
            "tmpfile_3" => $tmpfiles[3],
            "tmpfile_4" => $tmpfiles[4],
            "tmpfile_5" => $tmpfiles[5],
        );
        
        //ファイル画像を指定しているものだけコメントを設定
        foreach ($tmpfiles as $key => $tmpfile) {
            $name = "image_description{$key}";
            if($tmpfile){
                $form_val["$name"] = $$name;    
            }
        }

        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
