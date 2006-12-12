<?php

/*** friend ***/

function p_f_home_c_friend_intro($c_member_id_from, $c_member_id_to)
{
    return db_friend_c_friend_intro($c_member_id_from, $c_member_id_to);
}

function p_f_home_friend_path4c_member_ids($my_id, $target_id)
{
    return db_friend_friend_path4c_member_ids($my_id, $target_id);
}

function p_f_invite_invite_list4c_member_ids($target_c_member_id, $u)
{
    return db_friend_invite_list4c_member_ids($target_c_member_id, $u);
}

function p_fh_friend_list_friend_list4c_member_id2($c_member_id, $page_size, $page, $orderby)
{
    return db_friend_friend_list4c_member_id2($c_member_id, $page_size, $page, $orderby);
}

function p_fh_intro_intro_list4c_member_id($c_member_id)
{
    return db_friend_intro_list4c_member_id($c_member_id);
}

function p_fh_intro_intro_list_with_my_intro4c_member_id($c_member_id)
{
    return db_friend_intro_list_with_my_intro4c_member_id($c_member_id);
}

function p_f_home_c_friend_comment4c_member_id($c_member_id, $limit = 5)
{
    return db_friend_c_friend_comment4c_member_id($c_member_id, $limit);
}

function p_common_c_friend4c_member_id_from4c_member_id_to($c_member_id_from,$c_member_id_to)
{
    return db_friend_c_friend4c_member_id_from4c_member_id_to($c_member_id_from,$c_member_id_to);
}

function p_f_home_c_friend_list4c_member_id($c_member_id, $limit = 0)
{
    return db_friend_c_friend_list4c_member_id($c_member_id, $limit);
}

function p_f_intro_edit_intro_body4c_member_id($u, $target_c_member_id)
{
    return db_friend_intro_body4c_member_id($u, $target_c_member_id);
}

function p_h_confirm_list_anatani_c_friend_confirm_list4c_member_id($c_member_id_to)
{
    return db_friend_anatani_c_friend_confirm_list4c_member_id($c_member_id_to);
}

function p_h_confirm_list_anataga_c_friend_confirm_list4c_member_id($c_member_id_from)
{
    return db_friend_anataga_c_friend_confirm_list4c_member_id($c_member_id_from);
}

function p_h_home_c_friend_intro_list4c_member_id($c_member_id, $limit)
{
    return db_friend_c_friend_intro_list4c_member_id($c_member_id, $limit);
}

function p_h_manage_friend_c_friend_list_disp4c_member_id($c_member_id)
{
    return db_friend_c_friend_list_disp4c_member_id($c_member_id);
}

function db_common_friend_status($u, $target_c_member_id)
{
    return db_friend_status($u, $target_c_member_id);
}

function _do_c_friend_confirm4c_friend_confirm_id($c_friend_confirm_id)
{
    return db_friend_c_friend_confirm4c_friend_confirm_id($c_friend_confirm_id);
}

function do_common_is_friend_link_wait($c_member_id_from, $c_member_id_to)
{
    return db_friend_is_friend_link_wait($c_member_id_from, $c_member_id_to);
}

function do_common_get_f_link_status($c_member_id_from,$c_member_id_to)
{
    return db_friend_f_link_status($c_member_id_from,$c_member_id_to);
}

function do_common_c_friend_list4c_member_id($c_member_id)
{
    return db_friend_c_friend_list4c_member_id2($c_member_id);
}

function k_p_h_home_c_friend_list_random4c_member_id($c_member_id, $limit)
{
    return db_friend_c_friend_list_random4c_member_id($c_member_id, $limit);
}

function k_p_f_home_relationship4two_members($c_member_id, $target_c_member_id)
{
    return db_friend_relationship4two_members($c_member_id, $target_c_member_id);
}

function k_p_fh_friend_list_friend_list4c_member_id($c_member_id,$page_size,$page)
{
    return db_friend_friend_list4c_member_id($c_member_id,$page_size,$page);
}

function k_p_h_confirm_list_anatani_c_friend_confirm_list4c_member_id($c_member_id_to)
{
    return db_friend_ktai_anatani_c_friend_confirm_list4c_member_id($c_member_id_to);
}

function k_p_h_confirm_list_anataga_c_friend_confirm_list4c_member_id($c_member_id_from)
{
    return db_friend_ktai_anataga_c_friend_confirm_list4c_member_id($c_member_id_from);
}

