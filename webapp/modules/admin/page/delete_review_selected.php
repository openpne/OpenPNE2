<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_delete_review_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $target_c_review_comment_ids = $requests['target_c_review_comment_ids'];

        // レビューが選択されていない場合はエラー
        if (!$target_c_review_comment_ids) {
            admin_client_redirect('review_list', "レビューが選択されていません");
        }

        $id_ary = split(":", $target_c_review_comment_ids);

        $v = array();

        $review_list = array();
        foreach ($id_ary as $id) {
            $review = db_review_edit_c_review_comment4c_review_comment_id($id);

            if (!$review) {
                admin_client_redirect('review_list', '指定されたレビューは存在しません');
            }

            $review['c_review'] = db_review_list_product_c_review4c_review_id($review['c_review_id']);
            $member = db_member_c_member4c_member_id($review['c_member_id']);
            $review['c_member'] = $member;

            array_push($review_list, $review);
        }
        $this->set('review_list', $review_list);
        $this->set('target_c_review_comment_ids', $target_c_review_comment_ids);

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
