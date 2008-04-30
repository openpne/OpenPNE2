<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_review_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $asin = $requests['asin'];
        $err_msg = $requests['err_msg'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('err_msg', $err_msg);
        $satisfaction = array(
            "5" => "★★★★★ 5",
            "4" => "★★★★ 4",
            "3" => "★★★ 3",
            "2" => "★★ 2",
            "1" => "★ 1",
        );
        $this->set('satisfaction', $satisfaction);

        $c_review_comment = db_review_add_write_c_review_comment4asin_c_member_id($asin, $u);
        if (!$c_review_comment) {
            handle_kengen_error();
        }

        $this->set('c_review_comment', $c_review_comment);

        return 'success';
    }
}

?>
