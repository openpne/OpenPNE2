ALTER TABLE c_bookmark ADD COLUMN after_field timestamp NOT NULL default '0000-01-01 00:00:00';
UPDATE c_bookmark SET after_field = to_timestamp(r_datetime, 'YYYY-MM-DD HH24:MI:SS');
ALTER TABLE c_bookmark DROP r_datetime;
ALTER TABLE c_bookmark RENAME after_field TO r_datetime;
