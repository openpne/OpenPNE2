<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メインプロフィール画像の変更
 */
class pc_do_h_config_image_change_main_c_member_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $img_num = $requests['img_num'];
        // ----------

        db_member_change_c_member_main_image($u, $img_num);

        openpne_redirect('pc', 'page_h_config_image');
    }
}

?>
