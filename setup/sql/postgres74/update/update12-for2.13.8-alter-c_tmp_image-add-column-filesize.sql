ALTER TABLE c_tmp_image ADD COLUMN filesize int4;
ALTER TABLE c_tmp_image ALTER COLUMN filesize SET DEFAULT 0;
ALTER TABLE c_tmp_image ALTER COLUMN filesize SET NOT NULL;

