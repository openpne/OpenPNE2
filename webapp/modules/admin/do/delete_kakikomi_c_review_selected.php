<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(レビュー削除)
class admin_do_delete_kakikomi_c_review_selected extends OpenPNE_Action
{
    function execute($requests)
    {
        $id_ary = split(":", $requests['target_c_review_comment_ids']);

        foreach ($id_ary as $id) {
            $review = db_review_edit_c_review_comment4c_review_comment_id($id);

            if (!$review) {
                admin_client_redirect('review_list', '指定されたレビューは存在しません');
            }
        }

        foreach ($id_ary as $id) {
            do_h_review_edit_delete_c_review_comment($id);
        }

        admin_client_redirect('review_list', 'レビューを削除しました');
    }
}

?>
