<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//施設情報修正

class admin_biz_do_biz_admin_edit_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$requests['name']) {
            admin_biz_client_redirect('biz_shisetsu_list', '施設名を入力してください。');
            exit();
        }

        if ($requests['image_filename']) {
            $filename = $requests['image_filename'];
        } else {
            $filename = '';
        }

        if ($_FILES['image_filename']['size']) {
            $filename = biz_saveImage($_FILES['image_filename'], "s_".$sessid);
            if (!$filename) {
                $filename = $requests['image_filename'];
                admin_biz_client_redirect('biz_shisetsu_list', '画像は300KB以内のGIF・JPEG・PNGにしてください。');
                exit();
            }

            //変更前の画像を削除
            $shisetsu = biz_getShisetsuData($requests['biz_shisetsu_id']);
            biz_deleteImage($shisetsu['image_filename']);
        }
        t_image_clear_tmp(session_id());


        biz_editShisetsu($requests['biz_shisetsu_id'], $requests['name'], $filename);

        admin_biz_client_redirect('biz_shisetsu_list', "施設を編集しました。");
    }
}

?>
