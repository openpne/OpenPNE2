<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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

?>