ALTER TABLE c_member ADD COLUMN sess_id varchar(32);
ALTER TABLE c_member ALTER COLUMN sess_id SET DEFAULT '';
UPDATE c_member SET sess_id = '';
ALTER TABLE c_member ALTER COLUMN sess_id SET NOT NULL;
