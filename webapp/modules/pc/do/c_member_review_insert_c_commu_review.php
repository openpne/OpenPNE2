<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_member_review_insert_c_commu_review extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $c_review_id = $requests['c_review_id'];
        // ----------

        //--- 権限チェック
        //レビューコメント作者 かつ コミュニティ参加者

        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        //---

        foreach ($c_review_id as $value) {
            if (!do_c_member_review_c_review_id4c_review_id_c_member_id($value, $u, $c_commu_id)) {
                do_c_member_review_insert_c_commu_review($value, $u, $c_commu_id);
            }
        }

        $p = array('target_c_commu_id' => $c_commu_id);
        openpne_redirect('pc', 'page_c_member_review', $p);
    }
}

?>
