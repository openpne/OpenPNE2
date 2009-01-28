<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_image_change_main_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        $img_num = $requests['img_num'];

        //メイン画像変更
        db_member_change_c_member_main_image($u, $img_num);

        openpne_redirect('ktai', 'page_h_config_image');
    }
}

?>
