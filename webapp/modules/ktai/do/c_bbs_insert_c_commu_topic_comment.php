<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * トピックコメント書き込み
 */
class ktai_do_c_bbs_insert_c_commu_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        
        //コミュニティ参加者

        $c_commu_topic = db_commu_c_commu_topic4c_commu_topic_id($target_c_commu_topic_id);
        if ($c_commu_topic['event_flag']) {
            $c_event_member_count = db_commu_count_c_event_member_list4c_commu_topic_id($target_c_commu_topic_id);
        }
        $c_commu_id = $c_commu_topic['c_commu_id'];
        $c_commu = db_commu_c_commu4c_commu_id($c_commu_topic['c_commu_id']);
       
        switch ($c_commu['is_comment']) {
            case 'public' :
                //誰でもコメント可能
                break;
            case 'member' :
                $status = db_common_commu_status($u, $c_commu_id);
                if (!$status['is_commu_member']) {
                    handle_kengen_error();
                }
                break;
        }
        //---

        if (is_null($body) || $body === '') {  //bodyが無い時のエラー処理
            $p = array(
                'target_c_commu_topic_id' => $target_c_commu_topic_id,
                'msg' => 1,
            );
            openpne_redirect('ktai', 'page_c_bbs', $p);
        }

        if ($requests['join_event'] || $requests['cancel_event']) {
            if (!db_commu_is_event_join_date($target_c_commu_topic_id)) {
                handle_kengen_error();
            }
        }

        $insert_id = db_commu_insert_c_commu_topic_comment_2($u, $target_c_commu_topic_id, $body);

        //イベントのメンバーに追加
        if ($requests['join_event']) {
            if ($c_commu_topic['capacity'] && $c_commu_topic['capacity'] <= $c_event_member_count) {
                $p = array(
                    'target_c_commu_topic_id' => $target_c_commu_topic_id,
                    'msg' => 45,
                );
                openpne_redirect('ktai', 'page_c_bbs', $p);
            } else {
                db_commu_insert_c_event_member($target_c_commu_topic_id, $u);
            }
        } elseif ($requests['cancel_event']) {
            db_commu_delete_c_event_member($target_c_commu_topic_id, $u);
        }

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($insert_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($insert_id, $u);

        if (OPENPNE_USE_POINT_RANK) {
            //トピック・イベントにコメントした人にポイント付与
            $point = db_action_get_point4c_action_id(11);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_commu_topic_id' => $target_c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}

?>
