<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_cover_edit_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
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
        $c_commu_id = $requests['target_c_commu_id'];
        // ----------
        
        //写真データ一時ファイル削除
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $upfiles = array(
            1 => $_FILES['upfile_1'],
        );
        $tmpfiles = array(
            1 => '',
        );

        foreach ($upfiles as $key => $upfile) {
            if ($upfile['error'] !== UPLOAD_ERR_NO_FILE) {
                if (!($image = t_check_image($upfile))) {
                    $_REQUEST['msg'] = '写真は'.IMAGE_MAX_FILESIZE.'KB以内のGIF・JPEG・PNGにしてください';
                    openpne_forward('pc', 'page', 'h_album_cover_edit');
                    exit;
                } else {
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "a_{$target_c_album_id}_{$key}", $image['format']);
                }
            }
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        $form_val = array(
            "target_c_album_id" => $target_c_album_id,
            "subject"=> $subject,
            "description" => $description,
            "public_flag"=> $public_flag,
            "upfile_1" => $_FILES['upfile_1'],
            "tmpfile_1" => $tmpfiles[1],
        );

        $this->set("form_val", $form_val);
        return 'success';
    }
}

?>
