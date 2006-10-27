<?php
function _db_c_commu4c_commu_id($c_commu_id)
{
	return db_commu_c_commu4c_commu_id($c_commu_id);
}

function p_c_home_c_commu4c_commu_id($c_commu_id)
{
	return db_commu_c_commu4c_commu_id2($c_commu_id);
}
function k_p_c_home_c_commu4c_commu_id($c_commu_id)
{
	return db_commu_c_commu4c_commu_id_k($c_commu_id);
}

function p_c_com_add_is_commu4c_commu_name($c_commu_name)
{
	return db_commu_is_commu4c_commu_name($c_commu_name);
}
/*
function db_commu_regist_join_list()
{
	return db_commu_regist_join_list();
}
*/
function _db_count_c_commu_member_list4c_commu_id($c_commu_id)
{
	return db_commu_count_c_commu_member_list4c_commu_id($c_commu_id);
}

function p_common_count_c_commu4c_member_id($c_member_id)
{
	return db_commu_count_c_commu4c_member_id($c_member_id);
}
/*
function db_commu_get_max_number4topic($c_commu_topic_id)
{
	return db_commu_get_max_number4topic($c_commu_topic_id);
}
*/

function _do_c_commu_topic_comment_number4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_commu_topic_comment_number4c_commu_topic_id($c_commu_topic_id);
}

function _db_is_c_commu_member($c_commu_id, $c_member_id)
{
	return db_commu_is_c_commu_member($c_commu_id, $c_member_id);
}

function _db_is_c_commu_admin($c_commu_id, $c_member_id)
{
	return db_commu_is_c_commu_admin($c_commu_id, $c_member_id);
}

function _db_is_c_topic_admin($c_commu_topic_id, $c_member_id)
{
	return db_commu_is_c_topic_admin($c_commu_topic_id, $c_member_id);
}
function do_common_is_c_commu_join_wait($c_commu_id, $c_member_id)
{
	return db_commu_is_c_commu_join_wait($c_commu_id, $c_member_id);
}
function p_common_is_c_commu_view4c_commu_idAc_member_id($c_commu_id,$c_member_id)
{
	return db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id,$c_member_id);
}
/*

function db_commu_is_receive_mail_ktai($c_commu_id, $c_member_id)
{
	return db_commu_is_receive_mail_ktai($c_commu_id, $c_member_id);
}
function db_commu_is_receive_mail_pc($c_commu_id, $c_member_id)
{
	return db_commu_is_receive_mail_pc($c_commu_id, $c_member_id);
}

function db_commu_is_receive_message($c_commu_id, $c_member_id)
{
	return db_commu_is_receive_message($c_commu_id, $c_member_id);
}

function db_common_receive_ktai_address_list4c_commu_id($c_commu_id)
{
	return db_common_receive_ktai_address_list4c_commu_id($c_commu_id);
}

function db_common_receive_pc_address_list4c_commu_id($c_commu_id)
{
	return db_common_receive_pc_address_list4c_commu_id($c_commu_id);
}
*/
function _db_c_commu_admin_confirm4c_commu_admin_confirm_id($c_commu_admin_confirm_id)
{
	return db_c_commu_admin_confirm4c_commu_admin_confirm_id($c_commu_admin_confirm_id);
}

function p_fh_com_list_c_commu_list4c_member_id($c_member_id, $page, $page_size)
{
	return db_commu_c_commu_list4c_member_id($c_member_id, $page, $page_size);
}

function p_c_bbs_c_commu_id4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_commu_id4c_commu_topic_id($c_commu_topic_id);
}

function p_c_edit_member_c_member_list4c_commu_id($c_commu_id, $page_size, $page)
{
	return db_commu_c_member_list4c_commu_id($c_commu_id, $page_size, $page);
}

function p_c_home_c_commu_member_list4c_commu_id($c_commu_id ,$limit = 9)
{
	return db_commu_c_commu_member_list4c_commu_id($c_commu_id ,$limit);
}


function p_c_home_new_topic_comment4c_commu_id($c_commu_id, $limit, $event_flag = 0)
{
	return db_commu_new_topic_comment4c_commu_id($c_commu_id, $limit, $event_flag);
}

function p_c_invite_invite_list4c_member_id4c_commu_id($c_member_id, $c_commu_id)
{
	return db_commu_invite_list4c_member_id4c_commu_id($c_member_id, $c_commu_id);
}


