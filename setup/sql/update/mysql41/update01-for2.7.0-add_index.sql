ALTER TABLE c_message ADD INDEX c_member_id_to_is_read_is_send(c_member_id_to, is_read, is_send);
ALTER TABLE c_commu_topic ADD INDEX r_datetime_c_commu_id(r_datetime, c_commu_id);
