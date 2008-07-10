ALTER TABLE c_member_pre ADD COLUMN login_id varchar(255);
ALTER TABLE c_member_pre ALTER COLUMN login_id SET DEFAULT '';
UPDATE c_member_pre SET login_id = '';
ALTER TABLE c_member_pre ALTER COLUMN login_id SET NOT NULL;
