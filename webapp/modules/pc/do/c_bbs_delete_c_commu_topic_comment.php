<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コメント削除
 */
class pc_do_c_bbs_delete_c_commu_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_commu_topic_comment_id = $requests['target_c_commu_topic_comment_id'];

        //--- 権限チェック
        //コミュニティ管理者 or コミュニティ参加者

        $c_commu_topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id_2($target_c_commu_topic_comment_id);

        $c_commu_topic = db_commu_c_commu_topic4c_commu_topic_id($c_commu_topic_comment['c_commu_topic_id']);
        $c_commu_id = $c_commu_topic['c_commu_id'];

        $status = db_common_commu_status($u, $c_commu_id);
        if ($c_commu_topic_comment['number']=="0") {
            handle_kengen_error();
        }
        if (!$status['is_commu_admin']
            && $c_commu_topic_comment['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        db_commu_delete_c_commu_topic_comment($target_c_commu_topic_comment_id);

        if ($c_commu_topic['event_flag']) {
            $action = 'page_c_event_detail';
        } else {
            $action = 'page_c_topic_detail';
        }
        $p = array('target_c_commu_topic_id' => $c_commu_topic_comment['c_commu_topic_id']);
        openpne_redirect('pc', $action, $p);
    }
}

?>
