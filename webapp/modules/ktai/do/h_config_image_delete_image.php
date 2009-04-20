<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_image_delete_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        $img_num = $requests['img_num'];

        $c_member = db_member_c_member4c_member_id($u);
        if (!$img_num) {
            if ($c_member['image_filename'] == $c_member['image_filename_1']) {
                $img_num = 1;
            } elseif ($c_member['image_filename'] == $c_member['image_filename_2']) {
                $img_num = 2;
            } elseif ($c_member['image_filename'] == $c_member['image_filename_3']) {
                $img_num = 3;
            }
        }

        db_image_data_delete($c_member['image_filename_'.$img_num], $u);
        db_member_delete_c_member_image_new($u, $img_num);

        if ($c_member['image_filename'] == $c_member['image_filename_'.$img_num]) {
            db_member_change_c_member_main_image($u, 1);
        }

        openpne_redirect('ktai', 'page_h_config_image');
    }
}

?>
