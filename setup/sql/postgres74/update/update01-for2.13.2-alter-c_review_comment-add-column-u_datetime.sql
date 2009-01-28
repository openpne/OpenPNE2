ALTER TABLE c_review_comment ADD COLUMN u_datetime timestamp;
ALTER TABLE c_review_comment ALTER COLUMN u_datetime SET DEFAULT '0000-01-01 00:00:00';
UPDATE c_review_comment SET u_datetime = '0000-01-01 00:00:00';
ALTER TABLE c_review_comment ALTER COLUMN u_datetime SET NOT NULL;

UPDATE c_review_comment SET u_datetime = r_datetime;
