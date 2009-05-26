<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_group_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $member_list = serialize($requests['member_list']);

        if (!$requests['name']) {
            $p = array('msg' => 'グループ名を登録してください。', 'name' => $requests['name'],
                'info' => $requests['info'], 'memberlist' => $member_list);
            openpne_redirect('biz', 'page_h_biz_group_add', $p);
            exit();
        }

        $filename = '';
        if ($_FILES['image_filename']['name']) {
            $image = biz_saveImage($_FILES['image_filename'], "g_".$sessid, $u);

            if (!$image['filename']) {
                $filename = $requests['image_filename'];
                if (!$image['up_size_chk_result']) {
                    $p = array('msg' => '画像は' . IMAGE_MAX_FILESIZE . 'KB以内のGIF・JPEG・PNGにしてください。', 'id' => $id);
                    openpne_redirect('biz', 'page_h_biz_group_add', $p);
                    exit();
                } else {
                    $msg = util_image_get_upload_err_msg($image['up_size_chk_result']);
                    $p = array('msg' => $msg, 'id' => $id);
                    openpne_redirect('biz', 'page_h_biz_group_add', $p);
                    exit();
                }
            }
            $filename = $image['filename'];
        }
        t_image_clear_tmp(session_id());

        biz_insertGroup($requests['name'], $u, $requests['info'], $filename, $requests['member_list']);

        $p = array('target_c_commu_id' => biz_getGroupMax());
        openpne_redirect('biz', 'page_g_home', $p);
    }
}

?>
