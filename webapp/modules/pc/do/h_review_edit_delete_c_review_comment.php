<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_review_edit_delete_c_review_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_review_comment_id = $requests['c_review_comment_id'];
        // ----------

        //--- 権限チェック
        //レビューコメント作者

        if (!db_review_edit_c_review_comment4c_review_comment_id_c_member_id($c_review_comment_id, $u)) {
            handle_kengen_error();
        }
        //---

        $c_review_id = db_review_common_c_review_id4c_review_comment_id($c_review_comment_id);

        do_h_review_edit_delete_c_review_comment($c_review_comment_id);

        //コメント件数が0件になった場合は
        // c_review / c_review_clip / c_commu_review を削除する
        if (db_review_count_c_review_comment4c_review_id($c_review_id) === 0) {
            do_delete_c_review4c_review_id($c_review_id);
        }

        $p = array('c_member_id' => $u);
        openpne_redirect('pc', 'page_fh_review_list_member', $p);
    }
}

?>
