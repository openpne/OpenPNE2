<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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

        if (!$group) {
            $p = array();
            openpne_redirect('pc', 'page_h_err_c_home', $p);
            exit;
        }

        $this->set("group", $group);

        $member_list = biz_getGroupMember($target_id, 9);
        $member_list_full = biz_getGroupMember($target_id);
        foreach ($member_list as $key => $value) {
            $member_list[$key] = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        }
        foreach ($member_list_full as $key => $value) {
            $member_list_full[$key] = db_member_c_member4c_member_id($value['c_member_id']);
            $member_list_full[$key]['last_login'] = p_f_home_last_login4access_date($member_list_full[$key]['access_date']);
        }

        $this->set('inc_navi', fetch_inc_navi('h'));

        $this->set("member_list", $member_list);
        $this->set("member_count", count($member_list_full));
        $this->set("admin_data", db_member_c_member4c_member_id_LIGHT($group['admin_id']));

        $this->set('calendar_head', biz_getScheduleWeek($u, $target_id, $requests['w'], 'g', ture, false, false));

        foreach ($member_list_full as $key => $value) {
            $calendar_value .= biz_getScheduleWeek($u, $value['c_member_id'], $requests['w'], 'g', false, true, false, $value);
        }

        $this->set('calendar_value', $calendar_value);
        $this->set('calendar_foot', biz_getScheduleWeek($u, $target_id, $requests['w'], 'g', false, false, true));

        if ($u == $group['admin_id']) {
            $this->set("is_admin", true);
        }

        return 'success';
    }
}

?>
