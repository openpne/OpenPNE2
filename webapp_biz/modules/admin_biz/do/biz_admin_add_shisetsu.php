<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 施設情報追加
class admin_biz_do_biz_admin_add_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$requests['name']) {
            admin_biz_client_redirect('biz_shisetsu_list', '施設名を入力してください。');
            exit();
        }
        $sessid = session_id();
        $filename = '';
        if ($_FILES['image_filename']['name']) {
            $filename = biz_saveImage($_FILES['image_filename'], "s_".$sessid);
            if (!$filename) {
                admin_biz_client_redirect('biz_shisetsu_list', '画像は300KB以内のGIF・JPEG・PNGにしてください。');
                exit();
            }
        }
        t_image_clear_tmp(session_id());

        biz_addShisetsu($requests['name'], $filename);

        admin_biz_client_redirect('biz_shisetsu_list', "施設を追加しました。");
    }
}

?>
