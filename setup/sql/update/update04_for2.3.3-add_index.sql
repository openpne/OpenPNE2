ALTER TABLE c_commu_category_parent ADD INDEX sort_order (sort_order);
ALTER TABLE c_diary ADD INDEX r_datetime (r_datetime);
ALTER TABLE c_diary_comment ADD INDEX c_member_id_r_datetime_c_diary_id (c_member_id, r_datetime, c_diary_id);
ALTER TABLE c_profile_pref ADD INDEX sort_order (sort_order);
ALTER TABLE c_rss_cache ADD INDEX r_datetime (r_datetime);
ALTER TABLE c_rss_cache ADD INDEX r_datetime_c_member_id (r_datetime, c_member_id);
