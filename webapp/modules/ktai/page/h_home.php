<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $OPTION = $this->get('C_MEMBER_CONFIG');

        $c_member_secure = db_member_c_member_secure4c_member_id($u);

        //管理画面HTML
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('k_h_home'));

        $c_member = db_member_c_member_with_profile($u, 'private');
        //メンバー情報
        $this->set('c_member', $c_member);
        //新着メッセージ数
        $this->set('c_message_unread_count', db_message_c_message_received_unread_all_count4c_member_id($u));
        //フレンドの最新日記
        $this->set('c_diary_friend_list', p_h_home_c_diary_friend_list4c_member_id($u, 5, true));
        //参加コミュニティリスト
        $this->set('c_commu_list', db_commu_c_commu_list_lastupdate4c_member_id($u, 5));
        //参加コミュニティの数
        $this->set('fh_com_count_user',db_commu_count_c_commu4c_member_id($u));
        //フレンドリスト
        $this->set('c_friend_list', db_friend_c_friend_list_random4c_member_id($u, 5));
        //フレンドの数
        $this->set('c_friend_count', db_friend_count_friends($u));
        //参加コミュニティの新着書き込み
        $this->set('c_commu_topic_list', db_commu_c_commu_topic_comment_list4c_member_id($u, 5, true));
        $this->set('SNS_NAME', SNS_NAME);

        if (DISPLAY_NEWDIARYTOPIC_HOME) {
            if ($OPTION['IS_DISPLAY_NEWDIARY_HOME_KTAI']) {
                $this->set('c_diary_list_all', p_h_home_c_diary_all_list(5));
            }

            if ($OPTION['IS_DISPLAY_NEWTOPIC_HOME_KTAI']) {
                $this->set('c_topic_list_all', p_h_home_c_topic_all_list(5));
            }
        }

        //アクセス日時を記録
        db_member_do_access($u);

        //未読メッセージの数をお知らせ
        $this->set("num_message_not_is_read", db_message_count_c_message_not_is_read4c_member_to_id($u));
        //日記コメントの未読の数をお知らせ
        $this->set("num_diary_not_is_read", p_h_diary_count_c_diary_not_is_read4c_member_id($u));
        //日記コメントの未読の中で、読ませるものを送る
        $this->set("first_diary_read", p_h_diary_c_diary_first_diary_read4c_member_id($u));

        //コミュニティ承認を求めているメンバーリスト
        $h_confirm_list = db_commu_anatani_c_commu_member_confirm_list4c_member_id($u);
        $this->set("h_confirm_list", $h_confirm_list);
        //そのメンバーの人数
        $this->set("num_h_confirm_list", count($h_confirm_list));

        //あなたにフレンド認証を求めているメンバーリスト
        $f_confirm_list = db_friend_anatani_c_friend_confirm_list4c_member_id($u);
        $this->set("f_confirm_list", $f_confirm_list);
        //そのメンバーの人数
        $this->set("num_f_confirm_list", count($f_confirm_list));

        // あなたにコミュニティ管理者交代を希望しているメンバー
        $anatani_c_commu_admin_confirm_list = db_commu_anatani_c_commu_admin_confirm_list4c_member_id($u);
        $this->set("anatani_c_commu_admin_confirm_list", $anatani_c_commu_admin_confirm_list);
        //そのメンバーの人数
        $this->set("num_anatani_c_commu_admin_confirm_list", count($anatani_c_commu_admin_confirm_list));

        // あなたにコミュニティ副管理者を希望しているメンバー
        $anatani_c_commu_sub_admin_confirm_list = db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($u);
        $this->set("anatani_c_commu_sub_admin_confirm_list", $anatani_c_commu_sub_admin_confirm_list);
        //そのメンバーの人数
        $this->set("num_anatani_c_commu_sub_admin_confirm_list", count($anatani_c_commu_sub_admin_confirm_list));

        //日記コメント記入履歴
        $this->set("c_diary_my_comment_list", p_h_home_c_diary_my_comment_list4c_member_id($u, 5));

        // 誕生日かどうか
        $this->set('birthday_flag', db_member_birthday_flag4c_member_id($u));

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = "b{$u}-".t_get_user_hash($u)."@".MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = "blog"."@".MAIL_SERVER_DOMAIN;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('blog_address', $mail_address);

        if (OPENPNE_USE_POINT_RANK) {
            // ポイント
            $point = db_point_get_point($u);
            $this->set("point", $point);

            // ランク
            $this->set("rank", db_point_get_rank4point($point));

            // メール送信設定
            $this->set('is_unused_rank_up', util_is_unused_mail('m_ktai_rank_up'));
        }

        // メール送信設定
        $this->set('is_unused_ashiato', util_is_unused_mail('m_ktai_ashiato'));
        $this->set('is_unused_diary_comment', util_is_unused_mail('m_ktai_diary_comment_info'));

        // inc_entry_point
        $this->set('inc_ktai_entry_point', fetch_inc_entry_point($this->getView(), 'ktai_h_home'));

        return 'success';
    }
}

?>
