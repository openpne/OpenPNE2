ALTER TABLE c_commu ADD COLUMN is_admit enum('public','auth') NOT NULL default 'public';
ALTER TABLE c_commu ADD COLUMN is_open enum('public','member') NOT NULL default 'public';
ALTER TABLE c_commu ADD COLUMN is_topic enum('member','admin_only','public') NOT NULL default 'member';
ALTER TABLE c_commu ADD COLUMN is_comment enum('member','public') NOT NULL default 'member';

UPDATE c_commu SET is_admit='public',is_open='public',is_comment='member' WHERE public_flag='public';
UPDATE c_commu SET is_admit='admit',is_open='public',is_comment='member' WHERE public_flag='auth_public';
UPDATE c_commu SET is_admit='admit',is_open='public',is_comment='member' WHERE public_flag='auth_sns';
UPDATE c_commu SET is_admit='admit',is_open='member',is_comment='member' WHERE public_flag='auth_commu_member';

UPDATE c_commu SET is_topic='member' WHERE topic_authority='public';
UPDATE c_commu SET is_topic='admin_only' WHERE topic_authority='admin_only';
