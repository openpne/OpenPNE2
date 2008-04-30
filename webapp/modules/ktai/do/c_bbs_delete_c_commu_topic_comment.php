<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * トピックコメントを削除
 */
class ktai_do_c_bbs_delete_c_commu_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];


        // --- リクエスト変数
        $target_c_commu_topic_comment_id = $requests['target_c_commu_topic_comment_id'];
        // ----------
        $c_commu_topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id_2($target_c_commu_topic_comment_id);

        //--- 権限チェック
        //コミュニティ管理者 or コメント作成者

        $c_commu_topic = db_commu_c_commu_topic4c_commu_topic_id($c_commu_topic_comment['c_commu_topic_id']);
        $c_commu_id = $c_commu_topic['c_commu_id'];

        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_admin']
            && $c_commu_topic_comment['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        db_commu_delete_c_commu_topic_comment($target_c_commu_topic_comment_id);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_comment['c_commu_topic_id']);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}

?>
