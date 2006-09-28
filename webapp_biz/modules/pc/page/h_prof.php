<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_member_id = $u;

        $this->set('is_h_prof', 1);
        $this->set('inc_navi',fetch_inc_navi('h'));
        $target_c_member = db_common_c_member_with_profile($u, 'friend');
        $this->set('is_friend', 0);
        $this->set('c_diary_list', db_diary_get_c_diary_list4c_member_id($target_c_member_id, 5, null, 'friend'));

        // --- f_home, h_prof 共通処理

        $this->set('target_c_member_id',$target_c_member_id);
        $target_c_member['last_login'] = p_f_home_last_login4access_date($target_c_member['access_date']);
        if ($target_c_member['birth_year']) {
            $target_c_member['age'] = getAge($target_c_member['birth_year'], $target_c_member['birth_month'], $target_c_member['birth_day']);
        }
        $this->set('target_c_member', $target_c_member);

        $this->set('c_rss_cache_list', p_f_home_c_rss_cache_list4c_member_id($target_c_member_id, 5));

        $this->set('c_friend_comment_list', p_f_home_c_friend_comment4c_member_id($target_c_member_id));
        $this->set('c_friend_list', p_f_home_c_friend_list4c_member_id($target_c_member_id, 9));
        $this->set('c_friend_count', db_friend_count_friends($target_c_member_id));
        $this->set('user_count',p_common_count_c_commu4c_member_id($target_c_member_id));
        $this->set('c_commu_list', p_f_home_c_commu_list4c_member_id($target_c_member_id, 9));
        $this->set('c_review_list', db_review_c_review_list4member($target_c_member_id, 5));

        $this->set('profile_list', db_common_c_profile_list());

        // 誕生日まであと何日？
        $this->set('days_birthday', db_common_count_days_birthday4c_member_id($target_c_member_id));

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point_f_home($this->getView()));

        // ---bizここから

        //nak 20060217 バナーをBIZ用右部拡張領域下に表示させる為の仕掛け
        $this->set('is_h_prof', 1);
        
        //カレンダー表示用
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //bizモジュールディレクトリの定義
        include_once($biz_dir.'lib/smarty_functions.php');  //bizモジュールよりライブラリを拝借
        include_once($biz_dir.'lib/mysql_functions.php');  //bizモジュールよりライブラリを拝借
        $this->set('calendar', biz_getScheduleWeek($u, $requests['w'], 'p', true, true, true, $target_c_member));

        $todolist = biz_getTodoList($u, "h", $target_c_member['nickname']);
        $this->set("todolist", $todolist);
        $stateform = biz_getStateForm($u);
        $this->set("stateform", $stateform);

        $this->set("group_list", biz_getJoinGroup($u, 9));

        // ---bizここまで

        return 'success';
    }
}

?>