function k_p_h_message_send_c_friend_list_random4c_member_id($c_member_id)
{
    return db_friend_ktai_c_friend_list_random4c_member_id($c_member_id);
}

function p_fh_intro_list4c_friend_comment_list($c_friend_comment_list, $page, $page_size)
{
    return db_friend_intro_list4c_friend_comment_list($c_friend_comment_list, $page, $page_size);
}

/*** image ***/

function db_admin_c_image4c_image_id($c_image_id)
{
    return db_image_c_image4c_image_id($c_image_id);
}

function db_admin_is_c_image4filename($filename)
{
    return db_image_is_c_image4filename($filename);
}

function db_admin_c_image_list($page, $page_size, &$pager)
{
    return db_image_c_image_list($page, $page_size, $pager);
}

function c_tmp_image4filename($filename)
{
    return db_image_c_tmp_image4filename($filename);
}

function _do_insert_c_image($filename, $filepath)
{
    return db_image_insert_c_image2($filename, $filepath);
}

function image_data_delete($image_filename)
{
    return db_image_data_delete($image_filename);
}

function _do_insert_c_tmp_image($filename, $filepath)
{
    return db_image_insert_c_tmp_image($filename, $filepath);
}

function t_image_clear_tmp_db($uid)
{
    return db_image_clear_tmp_db($uid);
}

/*** member ***/

function db_common_c_member4c_member_id($c_member_id, $is_secure = false, $with_profile = false, $public_flag = 'public')
{
    return db_member_c_member4c_member_id($c_member_id, $is_secure, $with_profile, $public_flag);
}

function db_common_c_member_profile_list4c_member_id($c_member_id, $public_flag = 'public')
{
    return db_member_c_member_profile_list4c_member_id($c_member_id, $public_flag);
}

function db_common_c_member_secure4c_member_id($c_member_id)
{
    return db_member_c_member_secure4c_member_id($c_member_id);
}

function db_common_c_member_with_profile($c_member_id, $public_flag = 'public')
{
    return db_member_c_member_with_profile($c_member_id, $public_flag);
}

function db_common_c_member4c_member_id_LIGHT($c_member_id)
{
    return db_member_c_member4c_member_id_LIGHT($c_member_id);
}

function _db_c_member_id4pc_address($pc_address)
{
    return db_member_c_member_id4pc_address($pc_address);
}

function _db_c_member_id4pc_address_encrypted($pc_address_encoded)
{
    return db_member_c_member_id4pc_address_encrypted($pc_address_encoded);
}

function _db_c_member_id4ktai_address_encrypted($ktai_address_encoded)
{
    return db_member_c_member_id4ktai_address_encrypted($ktai_address_encoded);
}

function p_common_is_active_c_member_id($c_member_id)
{
    return db_member_is_active_c_member_id($c_member_id);
}

function p_common_c_member_pre4c_member_pre_session($session)
{
    return db_member_c_member_pre4c_member_pre_session($session);
}

function n_regist_intro_is_active_sid($sid)
{
    return db_member_is_active_sid($sid);
}

function p_h_search_result_search($cond, $cond_like, $page_size, $page, $c_member_id, $profiles)
{
    return db_member_search($cond, $cond_like, $page_size, $page, $c_member_id, $profiles);
}

function h_invite_inviting_member4c_member_id($c_member_id)
{
    return db_member_inviting_member4c_member_id($c_member_id);
}

function p_h_home_birthday_flag4c_member_id($c_member_id)
{
    return db_member_birthday_flag4c_member_id($c_member_id);
}

function p_h_config_c_member_id_block4c_member_id($c_member_id)
{
    return db_member_c_member_id_block4c_member_id($c_member_id);
}

function p_common_is_access_block($c_member_id, $target_c_member_id)
{
    return db_member_is_access_block($c_member_id, $target_c_member_id);
}

function db_common_count_days_birthday4c_member_id($c_member_id)
{
    return db_member_count_days_birthday4c_member_id($c_member_id);
}

function p_h_search_result_check_profile($profile)
{
    return db_member_search_check_profile($profile);
}

function p_h_search_list_count_c_member_profile()
{
    return db_member_count_c_member_profile();
}

function p_h_home_birth4c_member_id($month, $day, $c_member_id)
{
    return db_member_birth4c_member_id($month, $day, $c_member_id);
}

function db_c_member_list4exists_rss()
{
    return db_member_c_member_list4exists_rss();
}

function db_c_member_list4no_exists_rss()
{
    return db_member_c_member_list4no_exists_rss();
}

function db_common_c_profile_list4null()
{
    return db_member_c_profile_list4null();
}

