<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_event_add_insert_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        //--- 権限チェック
        //コミュニティ参加者

        list($event, $errors) = p_c_event_add_confirm_event4request(true);
        $c_commu = db_commu_c_commu4c_commu_id2($event['c_commu_id']);

        switch ($c_commu['is_topic']) {
            case 'public' :
                //誰でも作成可能
                break;
            case 'member' :
                $status = db_common_commu_status($u, $event['c_commu_id']);
                if (!$status['is_commu_member']) {
                    handle_kengen_error();
                }
                break;
            case 'admin_only' :
                //トピック作成権限チェック
                if (!db_commu_is_c_commu_admin($event['c_commu_id'], $u)) {
                    ktai_display_error("イベントは管理者だけが作成できます");
                }
                break;
        }
        //---

        //--- エラーチェック
        $err_msg = $errors;

        if (!$event['open_date_month'] || !$event['open_date_day'] || !$event['open_date_year']) {
            $err_msg[] = "開催日時を入力してください";
        } elseif (!t_checkdate($event['open_date_month'], $event['open_date_day'], $event['open_date_year'])) {
            $err_msg[] = "開催日時は存在しません";
        } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year']) < mktime(0, 0, 0)) {
            $err_msg[] = "開催日時は過去に指定できません";
        }

        if ($event['invite_period_month'] . $event['invite_period_day'] . $event['invite_period_year'] != "") {
            if (!$event['invite_period_month'] || !$event['invite_period_day'] || !$event['invite_period_year']) {
                $err_msg[] = "募集期限は存在しません";
            } elseif (!t_checkdate($event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "募集期限は存在しません";
            } elseif (mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year']) < mktime(0, 0, 0)) {
                $err_msg[] = "募集期限は過去に指定できません";
            } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year'])
                      < mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "募集期限は開催日時より未来に指定できません";
            }
        }

        if ($err_msg) {
            $_REQUEST = $event;
            $_REQUEST['target_c_commu_id'] = $event['c_commu_id'];
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('ktai', 'page', "c_event_add");
            exit;
        }
        //---

        if ($event['invite_period_year'] . $event['invite_period_month'] . $event['invite_period_day'] != "") {
            $invite_period = $event['invite_period_year'] . "-" . $event['invite_period_month'] . "-" . $event['invite_period_day'];
        } else {
            $invite_period = '';
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
            'capacity'        => $event['capacity'],
        );
        $c_commu_topic_id = db_commu_insert_c_commu_topic($insert_c_commu_topic);

        $insert_c_commu_topic_comment = array(
            "c_commu_id"       => $event['c_commu_id'],
            "c_member_id"      => $u,
            "body"             => $event['detail'],
            "number"           => 0,
            "c_commu_topic_id" => $c_commu_topic_id,
            "image_filename1"  => '',
            "image_filename2"  => '',
            "image_filename3"  => '',
        );
        $insert_id = db_commu_insert_c_commu_topic_comment_3($insert_c_commu_topic_comment);

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($insert_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($insert_id, $u);

        db_commu_insert_c_event_member_as_admin($c_commu_topic_id, $u);

        if (OPENPNE_USE_POINT_RANK) {
            //イベントを作成した人にポイント付与
            $point = db_action_get_point4c_action_id(10);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}

?>
