<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_join_c_commu_event extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------

        //-- 権限チェック
        $err_msg = array();
        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        $status = db_common_commu_status($u, $c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }

        if (!$c_topic['event_flag']) {
            handle_kengen_error();
        }

        if (db_commu_is_writable_c_commu_topic_comment4c_commu_topic_id($c_commu_topic_id)) {
            handle_kengen_error();
        }

        $is_c_event_member = db_commu_is_c_event_member($c_commu_topic_id, $u);
        if ($is_c_event_member) {
            $err_msg[] = 'すでにイベントに参加しています。';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', 'c_event_detail');
            exit;
        }

        if (!db_commu_is_event_join_capacity($c_commu_topic_id)) {
            $err_msg[] = 'イベントの参加者数制限を超えています';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_event_detail");
            exit;
        }

        if (!db_commu_is_event_join_date($c_commu_topic_id)) {
            $err_msg[] = 'イベントの募集期限が過ぎています';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_event_detail");
            exit;
        }

        db_commu_insert_c_event_member($c_commu_topic_id, $u);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_event_detail', $p);
    }
}

?>
