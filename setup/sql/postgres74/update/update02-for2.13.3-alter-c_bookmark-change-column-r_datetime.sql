ALTER TABLE c_bookmark ADD COLUMN after_field timestamp;
ALTER TABLE c_bookmark ALTER COLUMN after_field SET default '0000-01-01 00:00:00';
UPDATE C_bookmark SET after_field = '0000-01-01 00:00:00';
ALTER TABLE c_bookmark ALTER COLUMN after_field SET NOT NULL;
UPDATE c_bookmark SET after_field = to_timestamp(r_datetime, 'YYYY-MM-DD HH24:MI:SS');
ALTER TABLE c_bookmark DROP r_datetime;
ALTER TABLE c_bookmark RENAME after_field TO r_datetime;
