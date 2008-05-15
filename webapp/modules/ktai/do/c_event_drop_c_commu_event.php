<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_event_drop_c_commu_event extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------

        //--- 権限チェック
        $c_commu_topic = db_commu_c_commu_topic4c_commu_topic_id($c_commu_topic_id);
        $c_commu_id = $c_commu_topic['c_commu_id'];

        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        if (!$c_commu_topic['event_flag']) {
            handle_kengen_error();
        }
        if (db_commu_is_writable_c_commu_topic_comment4c_commu_topic_id($c_commu_topic_id)) {
            handle_kengen_error();
        }

        $is_c_event_member = db_commu_is_c_event_member($c_commu_topic_id, $u);
        if (!$is_c_event_member) {
            ktai_display_error('イベントに参加していません');
        }

        if (!db_commu_is_event_join_date($c_commu_topic_id)) {
            ktai_display_error('イベントの募集期限が過ぎています');
        }

        db_commu_delete_c_event_member($c_commu_topic_id, $u);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}

?>
