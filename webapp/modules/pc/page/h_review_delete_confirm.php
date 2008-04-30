<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_review_comment_id = $requests['c_review_comment_id'];
        $asin = $requests['asin'];
        // ----------

        $c_review_comment = db_review_add_write_c_review_comment4asin_c_member_id($asin, $u);
        if (!$c_review_comment) {
            handle_kengen_error();
        }

        $product = db_review_write_product4asin($asin);
        if (!$product) {
            handle_kengen_error();
        }

        $this->set('inc_navi', fetch_inc_navi("h"));
        $this->set('c_review_comment_id', $c_review_comment_id);
        $this->set('asin', $asin);

        return 'success';
    }
}

?>
