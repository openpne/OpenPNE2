ALTER TABLE c_diary ADD INDEX c_member_id_r_datetime_public_flag(c_member_id, r_datetime, public_flag);
ALTER TABLE c_commu ADD INDEX c_commu_category_id_r_datetime(c_commu_category_id, r_datetime);