function db_common_c_profile_option_list4c_profile_id($c_profile_id)
{
    return db_member_c_profile_option_list4c_profile_id($c_profile_id);
}

function db_common_c_profile_list()
{
    return db_member_c_profile_list();
}

function db_common_main_image_filename_number($c_member_id)
{
    return db_member_main_image_filename_number($c_member_id);
}

function do_common_c_member_pre4sid($sid)
{
    return db_member_c_member_pre4sid($sid);
}

function do_common_c_member_pre4pc_address($pc_address)
{
    return db_member_c_member_pre4pc_address($pc_address);
}

function do_common_c_member4pc_address($pc_address)
{
    return db_member_c_member4pc_address($pc_address);
}

function do_common_c_member_list4daily_news()
{
    return db_member_c_member_list4daily_news();
}

function do_common_c_member_list4birthday_mail()
{
    return db_member_c_member_list4birthday_mail();
}

function do_password_query_is_password_query_complete($pc_address, $query_id, $query_answer)
{
    return db_member_is_password_query_complete($pc_address, $query_id, $query_answer);
}

function do_common_c_member_id4ktai_address($ktai_address)
{
    return db_member_c_member_id4ktai_address2($ktai_address);
}

function k_h_invite_inviting_member4c_member_id($c_member_id)
{
    return db_member_inviting_member4c_member_id2($c_member_id);
}

function p_is_sns_join4mail_address($mail_address)
{
    return db_member_is_sns_join4mail_address($mail_address);
}

function do_common_c_member_ktai_pre4ktai_address($ktai_address)
{
    return db_member_c_member_ktai_pre4ktai_address($ktai_address);
}

function k_auth($c_member_id)
{
    return db_member_k_auth($c_member_id);
}

function k_auth_login($ktai_address, $password)
{
    return db_member_k_auth_login($ktai_address, $password);
}

function c_ktai_address_pre4session($session)
{
    return db_member_c_ktai_address_pre4session($session);
}

function c_member_ktai_pre4session($session)
{
    return db_member_c_member_ktai_pre4session($session);
}

function k_common_hashed_password4c_member_id($c_member_id)
{
    return db_member_hashed_password4c_member_id($c_member_id);
}

function db_ktai_is_password_query_complete($ktai_address, $query_id, $query_answer)
{
    return db_member_is_password_query_complete2($ktai_address, $query_id, $query_answer);
}

function db_ktai_c_member_id4easy_access_id($easy_access_id)
{
    return db_member_c_member_id4easy_access_id($easy_access_id);
}

function do_config_prof_check_profile($profile_list, $public_flag_list)
{
    return db_member_check_profile($profile_list, $public_flag_list);
}

function p_common_c_member_id_list4null()
{
    return db_member_c_member_id_list4null();
}

function do_config_prof_new($c_member_id, $prof_list)
{
    return db_member_config_prof_new($c_member_id, $prof_list);
}

function p_common_do_access($c_member_id)
{
    return db_member_do_access($c_member_id);
}

function do_h_config_image_new($c_member_id, $image_filename, $img_num)
{
    return db_member_config_image_new($c_member_id, $image_filename, $img_num);
}

function do_h_config_image_delete_c_member_image_new($c_member_id, $img_num)
{
    return db_member_delete_c_member_image_new($c_member_id, $img_num);
}

function do_h_config_image_change_c_member_main_image($c_member_id, $img_num)
{
    return db_member_change_c_member_main_image($c_member_id, $img_num);
}

function mail_update_c_member_image($c_member_id, $image_filename, $img_num)
{
    return db_member_update_c_member_image($c_member_id, $image_filename, $img_num);
}

function k_do_insert_c_member($profs)
{
    return db_member_ktai_insert_c_member($profs);
}

function do_h_config_3(
                $c_member_id,
                $is_receive_mail,
                $rss,
                $ashiato_mail_num,
                $is_receive_daily_news,
                $c_password_query_id,
                $c_password_query_answer,
                $public_flag_diary,
                $is_shinobiashi)
{
    return db_member_h_config_3(
                $c_member_id,
                $is_receive_mail,
                $rss,
                $ashiato_mail_num,
                $is_receive_daily_news,
                $c_password_query_id,
                $c_password_query_answer,
                $public_flag_diary,
                $is_shinobiashi);
}

function db_ktai_update_easy_access_id($c_member_id, $easy_access_id)
{
    return db_member_update_easy_access_id($c_member_id, $easy_access_id);
}

