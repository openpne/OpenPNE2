<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_event_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $err_msg = $requests['err_msg'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }
        if (!db_commu_is_c_topic_admin($c_commu_topic_id, $u) && !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        if (!$c_topic['event_flag']) {
            openpne_redirect('ktai', 'page_c_topic_edit',
                array('target_c_commu_topic_id'=>$c_topic['c_commu_topic_id']));
        }

        $this->set("c_commu", db_commu_c_commu4c_commu_id2($c_commu_id));
        $this->set("year", db_commu_year4null());
        $this->set('month', p_regist_prof_c_profile_month_list4null());
        $this->set('day', p_regist_prof_c_profile_day_list4null());
        $this->set('pref', p_regist_prof_c_profile_pref_list4null());
        $this->set('err_msg', $err_msg);

        //編集確認画面でエラーがでたときここに戻ってくる。そのときのためにrequestから取得
        //保留
        if ($err_msg) {
            $c_topic_temp = p_c_event_add_confirm_event4request();
            $c_topic['name'] = $c_topic_temp['title'];
            $c_topic['body'] = $c_topic_temp['detail'];
            $c_topic['open_date_comment'] = $c_topic_temp['open_date_comment'];
            $c_topic['open_pref_id'] = $c_topic_temp['open_pref_id'];
            $c_topic['open_pref_comment'] = $c_topic_temp['open_pref_comment'];
            $c_topic['open_date_year'] = $c_topic_temp['open_date_year'];
            $c_topic['open_date_month'] = $c_topic_temp['open_date_month'];
            $c_topic['open_date_day'] = $c_topic_temp['open_date_day'];
            $c_topic['invite_period_year'] = $c_topic_temp['invite_period_year'];
            $c_topic['invite_period_month'] = $c_topic_temp['invite_period_month'];
            $c_topic['invite_period_day'] = $c_topic_temp['invite_period_day'];
        } else {
            $open_date_arr = explode("-", $c_topic['open_date']);
            $invite_period_arr = explode("-", $c_topic['invite_period']);
            $c_topic['open_date_year'] = $open_date_arr[0];
            $c_topic['open_date_month'] = $open_date_arr[1];
            $c_topic['open_date_day'] = $open_date_arr[2];
            $c_topic['invite_period_year'] = $invite_period_arr[0];
            $c_topic['invite_period_month'] = $invite_period_arr[1];
            $c_topic['invite_period_day'] = $invite_period_arr[2];
        }

        $this->set('event', $c_topic);
        return 'success';
    }
}

?>
