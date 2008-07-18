<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_review_edit_update_c_review_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_review_comment_id = $requests['c_review_comment_id'];
        $body = $requests['body'];
        $satisfaction_level = $requests['satisfaction_level'];
        // ----------

        //--- 権限チェック
        //レビューコメント作成者

        if (!db_review_edit_c_review_comment4c_review_comment_id_c_member_id($c_review_comment_id, $u)) {
            handle_kengen_error();
        }
        //---

        if (is_null($body) || $body === '') {
            $err_msg[] = "レビューを入力してください";
        }
        if (!$satisfaction_level) {
            $err_msg[] = "満足度を入力してください";
        }

        if ($err_msg) {
            $c_review = db_review_edit_c_review4c_review_comment_id($c_review_comment_id);
            $_REQUEST['asin'] = $c_review['asin'];
            $_REQUEST['err_msg'] = $err_msg;

            openpne_forward('pc', 'page', "h_review_edit");
            exit;
        }


        do_h_review_edit_update_c_review_comment($c_review_comment_id, $body, $satisfaction_level);

        openpne_redirect('pc', 'page_fh_review_list_member');
    }
}

?>
