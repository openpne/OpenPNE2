<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_topic_add_insert_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $c_commu_id = $requests['c_commu_id'];
        $title  = $requests['title'];
        $image_filename1_tmpfile = $requests['image_filename1_tmpfile'];
        $image_filename2_tmpfile = $requests['image_filename2_tmpfile'];
        $image_filename3_tmpfile = $requests['image_filename3_tmpfile'];
        $body = $requests['body'];

        //---権限チェック
        //コミュニティ参加者

        $status = db_common_commu_status($u, $c_commu_id);

        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        //---


        $insert_c_commu_topic = array(
            "name"        => $title,
            "c_commu_id"  => $c_commu_id,
            "c_member_id" => $u,
            "event_flag"  => 0
        );
        $c_commu_topic_id = do_c_event_add_insert_c_commu_topic($insert_c_commu_topic);

        if ($image_filename1_tmpfile) {
            $filename1 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_1", $image_filename1_tmpfile);
        }
        if ($image_filename2_tmpfile) {
            $filename2 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_2", $image_filename2_tmpfile);
        }
        if ($image_filename3_tmpfile) {
            $filename3 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_3", $image_filename3_tmpfile);
        }
        t_image_clear_tmp(session_id());

        $insert_c_commu_topic_comment = array(
            "c_commu_id"       => $c_commu_id,
            "c_member_id"      => $u,
            "body"             => $body,
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

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_topic_detail', $p);
    }
}

?>
