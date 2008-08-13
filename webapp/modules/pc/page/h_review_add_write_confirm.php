<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_add_write_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'h_review_add_write', $errors);
        exit;
    }

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

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('category_id', $category_id);
        $this->set('asin', $asin);
        $this->set('body', $body);
        $this->set('satisfaction_level', $satisfaction_level);

        return 'success';
    }
}

?>
