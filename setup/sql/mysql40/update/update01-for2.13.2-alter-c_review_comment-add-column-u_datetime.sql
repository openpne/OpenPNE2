ALTER TABLE c_review_comment ADD COLUMN u_datetime datetime NOT NULL default '0000-00-00 00:00:00';

UPDATE c_review_comment SET u_datetime = r_datetime;
