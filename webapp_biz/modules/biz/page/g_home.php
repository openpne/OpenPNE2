<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//グループのホーム
class biz_page_g_home extends OpenPNE_Action
{
    function execute($requests)
    {

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_id = $requests['target_c_commu_id'];
        // ----------
        $group = biz_getGroupData($target_id);
        
        //コミュニティの存在の有無
        if (!$group) {
            client_redirect_absolute("?m=pc&a=page_h_err_c_home");
            exit;
        }
        
        //コミュニティトップ
        $this->set("group", $group);

        $member_list = biz_getGroupMember($target_id, 9);
        $member_list_full = biz_getGroupMember($target_id);
        foreach($member_list as $key => $value)
            $member_list[$key] = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        foreach($member_list_full as $key => $value)
        {
            $member_list_full[$key] = db_common_c_member4c_member_id($value['c_member_id']);
            $member_list_full[$key]['last_login'] = p_f_home_last_login4access_date($member_list_full[$key]['access_date']);
        }
        
        //コミュニティメンバー
        $this->set("member_list", $member_list);
        $this->set("member_count", count($member_list_full));
        $this->set("admin_data", db_common_c_member4c_member_id_LIGHT($group['admin_id']));

    //biz_getScheduleWeek($member_id, $w, $cmd, $head = true, $value = true, $foot = true, $member_info = false)
        $this->set('calendar_head', biz_getScheduleWeek($target_id, $requests['w'], 'g', ture, false, false));
        
        foreach($member_list_full as $key => $value)
            $calendar_value .= biz_getScheduleWeek($value['c_member_id'], $requests['w'], 'g', false, true, false, $value);
        
        $this->set('calendar_value', $calendar_value);
        $this->set('calendar_foot', biz_getScheduleWeek($target_id, $requests['w'], 'g', false, false, true));
    //  $this->set('calendar', biz_getScheduleWeek($target_id, $requests['w'], 'g', $member_list));
        
        if($u == $group['admin_id'])
            $this->set("is_admin", true);

    /*
        //参加コミュニティの新着トピック書き込み
        $this->set("new_topic_comment", p_c_home_new_topic_comment4c_commu_id($target_c_commu_id, 7));
        //参加コミュニティの新着イベント書き込み
        $this->set("new_topic_comment_event", p_c_home_new_topic_comment4c_commu_id($target_c_commu_id, 7, 1));
        //参加コミュニティの新着おすすめレビュー
        $this->set("new_commu_review", p_c_home_new_commu_review4c_commu_id($target_c_commu_id, 7));

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point_c_home());
*/

        return 'success';
    }
}

?>
