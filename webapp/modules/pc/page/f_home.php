<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        // - IDが指定されていない場合
        // - IDが自分の場合
        // は h_home へリダイレクト
        if (!$target_c_member_id || $target_c_member_id == $u) {
            openpne_redirect('pc', 'page_h_home');
        }

        if (!db_member_is_active_c_member_id($target_c_member_id)) {
            openpne_redirect('pc', 'page_h_err_f_home');
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        //あしあとをつける
        db_ashiato_insert_c_ashiato($target_c_member_id, $u);

        $this->set('is_h_prof', 0);
        $inc_navi = fetch_inc_navi('f', $target_c_member_id);
        $this->set('inc_navi', $inc_navi);

        $target_c_member = db_member_c_member_with_profile($target_c_member_id, 'private');

        $is_friend = db_friend_is_friend($u, $target_c_member_id);
        if ($is_friend) {
            // 自分が書いた紹介文
            $this->set('my_friend_intro', db_friend_c_friend_intro($u, $target_c_member_id));
        } else {
            // 友達の友達
            $this->set('friend_path', db_friend_friend_path4c_member_ids($u, $target_c_member_id));
        }

        $this->set('is_friend', $is_friend);
        $c_member = db_member_c_member4c_member_id($u);
        $this->set('c_member', $c_member);
        $c_diary_list = db_diary_get_c_diary_list4c_member_id($target_c_member_id, 5, $u);
        $this->set('c_diary_list', $c_diary_list);
        if (OPENPNE_USE_ALBUM) {
            // アルバム
            $this->set('c_album_list', db_album_get_c_album_subject_list4c_member_id($target_c_member_id, 5, $u));
        }

        // --- f_home, h_prof 共通処理

        $this->set('target_c_member_id', $target_c_member_id);
        $target_c_member['last_login'] = p_f_home_last_login4access_date($target_c_member['access_date']);
        if ($target_c_member['birth_year']) {
            $target_c_member['age'] = getAge($target_c_member['birth_year'], $target_c_member['birth_month'], $target_c_member['birth_day']);
        }
        $this->set('target_c_member', $target_c_member);

        $this->set('c_rss_cache_list', db_rss_c_rss_cache_list4c_member_id($target_c_member_id, 5));

        $c_friend_comment_list = db_friend_c_friend_comment4c_member_id($target_c_member_id);
        $this->set('c_friend_comment_list', $c_friend_comment_list);
        $c_friend_list = db_friend_c_friend_list4c_member_id($target_c_member_id, 9);
        $this->set('c_friend_list', $c_friend_list);
        $this->set('c_friend_count', db_friend_count_friends($target_c_member_id));
        $this->set('user_count', db_commu_count_c_commu4c_member_id($target_c_member_id));

        $this->set('common_commu_count', count(db_common_commu_common_commu_id4c_member_id($target_c_member_id,$u)));

        $c_commu_list = db_commu_c_commu_list4c_member_id_2($target_c_member_id, 9);
        $this->set('c_commu_list', $c_commu_list);
        $this->set('c_review_list', db_review_c_review_list4member($target_c_member_id, 5));

        $profile_list = db_member_c_profile_list();
        $this->set('profile_list', $profile_list);

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
        $this->set('inc_entry_point', fetch_inc_entry_point($this->getView(), 'f_home'));

        // ---

        return 'success';
    }
}

?>
