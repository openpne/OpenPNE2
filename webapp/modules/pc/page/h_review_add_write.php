<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_add_write extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $category_id = $requests['category_id'];
        $asin = $requests['asin'];
        $body = $requests['body'];
        $satisfaction_level = $requests['satisfaction_level'];
        $err_msg = $requests['err_msg'];
        // ----------

        // c_reviewをAmazonの最新データに更新
        $c_review_id = db_review_c_review_id4asin($asin);
        db_review_update_old_c_review($c_review_id);

        // 登録済みならh_review_editへ飛ばす
        $c_review_comment = db_review_add_write_c_review_comment4asin_c_member_id($asin, $u);
        if ($c_review_comment) {
            $_REQUEST['c_review_id'] = $c_review_comment['c_review_id'];
            $_REQUEST['asin'] = $asin;
            openpne_forward('pc', 'page', "h_review_edit");
            exit;
        }

        $this->set('inc_navi', fetch_inc_navi("h"));
        $satisfaction = array(
            "5" => "★★★★★ 5",
            "4" => "★★★★ 4",
            "3" => "★★★ 3",
            "2" => "★★ 2",
            "1" => "★ 1",
        );

        $this->set('category_id', $category_id);
        $this->set('asin', $asin);
        $this->set('body', $body);
        $this->set('satisfaction_level', $satisfaction_level);
        $this->set('satisfaction', $satisfaction);
        $this->set('err_msg', $err_msg);

        $product = db_review_write_product4asin($asin);
        if (!$product) {
            handle_kengen_error();
        }

        $this->set('product', $product);
        return 'success';
    }
}

?>
