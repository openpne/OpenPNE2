ALTER TABLE c_member_secure ADD COLUMN sess_id varchar(32) NOT NULL default '';
ALTER TABLE c_admin_user ADD COLUMN sess_id varchar(32) NOT NULL default '';
