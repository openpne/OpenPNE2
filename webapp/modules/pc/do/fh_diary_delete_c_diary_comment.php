<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */


/**
 * 日記コメント削除
 */
class pc_do_fh_diary_delete_c_diary_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_diary_comment_id =  $_REQUEST['target_c_diary_comment_id'];

        foreach ($target_c_diary_comment_id as $val) {

            //--- 権限チェック
            //日記作成者 or コメント作成者

            $target_c_diary_comment = _do_c_diary_comment4c_diary_comment_id($val);
            $target_c_diary_id = $target_c_diary_comment['c_diary_id'];

            $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
            if ($c_diary['c_member_id'] != $u
                && $target_c_diary_comment['c_member_id'] != $u) {

                handle_kengen_error();
            }
            //---

            //コメント削除実行
            db_diary_delete_c_diary_comment($val, $u);

            //コメント記入履歴削除実行
            db_diary_delete_c_diary_comment_log($target_c_diary_comment['c_member_id'], $target_c_diary_id);
        }

        $p = array('target_c_diary_id' => $target_c_diary_id);
        openpne_redirect('pc', 'page_fh_diary', $p);
    }
}

?>
