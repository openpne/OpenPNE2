ALTER TABLE c_commu ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';
ALTER TABLE c_diary ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';
ALTER TABLE c_member ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';
ALTER TABLE c_schedule ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';

UPDATE c_commu SET u_datetime = r_datetime;
UPDATE c_diary SET u_datetime = r_datetime;
UPDATE c_member SET u_datetime = r_date;