<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティおすすめレビューの削除
 */
class pc_do_c_member_review_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $c_commu_review_id = $requests['target_c_commu_review_id'];
        // ----------

        //--- 権限チェック
        //管理者 or レビュー登録者
        $c_commu_review = db_review_get_c_commu_review_one4c_commu_review_id($c_commu_review_id);

        if (!db_commu_is_c_commu_admin($c_commu_id, $u)
         && $c_commu_review['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        db_review_delete_c_commu_review4c_commu_review_id($c_commu_review_id);

        $p = array('target_c_commu_id' => $c_commu_id);
        openpne_redirect('pc', 'page_c_member_review', $p);
    }
}

?>
