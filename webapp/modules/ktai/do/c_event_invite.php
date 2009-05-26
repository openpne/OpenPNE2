<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_event_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $c_member_id = $requests['c_member_id'];
        $body = $requests['body'];
        // ----------
        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック

        // イベント閲覧権限がないと送信できない
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }

        // 自分が送信対象
        if ($u == $c_member_id) {
            handle_kengen_error();
        }
        //---

        list($msg_subject, $msg_body) =
            create_message_event_invite($u, $body, $c_commu_topic_id);

        db_message_send_message_event_invite($u, $c_member_id, $msg_subject, $msg_body);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}
?>
