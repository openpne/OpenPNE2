ALTER TABLE c_commu_member ADD COLUMN is_display_topic_home smallint;
ALTER TABLE c_commu_member ALTER COLUMN is_display_topic_home SET DEFAULT 1;
UPDATE c_commu_member SET is_display_topic_home = 1;
ALTER TABLE c_commu_member ALTER COLUMN is_display_topic_home SET NOT NULL;
CREATE INDEX c_commu_member_c_member_id_is_display_topic_home ON c_commu_member (c_member_id,is_display_topic_home);
