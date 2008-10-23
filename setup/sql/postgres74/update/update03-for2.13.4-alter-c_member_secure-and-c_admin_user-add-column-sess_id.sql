ALTER TABLE c_member_secure ADD COLUMN sess_id varchar(32);
ALTER TABLE c_member_secure ALTER COLUMN sess_id SET DEFAULT '';
UPDATE c_member_secure SET sess_id = '';
ALTER TABLE c_member_secure ALTER COLUMN sess_id SET NOT NULL;

ALTER TABLE c_admin_user ADD COLUMN sess_id varchar(32);
ALTER TABLE c_admin_user ALTER COLUMN sess_id SET DEFAULT '';
UPDATE c_admin_user SET sess_id = '';
ALTER TABLE c_admin_user ALTER COLUMN sess_id SET NOT NULL;
