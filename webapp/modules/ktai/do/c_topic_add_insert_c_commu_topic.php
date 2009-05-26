<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_topic_add_insert_c_commu_topic extends OpenPNE_Action
{
    function handleError($errors)
    {
        ktai_display_error($errors);
    }

    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $title  = $requests['title'];
        $body = $requests['body'];
        // ----------

        //--- 権限チェック
        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
  
        switch ($c_commu['is_topic']) {
            case 'public' :
                //誰でも作成可能
                break;
            case 'member' :
                //コミュニティ参加者
                $status = db_common_commu_status($u, $c_commu_id);
                if (!$status['is_commu_member']) {
                    handle_kengen_error();
                }
                break;
            case 'admin_only' : 
                //トピック作成権限チェック
                if (!db_commu_is_c_commu_admin($c_commu_id, $u)) {
                    ktai_display_error("トピックは管理者だけが作成できます");
                }
                break;
        }
        //---

        $insert_c_commu_topic = array(
            "name"        => $title,
            "c_commu_id"  => $c_commu_id,
            "c_member_id" => $u,
            "event_flag"  => 0
        );
        $c_commu_topic_id = db_commu_insert_c_commu_topic($insert_c_commu_topic);

        $insert_c_commu_topic_comment = array(
            "c_commu_id"  => $c_commu_id,
            "c_member_id" => $u,
            "body"        => $body,
            "number"      => 0,
            "c_commu_topic_id" => $c_commu_topic_id,
            "image_filename1" =>"",
            "image_filename2" =>"",
            "image_filename3" =>"",
        );
        $insert_id = db_commu_insert_c_commu_topic_comment_3($insert_c_commu_topic_comment);

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($insert_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($insert_id, $u);

        if (OPENPNE_USE_POINT_RANK) {
            //トピックを作成した人にポイント付与
            $point = db_action_get_point4c_action_id(9);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}

?>
