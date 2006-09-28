<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
            client_redirect_absolute('?m=biz&a=page_h_biz_group_edit&m=biz&msg='.urlencode('グループ名を登録してください。').'&target_id='.$id);
            exit();
        }

        $filename = $requests['image_filename'];

        if ($_FILES['image_filename']['name']) {
            $filename = biz_saveImage($_FILES['image_filename'], "g_".$sessid);
            if (!$filename) {
                $filename = $requests['image_filename'];
                client_redirect_absolute('?m=biz&a=page_h_biz_group_edit&msg='.urlencode('画像は300KB以内のGIF・JPEG・PNGにしてください。').'&m=biz&target_id='.$id);
                exit();
            }
        }
        t_image_clear_tmp(session_id());

        biz_editGroup($id, $requests['name'], $u, $requests['info'], $filename, $requests['member_list']);

        client_redirect_absolute("?m=biz&a=page_g_home&target_c_commu_id=".$id.'&msg='.urlencode('グループを編集しました'));


    }
}

?>
