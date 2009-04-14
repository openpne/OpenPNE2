ALTER TABLE c_friend ADD COLUMN is_display_friend_home tinyint(1) NOT NULL default 1;
CREATE INDEX c_member_id_from_is_display_friend_home ON c_friend(c_member_id_from, is_display_friend_home);