function p_c_member_list_c_members4c_commu_id($c_commu_id, $page_size, $page)
{
	return db_commu_c_members4c_commu_id($c_member_id, $c_commu_id);
}

function p_f_home_c_commu_list4c_member_id($c_member_id, $limit = 9)
{
	return db_commu_c_commu_list4c_member_id_2($c_member_id, $limit);
}

function p_h_confirm_list_anatani_c_commu_member_confirm_list4c_member_id($c_member_id)
{
	return db_commu_anatani_c_commu_member_confirm_list4c_member_id($c_member_id);
}

function p_h_confirm_list_anataga_c_commu_member_confirm_list4c_member_id($c_member_id)
{
	return db_commu_anataga_c_commu_member_confirm_list4c_member_id($c_member_id);
}

function p_h_confirm_list_anatani_c_commu_admin_confirm_list4c_member_id($c_member_id_to)
{
	return db_commu_anatani_c_commu_admin_confirm_list4c_member_id($c_member_id_to);
}

function p_h_confirm_list_anataga_c_commu_admin_confirm_list4c_member_id($c_member_id_admin)
{
	return db_commu_anataga_c_commu_admin_confirm_list4c_member_id($c_member_id_admin);
}

function p_h_home_c_commu_topic_comment_list4c_member_id($c_member_id, $limit)
{
	return db_commu_c_commu_topic_comment_list4c_member_id($c_member_id, $limit);
}

function p_h_com_comment_list_c_commu_topic_comment_list4c_member_id($c_member_id, $limit,$page)
{
	return db_commu_c_commu_topic_comment_list4c_member_id_2($c_member_id, $limit,$page);
}

function p_h_home_c_commu_list4c_member_id($c_member_id, $limit)
{
	return db_commu_c_commu_list4c_member_id_3($c_member_id, $limit);
}

function p_c_topic_list_c_topic_list4target_c_commu_id($c_commu_id, $c_member_id, $page = 1, $page_size = 10, $event_flag = 0, $topic_with_event = 0)
{
	return db_commu_c_topic_list4target_c_commu_id($c_commu_id, $c_member_id, $page, $page_size, $event_flag, $topic_with_event);
}

function c_topic_detail_c_topic4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_topic4c_commu_topic_id($c_commu_topic_id);
}

function p_c_edit_is_topic4c_commu_id($c_commu_id)
{
	return db_commu_is_topic4c_commu_id($c_commu_id);
}

function _db_common_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)
{
	return db_commu_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id);
}

/*
function db_common_commu_status($u, $target_c_commu_id)
{
	return db_common_commu_status($u, $target_c_commu_id);
}
*/
function _db_is_c_commu_member_confirm($c_member_id, $c_commu_id)
{
	return db_commu_is_c_commu_member_confirm($c_member_id, $c_commu_id);
}

function _db_c_commu_member4c_member_id($c_member_id, $c_commu_id)
{
	return db_commu_c_commu_member4c_member_id($c_member_id, $c_commu_id);
}

function _do_c_bbs_c_commu_topic4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_commu_topic4c_commu_topic_id($c_commu_topic_id);
}

function _do_c_commu_member_confirm4c_commu_member_confirm_id($c_commu_member_confirm_id)
{
	return db_commu_c_commu_member_confirm4c_commu_member_confirm_id($c_commu_member_confirm_id);
}

function do_common_get_c_join_status($c_member_id,$c_commu_id)
{
	return db_commu_get_c_join_status($c_member_id,$c_commu_id);
}

function do_c_bbs_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)
{
	return db_commu_c_commu_topic_comment4c_commu_topic_comment_id_2($c_commu_topic_comment_id);
}

function do_common_c_commu_topic4c_commu_topic_id($c_commu_topic_id, $c_member_id)
{
	return db_commu_c_commu_topic4c_commu_topic_id_2($c_commu_topic_id, $c_member_id);
}
?><?php
function k_p_h_home_c_commu_list_lastupdate4c_member_id($c_member_id, $limit)
{
	return db_commu_c_commu_list_lastupdate4c_member_id($c_member_id, $limit);
}

function k_p_h_com_find_all_c_commu_list_lastupdated($limit = 5)
{
	return db_commu_c_commu_list_lastupdated($limit);
}

function k_p_c_bbs_c_commu_topic_name4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_commu_topic_name4c_commu_topic_id($c_commu_topic_id);
}

