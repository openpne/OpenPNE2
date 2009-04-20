<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 施設情報編集
class biz_do_s_edit_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$requests['name']) {
            $p = array('msg' => '施設名を入力してください',
                       'id'  => $requests['target_id']);
            openpne_redirect('biz', 'page_s_edit_shisetsu', $p);
        }

        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $id = $requests['target_id'];

        $filename = $requests['image_filename'];


        if ($_FILES['image_filename']['name']) {
            $image = biz_saveImage($_FILES['image_filename'], "s_".$sessid, $u, $filename);
            if (!$image['filename']) {
                if (!$image['up_size_chk_result']) {
                    $p = array('msg' => '画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください。',
                           'id'  => $id);
                    openpne_redirect('biz', 'page_s_edit_shisetsu', $p);
                } else {
                    $msg = util_image_get_upload_err_msg($image['up_size_chk_result']);
                    $p = array('msg' => $msg, 'id' => $id);
                    openpne_redirect('biz', 'page_s_edit_shisetsu', $p);
                }
            } else {
                biz_deleteImage($requests['image_filename'], $u);
            }
            $filename = $image['filename'];
        }

        t_image_clear_tmp(session_id());

        biz_editShisetsu($id, $requests['name'], $filename, $requests['info']);

        $p = array('msg' => '施設を編集しました');
        openpne_redirect('biz', 'page_s_list', $p);
    }
}

?>
