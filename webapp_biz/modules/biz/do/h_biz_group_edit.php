<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//グループを編集
class biz_do_h_biz_group_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $id = $requests['target_id'];

        if (!$requests['name']) {
            $p = array('msg' => 'グループ名を登録してください。', 'target_id' => $id);
            openpne_redirect('biz', 'page_h_biz_group_edit', $p);
            exit();
        }

        $filename = $requests['image_filename'];

        if ($_FILES['image_filename']['name']) {
            $image = biz_saveImage($_FILES['image_filename'], "g_".$sessid, $u, $filename);

            if (!$image['filename']) {
                $filename = $requests['image_filename'];

                if (!$image['up_size_chk_result']) {
                    $p = array('msg' => '画像は'  . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください。', 'target_id' => $id);
                    openpne_redirect('biz', 'page_h_biz_group_edit', $p);
                    exit();
                } else {
                    $msg = util_image_get_upload_err_msg($image['up_size_chk_result']);
                    $p = array('msg' => $msg, 'target_id' => $id);
                    openpne_redirect('biz', 'page_h_biz_group_edit', $p);
                    exit();
                }
            } else {
                biz_deleteImage($requests['image_filename'], $u);
            }
            $filename = $image['filename'];
        }
        t_image_clear_tmp(session_id());

        biz_editGroup($id, $requests['name'], $u, $requests['info'], $filename, $requests['member_list']);

        $p = array('msg' => 'グループを編集しました。', 'target_c_commu_id' => $id);
        openpne_redirect('biz', 'page_g_home', $p);

    }
}

?>
