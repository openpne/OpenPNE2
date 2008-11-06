<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//point.phpは変更点ナシ

//ranking.php
function p_h_ranking_c_ashiato_ranking($limit = 10)
{
    return db_ranking_c_ashiato_ranking($limit);
}

function p_h_ranking_c_friend_ranking($limit = 10)
{
    return db_ranking_c_friend_ranking($limit);
}

function p_h_ranking_c_commu_member_ranking($limit = 10)
{
    return db_ranking_c_commu_member_ranking($limit);
}

function p_h_ranking_c_commu_topic_comment_ranking($limit = 10)
{
    return db_ranking_c_commu_topic_comment_ranking($limit);
}

//review.php

function p_h_home_c_friend_review_list4c_member_id($c_member_id, $limit)
{
    return db_review_c_friend_review_list4c_member_id($c_member_id, $limit);
}

function p_h_home_c_friend_review_list_more4c_member_id($c_member_id, $page, $page_size)
{
    return db_review_c_friend_review_list_more4c_member_id($c_member_id, $page, $page_size);
}

function p_c_home_new_commu_review4c_commu_id($c_commu_id , $limit)
{
    return db_review_new_commu_review4c_commu_id($c_commu_id , $limit);
}

function p_h_review_add_category_disp()
{
    return do_review_review_add_category_disp();
}

function p_h_review_add_search_result($keyword, $category_id, $page)
{
    return do_review_add_search_result($keyword, $category_id, $page);
}

function p_h_review_write_product4asin($asin)
{
    return db_review_write_product4asin($asin);
}

/**
 * orderby:
 *      r_datetime  => 作成順
 *      r_num       => 登録数順
 */
function p_h_review_search_result4keyword_category($keyword, $category_id , $orderby, $page = 1, $page_size = 30)
{
    return db_review_search_result4keyword_category($keyword, $category_id , $orderby, $page, $page_size);
}

function p_h_review_list_product_c_review4c_review_id($c_review_id)
{
    return db_review_list_product_c_review4c_review_id($c_review_id);
}

function p_h_review_list_product_c_review_list4c_review_id($c_review_id, $page, $page_size=30)
{
    return db_review_list_product_c_review_list4c_review_id($c_review_id, $page, $page_size);
}

function p_fh_review_list_product_c_review_list4c_member_id($c_member_id, $page, $page_size=30)
{
    return db_review_list_product_c_review_list4c_member_id($c_member_id, $page, $page_size);
}

function p_h_review_add_write_c_review_comment4asin_c_member_id($asin, $c_member_id)
{
    return db_review_add_write_c_review_comment4asin_c_member_id($asin, $c_member_id);
}

function p_h_review_clip_list_h_review_clip_list4c_member_id($c_member_id, $page, $page_size=30)
{
    return db_review_clip_list_h_review_clip_list4c_member_id($c_member_id, $page, $page_size);
}

function p_c_member_review_c_member_review4c_commu_id($c_commu_id, $page, $page_size=20)
{
    return db_review_c_member_review_c_member_review4c_commu_id($c_commu_id, $page, $page_size);
}

function c_member_review_add_confirm_c_member_review4c_review_id($c_review_id, $c_member_id)
{
   return db_review_c_member_review_add_confirm_c_member_review4c_review_id($c_review_id, $c_member_id);
}

function do_c_review_add_c_review_category_id4category($category)
{
    return db_review_c_review_add_c_review_category_id4category($category);
}

function do_h_review_edit_c_review_comment4c_review_comment_id_c_member_id($c_review_comment_id, $c_member_id)
{
    return db_review_edit_c_review_comment4c_review_comment_id_c_member_id($c_review_comment_id, $c_member_id);
}

function do_h_review_clip_add_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id)
{
    return db_review_clip_add_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id);
}

function do_c_member_review_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id, $c_commu_id)
{
    return db_review_c_member_review_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id, $c_commu_id);
}

function do_h_review_edit_c_review4c_review_comment_id($c_review_comment_id)
{
    return db_review_edit_c_review4c_review_comment_id($c_review_comment_id);
}

function do_common_c_review_id4c_review_comment_id($c_review_comment_id)
{
    return db_review_common_c_review_id4c_review_comment_id($c_review_comment_id);
}

function do_common_count_c_review_comment4c_review_id($c_review_id)
{
    return db_review_count_c_review_comment4c_review_id($c_review_id);
}

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
function _db_count_c_commu_member_list4c_commu_id($c_commu_id)
{
    return db_commu_count_c_commu_member_list4c_commu_id($c_commu_id);
}

function p_common_count_c_commu4c_member_id($c_member_id)
{
    return db_commu_count_c_commu4c_member_id($c_member_id);
}

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
    return db_commu_c_members4c_commu_id($c_commu_id, $page_size,$page);
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

function p_h_com_comment_list_c_commu_topic_comment_list4c_member_id($c_member_id, $limit, $page)
{
    return db_commu_c_commu_topic_comment_list4c_member_id_2($c_member_id, $limit,$page);
}

function p_h_home_c_commu_list4c_member_id($c_member_id, $limit)
{
    return db_commu_c_commu_list4c_member_id_2($c_member_id, $limit);
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

function do_c_bbs_insert_c_commu_topic_comment($c_member_id,$target_c_commu_topic_id,$body)
{
    return db_commu_insert_c_commu_topic_comment_2($c_member_id,$target_c_commu_topic_id,$body);
}


function mail_update_c_commu_topic_comment_image($c_commu_topic_comment_id, $image_filename, $image_num)
{
    return db_commu_update_c_commu_topic_comment_image($c_commu_topic_comment_id, $image_filename, $image_num);
}

function do_c_bbs_delete_c_commu_topic_comment($c_commu_topic_comment_id)
{
    return db_commu_delete_c_commu_topic_comment($c_commu_topic_comment_id);
}

function do_c_event_edit_update_c_commu_topic($c_commu_topic_id, $topic)
{
    return db_commu_update_c_commu_topic($c_commu_topic_id, $topic);
}


function do_c_event_edit_update_c_commu_topic_comment($c_commu_topic_id, $topic_comment)
{
    return db_commu_update_c_commu_topic_comment($c_commu_topic_id, $topic_comment);
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

function do_c_home_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc, $is_receive_message)
{
    return db_commu_update_is_receive_mail($c_commu_id, $c_member_id, $is_receive_mail, $is_receive_mail_pc, $is_receive_message);
}

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
    return db_schedule_c_schedule4c_schedule_id($c_schedule_id)    ;
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
                $is_shinobiashi,
                $schedule_start_day)
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
                $is_shinobiashi,
                $schedule_start_day);
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
