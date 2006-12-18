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
        $this->set('inc_navi', fetch_inc_navi('h'));
        $target_c_member = db_member_c_member_with_profile($u, 'friend');
        $this->set('is_friend', 0);
        $this->set('c_diary_list', db_diary_get_c_diary_list4c_member_id($target_c_member_id, 5, null, 'friend'));

        // --- f_home, h_prof 共通処理

        $this->set('target_c_member_id', $target_c_member_id);
        $target_c_member['last_login'] = p_f_home_last_login4access_date($target_c_member['access_date']);
        if ($target_c_member['birth_year']) {
            $target_c_member['age'] = getAge($target_c_member['birth_year'], $target_c_member['birth_month'], $target_c_member['birth_day']);
        }
        $this->set('target_c_member', $target_c_member);

        $this->set('c_rss_cache_list', db_rss_c_rss_cache_list4c_member_id($target_c_member_id, 5));

        $this->set('c_friend_comment_list', db_friend_c_friend_comment4c_member_id($target_c_member_id));
        $this->set('c_friend_list', db_friend_c_friend_list4c_member_id($target_c_member_id, 9));
        $this->set('c_friend_count', db_friend_count_friends($target_c_member_id));
        $this->set('user_count', db_commu_count_c_commu4c_member_id($target_c_member_id));
        $this->set('c_commu_list', db_commu_c_commu_list4c_member_id_2($target_c_member_id, 9));
        $this->set('c_review_list', db_review_c_review_list4member($target_c_member_id, 5));

        $this->set('profile_list', db_member_c_profile_list());

        // 誕生日まであと何日？
        $this->set('days_birthday', db_member_count_days_birthday4c_member_id($target_c_member_id));

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point_f_home($this->getView()));

        //PNEPOINT
        $point = db_point_get_point($u);
        $this->set("point", $point);

        //rank
        $this->set("rank", db_point_get_rank4point($point));

        return 'success';
    }
}

?>
