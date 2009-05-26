ALTER TABLE c_commu_member ADD COLUMN is_display_topic_home tinyint(1) NOT NULL default 1;
CREATE INDEX c_member_id_is_display_topic_home ON c_commu_member (c_member_id, is_display_topic_home);
