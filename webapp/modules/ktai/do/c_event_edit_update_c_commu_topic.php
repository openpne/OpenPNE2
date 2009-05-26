<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_c_event_edit_update_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------

        list($event, $errors) = p_c_event_add_confirm_event4request(true);
        if ($event['invite_period_year'].$event['invite_period_month'].$event['invite_period_day'] != '') {
            $invite_period = $event['invite_period_year']."-".$event['invite_period_month']."-".$event['invite_period_day'];
        } else {
            $invite_period = '';
        }

        //--- 権限チェック
        //イベント管理者 or コミュニティ管理者

        if (!db_commu_is_c_event_admin($c_commu_topic_id, $u) &&
            !db_commu_is_c_commu_admin($event['c_commu_id'], $u)) {
            handle_kengen_error();
        }
        //---

        //エラーチェック
        $err_msg = $errors;

        if (!$event['open_date_month'] || !$event['open_date_day'] || !$event['open_date_year']) {
            $err_msg[] = "開催日時を入力してください";
        } elseif (!t_checkdate($event['open_date_month'], $event['open_date_day'], $event['open_date_year'])) {
            $err_msg[] = "開催日時は存在しません";
        } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year']) < mktime(0, 0, 0)) {
            $err_msg[] = "開催日時は過去に指定できません";
        }

        if ($event['invite_period_month'].$event['invite_period_day'].$event['invite_period_year'] != "") {
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
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['target_c_commu_topic_id'] = $c_commu_topic_id;
            openpne_forward('ktai', 'page', "c_event_edit");
            exit;
        }

        $update_c_commu_topic = array(
            'name'              => $event['title'],
            'open_date'         => $event['open_date_year']."-".$event['open_date_month']."-".$event['open_date_day'],
            'open_date_comment' => $event['open_date_comment'],
            'open_pref_id'      => $event['open_pref_id'],
            'open_pref_comment' => $event['open_pref_comment'],
            'invite_period'     => $invite_period,
            'event_flag'        => 1,
            'capacity'        => $event['capacity'],
        );
        db_commu_update_c_commu_topic($c_commu_topic_id, $update_c_commu_topic);


        $update_c_commu_topic_comment = array(
            'body' => $event['detail'],
        );
        db_commu_update_c_commu_topic_comment($c_commu_topic_id, $update_c_commu_topic_comment);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_bbs', $p);
    }
}

?>
