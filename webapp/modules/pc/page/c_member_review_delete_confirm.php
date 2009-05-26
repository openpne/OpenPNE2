<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_member_review_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $c_commu_review_id = $requests['target_c_commu_review_id'];
        // ----------

        if (!$c_commu_review_id) {
            $_REQUEST['target_c_commu_id'] = $c_commu_id;
            openpne_forward('pc', 'page', "c_member_review");
            exit();
        }

        //--- 権限チェック
        //管理者 or レビュー登録者
        $c_commu_review = db_review_get_c_commu_review_one4c_commu_review_id($c_commu_review_id);

        if (!db_commu_is_c_commu_admin($c_commu_id, $u)
         && $c_commu_review['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        $this->set('c_commu_id', $c_commu_id);
        $this->set('c_commu_review_id', $c_commu_review_id);

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));
        return 'success';
    }
}

?>