function db_ktai_update_password_query($c_member_id, $c_password_query_id, $password_query_answer)
{
    return db_member_update_password_query($c_member_id, $c_password_query_id, $password_query_answer);
}

function do_common_update_c_member_pc_address4c_member_id($c_member_id, $pc_address)
{
    return db_member_update_c_member_pc_address4c_member_id($c_member_id, $pc_address);
}

function k_do_update_ktai_address($c_member_id, $ktai_address)
{
    return db_member_update_ktai_address($c_member_id, $ktai_address);
}

function do_common_update_password($c_member_id, $password)
{
    return db_member_update_password($c_member_id, $password);
}

function do_h_config_1($c_member_id, $pc_address)
{
    return db_member_h_config_1($c_member_id, $pc_address);
}

function do_common_delete_c_pc_address_pre4sid($sid)
{
    return db_member_delete_c_pc_address_pre4sid($sid);
}

function do_change_mail($sid,$password)
{
    return db_member_change_mail($sid, $password);
}

function k_do_insert_c_ktai_address_pre($c_member_id, $session, $ktai_address)
{
    return db_member_insert_c_ktai_address_pre($c_member_id, $session, $ktai_address);
}

function k_do_delete_ktai_address_pre($c_ktai_address_pre_id)
{
    return db_member_delete_ktai_address_pre($c_ktai_address_pre_id);
}

function k_do_delete_c_ktai_address_pre4ktai_address($ktai_address)
{
    return db_member_delete_c_ktai_address_pre4ktai_address($ktai_address);
}

function do_h_invite_insert_c_invite($c_member_id_invite, $pc_address, $message, $session)
{
    return db_member_insert_c_invite($c_member_id_invite, $pc_address, $message, $session);
}

function do_h_invite_update_c_invite($c_member_id_invite, $pc_address, $message, $session)
{
    return db_member_update_c_invite($c_member_id_invite, $pc_address, $message, $session);
}

function do_h_invite_delete_member_delete_c_member_pre($c_member_id, $delete_c_member_ids)
{
    return db_member_delete_c_member_pre($c_member_id, $delete_c_member_ids);
}

function do_common_delete_c_member_pre4sid($sid)
{
    return db_member_delete_c_member_pre4sid($sid);
}

function do_h_invite_delete_member_delete_c_member_ktai_pre($c_member_id, $delete_c_member_ids)
{
    return db_member_delete_c_member_ktai_pre($c_member_id, $delete_c_member_ids);
}

function k_do_delete_c_member_ktai_pre($c_member_ktai_pre_id)
{
    return db_member_delete_c_member_ktai_pre4id($c_member_ktai_pre_id);
}

function do_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    return db_member_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite);
}

function do_update_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    return db_member_update_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite);
}

function k_do_delete_c_member_ktai_pre4ktai_address($ktai_address)
{
    return db_member_delete_c_member_ktai_pre4ktai_address($ktai_address);
}

function mail_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite)
{
    return db_member_insert_c_member_ktai_pre($session, $ktai_address, $c_member_id_invite);
}

function do_config_prof_update_c_member_profile($c_member_id, $c_member_profile_list)
{
    return db_member_update_c_member_profile($c_member_id, $c_member_profile_list);
}

function do_config_prof_insert_c_member_profile($c_member_id, $c_profile_id, $c_profile_option_id, $value, $public_flag)
{
    return db_member_insert_c_member_profile($c_member_id, $c_profile_id, $c_profile_option_id, $value, $public_flag);
}

function do_h_config_3_insert_c_access_block($c_member_id, $c_member_id_block)
{
    return db_member_insert_c_access_block($c_member_id, $c_member_id_block);
}

function db_ktai_update_mail_receive($c_member_id, $is_receive_ktai_mail)
{
    return db_member_update_mail_receive($c_member_id, $is_receive_ktai_mail);
}

function db_ktai_update_ashiato_mail_num($c_member_id, $ashiato_mail_num)
{
    return db_member_update_ashiato_mail_num($c_member_id, $ashiato_mail_num);
}

function db_ktai_update_public_flag_diary($c_member_id, $public_flag_diary)
{
    return db_member_update_public_flag_diary($c_member_id, $public_flag_diary);
}

/*** message ***/

function _db_c_message4c_message_id($c_message_id)
{
    return db_message_c_message4c_message_id($c_message_id);
}

function p_h_message_count_c_message_not_is_read4c_member_to_id($c_member_id_to)
{
    return db_message_count_c_message_not_is_read4c_member_to_id($c_member_id_to);
}

