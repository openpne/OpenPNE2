<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_review_clip_add_insert_c_review_clip extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_review_id = $requests['c_review_id'];
        // ----------

        //--- 権限チェック
        //レビューコメント作者以外

        if (db_review_clip_add_c_review_id4c_review_id_c_member_id($c_review_id, $u)) {
            openpne_redirect('pc', 'page_h_review_clip_list');
        }
        //---

        $c_review = db_review_list_product_c_review4c_review_id($c_review_id);
        if (!$c_review) {
            handle_kengen_error();
        }

        do_h_review_clip_add_insert_c_review_clip($c_review_id, $u);

        openpne_redirect('pc', 'page_h_review_clip_list');
    }
}

?>
