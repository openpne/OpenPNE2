<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * プロフィール画像の削除
 */
class pc_do_h_config_image_delete_c_member_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $img_num = $requests['img_num'];
        // ----------

        //--- 権限チェック
        //必要なし

        //---


        $c_member = db_member_c_member4c_member_id($u);
        db_image_data_delete($c_member['image_filename_'.$img_num], $u);
        db_member_delete_c_member_image_new($u, $img_num);

        if ($c_member['image_filename'] == $c_member['image_filename_'.$img_num]) {
            db_member_change_c_member_main_image($u, 1);
        }

        openpne_redirect('pc', 'page_h_config_image');
    }
}

?>