function p_h_message_c_message4c_message_id($c_message_id, $u)
{
    return db_message_c_message4c_message_id2($c_message_id, $u);
}

function p_h_message_box_c_message_received_list4c_member_id4range($c_member_id, $page, $page_size)
{
    return db_message_c_message_received_list4c_member_id4range($c_member_id, $page, $page_size);
}

function p_h_message_box_c_message_sent_list4c_member_id4range($c_member_id, $page, $page_size)
{
    return db_message_c_message_sent_list4c_member_id4range($c_member_id, $page, $page_size);
}

function p_h_message_box_c_message_save_list4c_member_id4range($c_member_id, $page, $page_size)
{
    return db_message_c_message_save_list4c_member_id4range($c_member_id, $page, $page_size);
}

function p_h_message_box_c_message_trash_list4c_member_id4range($c_member_id, $page, $page_size)
{
    return db_message_c_message_trash_list4c_member_id4range($c_member_id, $page, $page_size);
}

function k_p_h_home_c_message_received_unread_all_count4c_member_id($c_member_id)
{
    return db_message_c_message_received_unread_all_count4c_member_id($c_member_id);
}

function k_p_h_message_box_c_message_received_list4c_member_id4range($c_member_id, $page_size, $page)
{
    return db_message_c_message_received_list4c_member_id4range2($c_member_id, $page_size, $page);
}

function k_p_h_message_box_c_message_sent_list4c_member_id4range($c_member_id, $page_size, $page)
{
    return db_message_c_message_sent_list4c_member_id4range2($c_member_id, $page_size, $page);
}

function do_get_hensinmoto_id($hensin_c_message_id)
{
    return db_message_hensinmoto_id($hensin_c_message_id);
}

function _do_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_insert_c_message($c_member_id_from, $c_member_id_to, $subject, $body);
}

function _do_insert_c_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_insert_c_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body);
}

function insert_message_to_is_save($c_member_id_to,$c_member_id_from,$subject,$body,$jyusin_message_id)
{
    return db_message_insert_message_to_is_save($c_member_id_to,$c_member_id_from,$subject,$body,$jyusin_message_id);
}

function _do_delete_c_message4c_message_id($c_message_id, $c_member_id)
{
    return db_message_delete_c_message4c_message_id($c_message_id, $c_member_id);
}

function do_h_message_box_move_message($c_message_id, $c_member_id)
{
    return db_message_move_message($c_message_id, $c_member_id);
}

function do_delete_c_message_from_trash($c_message_id)
{
    return db_message_delete_c_message_from_trash($c_message_id);
}

function do_delete_c_message_to_trash($c_message_id)
{
    return db_message_delete_c_message_to_trash($c_message_id);
}

function do_update_is_hensinmoto_c_message_id($jyusin_c_message_id, $hensin_c_message_id)
{
    return db_message_update_is_hensinmoto_c_message_id($jyusin_c_message_id, $hensin_c_message_id);
}

function do_update_is_hensin($c_message_id)
{
    return db_message_update_is_hensin($c_message_id);
}

function p_h_message_update_c_message_is_read4c_message_id($c_message_id, $c_member_id)
{
    return db_message_update_c_message_is_read4c_message_id($c_message_id, $c_member_id);
}

function update_message_to_is_save($c_message_id, $subject, $body, $is_send = 0)
{
    return db_message_update_message_to_is_save($c_message_id, $subject, $body, $is_send);
}

function do_common_send_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_send_message($c_member_id_from, $c_member_id_to, $subject, $body);
}

function do_common_send_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_send_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body);
}

function do_common_send_message_syoukai_commu($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_send_message_syoukai_commu($c_member_id_from, $c_member_id_to, $subject, $body);
}

function do_common_send_message_syoukai_member($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_send_message_syoukai_member($c_member_id_from, $c_member_id_to, $subject, $body);
}

function do_common_send_message_event_invite($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_send_message_event_invite($c_member_id_from, $c_member_id_to, $subject, $body);
}

function do_common_send_message_event_message($c_member_id_from, $c_member_id_to, $subject, $body)
{
    return db_message_send_message_event_message($c_member_id_from, $c_member_id_to, $subject, $body);
}

function db_update_c_message($c_message_id, $subject, $body, $image_filename_1 = '', $image_filename_2 = '', $image_filename_3 = '')
{
    return db_message_update_c_message($c_message_id, $subject, $body, $image_filename_1, $image_filename_2, $image_filename_3);
}

?>
