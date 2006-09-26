<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_f_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        if ($target_c_member_id == $u) {
            openpne_redirect('ktai', 'page_h_home');
        }

        if (!p_common_is_active_c_member_id($target_c_member_id)) {
            ktai_display_error('該当するメンバーが見つかりません。');
        }

        if (p_common_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        //管理画面HTML
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('k_f_home'));

        //ターゲットのc_member

        $is_friend = db_friend_is_friend($u, $target_c_member_id);
        if ($is_friend) {
            $target_c_member = db_common_c_member_with_profile($target_c_member_id, 'friend');
        } else {
            $target_c_member = db_common_c_member_with_profile($target_c_member_id, 'public');
        }
        $target_c_member['last_login'] = p_f_home_last_login4access_date($target_c_member['access_date']);
        if ($target_c_member['birth_year']) {
            $target_c_member['age'] = getAge($target_c_member['birth_year'], $target_c_member['birth_month'], $target_c_member['birth_day']);
        }
        $this->set("target_c_member", $target_c_member);

        //ターゲットの最新日記５件
        $this->set("c_diary_list", $this->_db_diary_get_c_diary_list4c_member_id($target_c_member_id, $is_friend, 5) );

        //フレンドランダム５人
        $this->set("c_friend_list", k_p_h_home_c_friend_list_random4c_member_id($target_c_member_id, 5));

        //参加コミュニティ最新書き込み５件
        $this->set("c_commu_list", k_p_h_home_c_commu_list_lastupdate4c_member_id($target_c_member_id, 5));

        //ターゲットと自分との関係
        $this->set("relation", k_p_f_home_relationship4two_members($u, $target_c_member_id));

        $this->set('profile_list', db_common_c_profile_list());

        // 誕生日まであと何日？
        $this->set('days_birthday', db_common_count_days_birthday4c_member_id($target_c_member_id));

        //あしあとをつける
        db_ashiato_insert_c_ashiato($target_c_member_id, $u);

        return 'success';
    }

    //f_home仕様　日記公開範囲を考慮する
    function _db_diary_get_c_diary_list4c_member_id($target_c_member_id, $is_friend, $count = 10)
    {
        $sql = 'SELECT c_diary.* FROM c_diary' .
            ' INNER JOIN c_member USING (c_member_id)'.
            ' WHERE c_diary.c_member_id = ?';

        if($is_friend)
        {
            $sql .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\') OR (c_diary.public_flag = \'friend\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'friend\'))';
        }
        else
        {
            $sql .= ' AND ((c_diary.public_flag = \'public\') OR (c_diary.public_flag = \'default\' AND c_member.public_flag_diary = \'public\'))';
        }

        $sql .= ' ORDER BY c_diary.r_datetime DESC';

        $params = array(intval($target_c_member_id));
        $arr = db_get_all_limit($sql, 0, $count, $params);
        foreach ($arr as $key => $value) {
            $arr[$key]['count_comment'] = db_diary_count_c_diary_comment4c_diary_id($value['c_diary_id']);
        }
        return $arr;
    }


}

?>
