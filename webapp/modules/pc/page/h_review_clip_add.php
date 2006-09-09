<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_clip_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_review_id = $requests['c_review_id'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('c_review', p_h_review_list_product_c_review4c_review_id($c_review_id));
        return 'success';
    }
}

?>
