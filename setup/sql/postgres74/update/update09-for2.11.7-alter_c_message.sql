ALTER TABLE c_message ADD COLUMN filename varchar(200);
ALTER TABLE c_message ALTER COLUMN filename SET DEFAULT '';
UPDATE c_message SET filename = '';
ALTER TABLE c_message ALTER COLUMN filename SET NOT NULL;
