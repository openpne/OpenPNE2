ALTER TABLE c_diary ADD INDEX r_datetime_c_member_id (r_datetime, c_member_id);
ALTER TABLE c_diary_comment ADD INDEX r_datetime_c_diary_id_c_member_id (r_datetime, c_diary_id, c_member_id);
ALTER TABLE c_diary_comment ADD INDEX c_member_id_c_diary_id (c_member_id, c_diary_id);