function k_p_c_bbs_c_commu_topic_comment_list4c_c_commu_topic_id($c_commu_topic_id, $c_member_id, $page_size, $page)
{
	return db_commu_c_commu_topic_comment_list4c_c_commu_topic_id($c_commu_topic_id, $c_member_id, $page_size, $page);
}

function k_p_c_bbs_c_commu4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_commu4c_commu_topic_id($c_commu_topic_id);
}

function k_p_c_bbs_is_admin4c_member_id_c_commu_topic_id($c_member_id, $c_commu_topic_id)
{
	return db_commu_is_admin4c_member_id_c_commu_topic_id($c_member_id, $c_commu_topic_id);
}

function k_p_c_bbs_c_member_admin4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_member_admin4c_commu_topic_id($c_commu_topic_id);
}

function k_p_fh_com_list_c_commu_list4c_member_id($c_member_id, $page_size, $page)
{
	return db_commu_c_commu_list4c_member_id_4($c_member_id, $page_size, $page);
}

function k_p_c_home_relationship_between_member_commu($c_commu_id, $c_member_id)
{
	return db_commu_relationship_between_member_commu($c_commu_id, $c_member_id);
}

function k_p_c_home_c_commu_member_list_random4c_commu_id($c_commu_id, $limit)
{
	return db_commu_c_commu_member_list_random4c_commu_id($c_commu_id, $limit);
}

function k_p_c_member_list_c_members_disp4c_commu_id($c_commu_id, $page_size, $page)
{
	return db_commu_c_members_disp4c_commu_id($c_commu_id, $page_size, $page);
}
function k_p_c_invite_c_friend_list_random4c_member_id4c_commu_id($c_member_id, $c_commu_id, $limit)
{
	return db_commu_c_friend_list_random4c_member_id4c_commu_id($c_member_id, $c_commu_id, $limit);
}


function k_p_h_home_c_commu_topic_comment_list4c_member_id($c_member_id, $page_size, $page)
{
	return db_commu_c_commu_topic_comment_list4c_member_id_3($c_member_id, $page_size, $page);
}

function k_p_h_confirm_list_anatani_c_commu_member_confirm_list4c_member_id($c_member_id)
{
	return db_commu_anatani_c_commu_member_confirm_list4c_member_id_2($c_member_id);
}
function k_p_h_confirm_list_anataga_c_commu_member_confirm_list4c_member_id($c_member_id)
{
	return db_commu_anataga_c_commu_member_confirm_list4c_member_id_2($c_member_id);
}

function mail_c_commu_topic4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_commu_topic4c_commu_topic_id_3($c_commu_topic_id);
}


function _db_c_commu_category4null()
{
	return db_commu_c_commu_category4null();
}


function p_h_com_find_all_c_commu_category_list4null()
{
	return db_commu_c_commu_category_list4null();
}


function _db_c_commu_category_parent_list4null()
{
	return db_commu_c_commu_category_parent_list4null();
}

/*
function db_commu_get_c_commu_category4id($c_commu_category_id)
{
	return db_commu_get_c_commu_category4id($c_commu_category_id)
}
*/

function k_p_h_com_category_c_commu_category_name4c_commu_category_id($c_commu_category_id)
{
	return db_commu_c_commu_category_name4c_commu_category_id($c_commu_category_id);
}


function k_p_h_com_category_c_commu_category_parent_id4c_commu_category_id($c_commu_category_id)
{
	return db_commu_c_commu_category_parent_id4c_commu_category_id($c_commu_category_id);
}


function p_h_com_find_all_search_c_commu4c_commu_category(
            $search_word,
            $c_commu_category_parent_id,
            $page_size,
            $page,
            $val_order = 'r_datetime',
            $c_commu_category_id = 0)
{
	return db_commu_search_c_commu4c_commu_category(
            $search_word,
            $c_commu_category_parent_id,
            $page_size,
            $page,
            $val_order,
            $c_commu_category_id);
}

function k_p_h_com_category_c_commu_list4c_commu_category_id_search($c_commu_category_id, $page_size, $page, $search_word)
{
	return db_commu_c_commu_list4c_commu_category_id_search($c_commu_category_id, $page_size, $page, $search_word);
}

function _db_is_c_event_admin($c_commu_topic_id, $c_member_id)
{
	return db_commu_is_c_event_admin($c_commu_topic_id, $c_member_id);
}

