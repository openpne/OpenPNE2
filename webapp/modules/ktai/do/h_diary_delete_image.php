<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記画像を削除
 */
class ktai_do_h_diary_delete_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $img_num = $requests['img_num'];
        // ----------

        $c_member = db_member_c_member4c_member_id($u);
        if ($target_c_diary_id) {
            $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
            if ($c_diary['c_member_id'] != $u) {
                handle_kengen_error();
            }
        } else {
            handle_kengen_error();
        }

        $target_image_filename = '';
        switch ($img_num) {
        case '1' :
            $target_image_filename = $c_diary['image_filename_1'];
            break;
        case '2' :
            $target_image_filename = $c_diary['image_filename_2'];
            break;
        case '3' :
            $target_image_filename = $c_diary['image_filename_3'];
            break;
        }

        if (empty($target_image_filename)) {
            handle_kengen_error();
        }

        db_image_data_delete($target_image_filename, $u);
        db_diary_delete_c_diary_image($target_c_diary_id, $img_num);

        $p = array('target_c_diary_id' => $target_c_diary_id);
        openpne_redirect('ktai', 'page_h_diary_edit_image', $p);
    }
}

?>
