<?php
function p_h_ashiato_c_ashiato_list4c_member_id($c_member_id_to, $count)
{
	return db_ashiato_c_ashiato_list4c_member_id($c_member_id_to, $count);
}
function p_h_ashiato_c_ashiato_num4c_member_id($c_member_id)
{
	return db_ashiato_c_ashiato_num4c_member_id($c_member_id);
}
function p_h_ashiato_ashiato_mail_num4c_member_id($c_member_id)
{
	return db_ashiato_ashiato_mail_num4c_member_id($c_member_id);
}
function p_h_bookmark_list($c_member_id, $page, $page_size)
{
	return db_bookmark_list($c_member_id, $page, $page_size);
}
//------------------------------------------------------------------
function p_h_home_h_blog_list_friend4c_member_id($c_member_id, $page_size = 5)
{
	return db_rss_h_blog_list_friend4c_member_id($c_member_id, $page_size);	
}
function p_h_diary_list_all_c_rss_cache_list($limit)
{
	return db_rss_list_all_c_rss_cache_list($limit);
}
function p_h_diary_list_friend_c_rss_cache_list($c_member_id, $limit)
{
	return db_rss_list_friend_c_rss_cache_list($c_member_id, $limit);
}
function p_fh_diary_list_c_rss_cache_list($c_member_id,$page_size, $page)
{
	return db_rss_list_c_rss_cache_list($c_member_id,$page_size, $page);
}
function p_fh_diary_list_c_rss_cache_list_date($c_member_id, $year, $month, $day=0)
{
	return db_rss_list_c_rss_cache_list_date($c_member_id, $year, $month, $day);
}
function p_f_home_c_rss_cache_list4c_member_id($c_member_id, $limit = 5)
{
	return db_rss_c_rss_cache_list4c_member_id($c_member_id);
}
function db_is_duplicated_rss_cache($c_member_id, $date, $link)
{
	return db_rss_is_duplicated_rss_cache($c_member_id, $date, $link);
}
function db_is_updated_rss_cache($c_member_id, $link)
{
	return db_rss_is_updated_rss_cache($c_member_id, $link);
}
function db_is_future_rss_item($date)
{
	return db_rss_is_future_rss_item($date);
}
function db_insert_c_rss_cache($c_member_id, $subject, $body, $date, $link)
{
	return db_rss_insert_c_rss_cache($c_member_id, $subject, $body, $date, $link);
}
function db_update_c_rss_cache($c_rss_cache_id, $subject, $body, $date, $link)
{
	return db_rss_update_c_rss_cache($c_rss_cache_id, $subject, $body, $date, $link);
}
function delete_rss_cache($c_member_id)
{
	return db_rss_delete_rss_cache($c_member_id);
}
function insert_rss_cache($rss_url, $c_member_id)
{
	return db_rss_insert_rss_cache($rss_url, $c_member_id);
}
//-------------------------schedule---------------------------------

function p_h_calendar_c_schedule_list4date($year, $month, $day, $c_member_id)
{
	return db_schedule_c_schedule_list4date($year, $month, $day, $c_member_id);
}

function p_common_c_schedule4c_schedule_id($c_schedule_id)
{
	return db_schedule_c_schedule4c_schedule_id($c_schedule_id)	;
}
function p_h_calendar_birth4c_member_id($month, $c_member_id)
{
	return db_schedule_birth4c_member_id($month, $c_member_id);
}
function p_h_calendar_event4c_member_id($year, $month, $c_member_id)
{
	return db_schedule_event4c_member_id($year, $month, $c_member_id);	
}
function do_h_schedule_add_insert_c_schedule(
    $c_member_id, $title, $body,
    $start_date, $start_time,
    $end_date, $end_time,
    $is_receive_mail)
{
	return db_schedule_add_insert_c_schedule(
    $c_member_id, $title, $body,
    $start_date, $start_time,
    $end_date, $end_time,
    $is_receive_mail);
}
function do_h_schedule_edit_update_c_schedule(
    $c_member_id, $title, $body,
    $start_date, $start_time,
    $end_date, $end_time,
    $is_receive_mail,
    $c_schedule_id)
{
	return db_schedule_edit_update_c_schedule(
    $c_member_id, $title, $body,
    $start_date, $start_time,
    $end_date, $end_time,
    $is_receive_mail,
    $c_schedule_id);
}
function do_h_schedule_delte_delete_c_schedule4c_schedule_id($c_schedule_id)
{
	return db_schedule_delete_c_schedule4c_schedule_id($c_schedule_id);
}




?>