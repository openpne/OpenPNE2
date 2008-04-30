<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_member_review_add_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $c_review_id = $requests['c_review_id'];
        // ----------

        //--- 権限チェック
        //コミュニティメンバー
        if (!db_commu_is_c_commu_member($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        if (!$c_review_id) {
            $_REQUEST['target_c_commu_id'] = $c_commu_id;
            openpne_forward('pc', 'page', "c_member_review_add");
            exit();
        }

        $c_member_review = db_review_c_member_review_add_confirm_c_member_review4c_review_id($c_review_id, $u);
        if (!$c_member_review) {
            handle_kengen_error();
        }

        $this->set('c_member_review', $c_member_review);
        $this->set('c_commu', db_commu_c_commu4c_commu_id($c_commu_id));
        $this->set('c_review_id', $c_review_id);

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));
        return 'success';
    }
}

?>