function _db_is_c_event_member($c_commu_topic_id, $c_member_id)
{
	return db_commu_is_c_event_member($c_commu_topic_id, $c_member_id);
}

function c_event_detail_c_topic4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
}

function c_event_detail_c_topic_write4c_commu_topic_id($c_commu_topic_id,$page,$page_size)
{
	return db_commu_c_topic_write4c_commu_topic_id($c_commu_topic_id,$page,$page_size);
}

function c_event_write_delete_confirm_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)
{
	return db_commu_c_commu_topic_comment4c_commu_topic_comment_id_3($c_commu_topic_comment_id);
}


function c_event_member_list4c_commu_topic_id($c_commu_topic_id, $page, $page_size)
{
	return db_commu_c_event_member_list4c_commu_topic_id($c_commu_topic_id, $page, $page_size);
}


function count_c_event_member_list4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_count_c_event_member_list4c_commu_topic_id($c_commu_topic_id);
}


function p_c_event_mail_list4c_commu_topic_id($c_commu_topic_id, $excepted_id = 0)
{
	return db_commu_c_event_mail_list4c_commu_topic_id($c_commu_topic_id, $excepted_id);
}

function p_c_event_mail_confirm_list4c_member_ids($c_member_ids)
{
	return db_commu_c_event_mail_confirm_list4c_member_ids($c_member_ids);
}

function p_c_event_add_year4null()
{
	return db_commu_year4null();
}


function p_common_is_c_event_member($c_commu_topic_id, $c_member_id)
{
	return db_commu_is_c_event_member_2($c_commu_topic_id, $c_member_id);
}

function p_h_home_event4c_member_id($year, $month, $day, $c_member_id)
{
	return db_commu_event4c_member_id($year, $month, $day, $c_member_id);
}


function k_p_c_event_member_list4c_commu_topic_id($c_commu_topic_id, $page_size, $page)
{
	return db_commu_c_event_member_list4c_commu_topic_id_2($c_commu_topic_id, $page_size, $page);
}


function k_p_count_c_event_member_list4c_commu_topic_id($c_commu_topic_id)
{
	return db_commu_count_c_event_member_list4c_commu_topic_id_2($c_commu_topic_id);
}


function db_c_commu4c_admin_invite_id($c_commu_id, $c_member_id_to)
{
	return db_commu_c_commu4c_admin_invite_id($c_commu_id, $c_member_id_to);
}

function p_c_commu_member_id_list4c_commu_id($c_commu_id)
{
	return db_commu_c_commu_member_id_list4c_commu_id($c_commu_id);
}

/*
function db_commu_insert_c_commu($c_member_id, $name, $c_commu_category_id, $info, $public_flag)
{
	return db_commu_insert_c_commu($c_member_id, $name, $c_commu_category_id, $info, $public_flag);
}

function function db_commu_update_c_commu($c_commu_id,
    $name, $c_commu_category_id, $info, $public_flag,
    $image_filename = '', $is_send_join_mail = 1,
    $is_display_map = null, $map_latitude = null, $map_longitude = null, $map_zoom = null);
{
	return function db_commu_update_c_commu($c_commu_id,
    $name, $c_commu_category_id, $info, $public_flag,
    $image_filename = '', $is_send_join_mail = 1,
    $is_display_map = null, $map_latitude = null, $map_longitude = null, $map_zoom = null);
    
}

function db_commu_update_c_commu_image_filename($c_commu_id, $image_filename)
{
	return db_commu_update_c_commu_image_filename($c_commu_id, $image_filename);
}

function db_commu_delete_c_commu_image_filename($c_commu_id)
{
	return db_commu_delete_c_commu_image_filename($c_commu_id);
}

function db_commu_update_c_commu_c_member_id_admin($c_commu_id, $c_member_id)
{
	return db_commu_update_c_commu_c_member_id_admin($c_commu_id, $c_member_id);
}

function db_commu_update_is_regist_join($c_commu_id, $value = 0)
{
	return db_commu_update_is_regist_join($c_commu_id, $value = 0);
}

function db_commu_delete_c_commu_member_confirm($c_commu_member_confirm_id)
{
	return db_commu_delete_c_commu_member_confirm($c_commu_member_confirm_id);
}

function db_commu_insert_c_commu_member($c_commu_member_confirm_id)
{
	return db_commu_insert_c_commu_member($c_commu_member_confirm_id);
}

function db_commu_insert_c_commu_member_confirm($c_commu_id, $c_member_id, $message = '')
{
	return db_commu_insert_c_commu_member_confirm($c_commu_id, $c_member_id, $message = '');
}

function db_commu_insert_c_commu_admin_confirm($c_commu_id, $c_member_id, $message = '')
{
	return db_commu_insert_c_commu_admin_confirm($c_commu_id, $c_member_id, $message = '');
}

function db_commu_delete_c_commu_admin_confirm4id($c_commu_admin_confirm_id)
{
	return db_commu_delete_c_commu_admin_confirm4id($c_commu_admin_confirm_id);
}

function db_commu_delete_c_commu_admin_confirm4c_commu_id($c_commu_id)
{
	return db_commu_delete_c_commu_admin_confirm4c_commu_id($c_commu_id);
}

function db_commu_delete_c_commu_topic($c_commu_topic_id)
{
	return db_commu_delete_c_commu_topic($c_commu_topic_id);
}

function db_commu_insert_c_commu_topic_comment($c_commu_id, $c_commu_topic_id, $c_member_id, $body)
{
	return db_commu_insert_c_commu_topic_comment($c_commu_id, $c_commu_topic_id, $c_member_id, $body);
}
*/

