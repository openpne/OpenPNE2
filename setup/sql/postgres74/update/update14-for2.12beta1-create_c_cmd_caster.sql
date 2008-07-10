CREATE TABLE c_cmd_caster (
  c_cmd_caster_id serial NOT NULL,
  url varchar(128) NOT NULL default '',
  title text NOT NULL,
  description text NOT NULL,
  sort_order int4 NOT NULL default '0',
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY  (c_cmd_caster_id),
  UNIQUE (url)
);

ALTER TABLE c_cmd ADD COLUMN url varchar(128) NOT NULL default '';

ALTER TABLE c_cmd DROP CONSTRAINT "c_cmd_name_key";
DROP INDEX c_cmd_name_key;

ALTER TABLE c_cmd ADD COLUMN c_cmd_caster_id int4 NOT NULL default '0';
ALTER TABLE c_cmd ADD COLUMN r_datetime timestamp NOT NULL default '0000-01-01 00:00:00';
ALTER TABLE c_cmd ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';

