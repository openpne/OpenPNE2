<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_add_insert_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $tmpfile1 = $requests['image_filename1_tmpfile'];
        $tmpfile2 = $requests['image_filename2_tmpfile'];
        $tmpfile3 = $requests['image_filename3_tmpfile'];
        // ----------

        //--- 権限チェック
        //コミュニティ参加者

        $event = p_c_event_add_confirm_event4request();

        $status = db_common_commu_status($u, $event['c_commu_id']);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        //---


        if ($event['invite_period_year'].$event['invite_period_month'].$event['invite_period_day']!="") {
            $invite_period = $event['invite_period_year']."-".$event['invite_period_month']."-".$event['invite_period_day'];
        } else {
            $invite_period = "";
        }

        $insert_c_commu_topic = array(
            "name"              => $event['title'],
            "c_commu_id"        => $event['c_commu_id'],
            "c_member_id"       => $u,
            "open_date"         => $event['open_date_year']."-".$event['open_date_month']."-".$event['open_date_day'],
            "open_date_comment" => $event['open_date_comment'],
            "open_pref_id"      => $event['open_pref_id'],
            "open_pref_comment" => $event['open_pref_comment'],
            "invite_period"     => $invite_period,
            "event_flag"        => 1,
        );
        $c_commu_topic_id = do_c_event_add_insert_c_commu_topic($insert_c_commu_topic);

        if ($tmpfile1) {
            $filename1 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_1", $tmpfile1);
        }
        if ($tmpfile2) {
            $filename2 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_2", $tmpfile2);
        }
        if ($tmpfile3) {
            $filename3 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_3", $tmpfile3);
        }
        t_image_clear_tmp(session_id());

        $insert_c_commu_topic_comment = array(
            "c_commu_id"       => $event['c_commu_id'],
            "c_member_id"      => $u,
            "body"             => $event['detail'],
            "number"           => 0,
            "c_commu_topic_id" => $c_commu_topic_id,
            "image_filename1"  => !empty($filename1) ? $filename1 : '',
            "image_filename2"  => !empty($filename2) ? $filename2 : '',
            "image_filename3"  => !empty($filename3) ? $filename3 : '',
        );
        $insert_id = do_c_event_add_insert_c_commu_topic_comment($insert_c_commu_topic_comment);

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($insert_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($insert_id, $u);

        do_c_event_add_insert_c_event_member_as_admin($c_commu_topic_id, $u);

        $p = array('target_c_commu_id' => $event['c_commu_id']);
        openpne_redirect('pc', 'page_c_event_list', $p);
    }
}

?>
