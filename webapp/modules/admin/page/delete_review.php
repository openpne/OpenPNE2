<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_review extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_review_comment_id = $requests['target_c_review_comment_id'];

        $v = array();
        $review = db_review_edit_c_review_comment4c_review_comment_id($target_c_review_comment_id);

        if (!$review) {
            admin_client_redirect('review_list', '指定されたレビューは存在しません');
        }

        $review['c_review'] = db_review_list_product_c_review4c_review_id($review['c_review_id']);
        $member = db_member_c_member4c_member_id($review['c_member_id']);
        $review['c_member'] = $member;
        $this->set('review', $review);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
