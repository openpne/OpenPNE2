<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記削除
 */
class pc_do_fh_diary_delete_c_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        // ----------

        //--- 権限チェック
        //日記作成者

        $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
        if ($c_diary['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        db_diary_delete_c_diary($target_c_diary_id);

        $p = array('target_c_member_id' => $u);
        openpne_redirect('pc', 'page_fh_diary_list', $p);
    }
}

?>
