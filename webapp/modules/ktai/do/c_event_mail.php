<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_event_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $c_commu_id = $requests['c_commu_id'];
        $c_commu_topic_id = $requests['c_commu_topic_id'];
        $c_member_ids = $requests['c_member_ids'];
        $body = $requests['body'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック

        // イベント管理者・コミュニティ管理者(副管含む)のみ送信可能
        if (!db_commu_is_c_event_admin($c_commu_topic_id, $u)
            && !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }

        // 対象者に自分が含まれている
        if (in_array($u, $c_member_ids)) {
            handle_kengen_error();
        }
        //---

        //メッセージ送信
        list($msg_subject, $msg_body) =
            create_message_event_message($u, $body, $c_commu_topic_id);

        foreach ($c_member_ids as $key => $value) {
            db_message_send_message_event_message($u, $value, $msg_subject, $msg_body);
        }

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_event_mail_end', $p);
    }
}

?>