function do_c_bbs_insert_c_commu_topic_comment($c_member_id,$target_c_commu_topic_id,$body)
{
	return db_commu_insert_c_commu_topic_comment_2($c_member_id,$target_c_commu_topic_id,$body);
}

/*

function db_commu_update_c_commu_topic_comment_images($c_commu_topic_comment_id, $image_filename1, $image_filename2, $image_filename3)
{
	return db_commu_update_c_commu_topic_comment_images($c_commu_topic_comment_id, $image_filename1, $image_filename2, $image_filename3);
}

*/

function mail_update_c_commu_topic_comment_image($c_commu_topic_comment_id, $image_filename, $image_num)
{
	return db_commu_update_c_commu_topic_comment_image($c_commu_topic_comment_id, $image_filename, $image_num);
}

function do_c_bbs_delete_c_commu_topic_comment($c_commu_topic_comment_id)
{
	return db_commu_update_c_commu_topic($c_commu_topic_comment_id);
}

function do_c_event_edit_update_c_commu_topic($c_commu_topic_id, $topic)
{
	return db_commu_update_c_commu_topic_comment($c_commu_topic_id, $topic);
}


function do_c_event_edit_update_c_commu_topic_comment($c_commu_topic_id, $topic_comment)
{
	return db_commu_update_c_commu_topic_comment($c_commu_topic_id, $topic);
}

function do_c_event_edit_delete_c_commu_topic_comment_image($c_commu_topic_id, $image_num)
{
	return db_commu_delete_c_commu_topic_comment_image($c_commu_topic_id, $image_num);
}


function do_c_event_add_insert_c_commu_topic($topic)
{
	return db_commu_insert_c_commu_topic($topic);
}


function do_c_event_add_insert_c_commu_topic_comment($comment)
{
	return db_commu_insert_c_commu_topic_comment_3($comment);
}


function do_c_event_add_insert_c_event_member_as_admin($c_commu_topic_id, $c_member_id)
{
	return db_commu_insert_c_event_member_as_admin($c_commu_topic_id, $c_member_id);
}


function do_c_event_add_insert_c_event_member($c_commu_topic_id, $c_member_id)
{
	return db_commu_insert_c_event_member($c_commu_topic_id, $c_member_id);
}


function do_c_event_add_delete_c_event_member($c_commu_topic_id, $c_member_id)
{
	return db_commu_delete_c_event_member($c_commu_topic_id, $c_member_id);
}

function do_inc_join_c_commu($c_commu_id, $c_member_id)
{
	return db_commu_join_c_commu($c_commu_id, $c_member_id);
}

/*
function db_commu_delete_c_commu_member($c_commu_id, $c_member_id)
{
	return db_commu_delete_c_commu_member($c_commu_id, $c_member_id);
}
*/

function do_c_home_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc, $is_receive_message)
{
	return db_commu_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc, $is_receive_message);
}

/*

function db_commu_insert_c_commu_admin_invite($c_commu_id, $c_member_id_to)
{
	return do_c_home_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc, $is_receive_message);
}

function db_commu_delete_c_commu_admin_invite($c_commu_admin_invite_id)
{
	return do_c_home_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc, $is_receive_message);
}
*/
?>