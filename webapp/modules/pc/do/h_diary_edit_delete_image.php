<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_diary_edit_delete_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_diary_id = $requests['target_c_diary_id'];
        $del_img = $requests['del_img'];
        // ----------

        //--- 権限チェック
        //日記作成者

        $c_diary = db_diary_get_c_diary4id($c_diary_id);
        //日記を書いた人でないと消せない
        if ($c_diary['c_member_id'] != $u) {
            openpne_redirect('pc', 'page_h_home');
        }
        //---

        db_image_data_delete($c_diary['image_filename_'. $del_img], $u);
        db_diary_delete_c_diary_image($c_diary_id, $del_img);

        $p = array('target_c_diary_id' => $c_diary_id);
        openpne_redirect('pc', 'page_h_diary_edit', $p);
    }
}

?>
