ALTER TABLE c_commu ADD COLUMN is_admit varchar(20);
ALTER TABLE c_commu ADD COLUMN is_open varchar(20);
ALTER TABLE c_commu ADD COLUMN is_topic varchar(20);
ALTER TABLE c_commu ADD COLUMN is_comment varchar(20);

ALTER TABLE c_commu ALTER COLUMN is_admit SET DEFAULT 'public';
ALTER TABLE c_commu ALTER COLUMN is_open SET DEFAULT 'public';
ALTER TABLE c_commu ALTER COLUMN is_topic SET DEFAULT 'member';
ALTER TABLE c_commu ALTER COLUMN is_comment SET DEFAULT 'member';
UPDATE c_commu SET is_admit='public',is_open='public',is_topic='member',is_comment='member';
UPDATE c_commu SET is_admit='auth',is_open='public' WHERE public_flag='auth_public';
UPDATE c_commu SET is_admit='auth',is_open='public' WHERE public_flag='auth_sns';
UPDATE c_commu SET is_admit='auth',is_open='member' WHERE public_flag='auth_commu_member';
UPDATE c_commu SET is_topic='admin_only' WHERE topic_authority='admin_only';

ALTER TABLE c_commu ALTER COLUMN is_admit SET NOT NULL;
ALTER TABLE c_commu ALTER COLUMN is_open SET NOT NULL;
ALTER TABLE c_commu ALTER COLUMN is_topic SET NOT NULL;
ALTER TABLE c_commu ALTER COLUMN is_comment SET NOT NULL;
