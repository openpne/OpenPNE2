<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $u;
        // ----------

        $this->set('is_h_prof', 1);

        //管理画面HTML
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('k_f_home'));

        $target_c_member = db_member_c_member_with_profile($target_c_member_id, 'private');
        $target_c_member['last_login'] = p_f_home_last_login4access_date($target_c_member['access_date']);
        if ($target_c_member['birth_year']) {
            $target_c_member['age'] = getAge($target_c_member['birth_year'], $target_c_member['birth_month'], $target_c_member['birth_day']);
        }
        $this->set("target_c_member", $target_c_member);

        //ターゲットの最新日記５件
        $this->set('c_diary_list', db_diary_get_c_diary_list4c_member_id($target_c_member_id, 5, null, 'friend'));

        //フレンドランダム５人
        $this->set("c_friend_list", db_friend_c_friend_list_random4c_member_id($target_c_member_id, 5));

        //参加コミュニティ最新書き込み５件
        $this->set("c_commu_list", db_commu_c_commu_list_lastupdate4c_member_id($target_c_member_id, 5));

        //共通コミュニティ
        $this->set('common_commu_count', count(db_common_commu_common_commu_id4c_member_id($target_c_member_id,$u)));

        $this->set('profile_list', db_member_c_profile_list());

        // 誕生日まであと何日？
        $this->set('days_birthday', db_member_count_days_birthday4c_member_id($target_c_member_id));

        if (OPENPNE_USE_POINT_RANK) {
            // ポイント
            $point = db_point_get_point($target_c_member_id);
            $this->set("point", $point);

            // ランク
            $this->set("rank", db_point_get_rank4point($point));
        }

        // inc_entry_point
        $this->set('inc_ktai_entry_point', fetch_inc_entry_point($this->getView(), 'ktai_f_home'));

        return 'success';
    }
}

?>
