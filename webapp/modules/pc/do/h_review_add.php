<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_review_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $category_id = $requests['category_id'];
        $asin = $requests['asin'];
        $body = $requests['body'];
        $satisfaction_level = $requests['satisfaction_level'];
        // ----------

        $c_review_comment = db_review_add_write_c_review_comment4asin_c_member_id($asin, $u);
        if ($c_review_comment) {
            $p = array('c_review_id' => $c_review_comment['c_review_id']);
            openpne_redirect('pc', 'page_h_review_list_product', $p);
        }
        $product = db_review_write_product4asin($asin);
        if (!$product) {
            handle_kengen_error();
        }

        //c_reviewへ登録
        $c_review_id = do_c_review_add_insert_c_review($product, $category_id);

        //c_review_commentへ登録
        if ($c_review_id) {
            do_c_review_add_insert_c_review_comment($c_review_id, $u, $body, $satisfaction_level);
        }

        if (OPENPNE_USE_POINT_RANK) {
            //レビューを書いた人にポイント付与
            $point = db_action_get_point4c_action_id(6);
            db_point_add_point($u, $point);
        }

        $p = array('c_review_id' => $c_review_id);
        openpne_redirect('pc', 'page_h_review_list_product', $p);
    }
}

?>
