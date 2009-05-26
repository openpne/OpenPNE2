ALTER TABLE c_friend ADD COLUMN is_display_friend_home smallint;
ALTER TABLE c_friend ALTER COLUMN is_display_friend_home SET DEFAULT 1;
UPDATE c_friend SET is_display_friend_home = 1;
ALTER TABLE c_friend ALTER COLUMN is_display_friend_home SET NOT NULL;
CREATE INDEX c_friend_c_member_id_from_is_display_friend_home on c_friend (c_member_id_from,is_display_friend_home);
