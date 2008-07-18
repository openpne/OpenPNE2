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

ALTER TABLE c_cmd ADD COLUMN url varchar(128);
ALTER TABLE c_cmd ALTER COLUMN url SET DEFAULT '';
UPDATE c_cmd SET url = '';
ALTER TABLE c_cmd ALTER COLUMN url SET NOT NULL;

ALTER TABLE c_cmd DROP CONSTRAINT "c_cmd_name_key";
DROP INDEX c_cmd_name_2;

ALTER TABLE c_cmd ADD COLUMN c_cmd_caster_id int4;
ALTER TABLE c_cmd ALTER COLUMN c_cmd_caster_id SET DEFAULT '0';
UPDATE c_cmd SET c_cmd_caster_id = '0';
ALTER TABLE c_cmd ALTER COLUMN c_cmd_caster_id SET NOT NULL;

ALTER TABLE c_cmd ADD COLUMN r_datetime timestamp;
ALTER TABLE c_cmd ALTER COLUMN r_datetime SET DEFAULT '0000-01-01 00:00:00';
UPDATE c_cmd SET r_datetime = '0000-01-01 00:00:00';
ALTER TABLE c_cmd ALTER COLUMN r_datetime SET NOT NULL;

ALTER TABLE c_cmd ADD COLUMN u_datetime timestamp;
ALTER TABLE c_cmd ALTER COLUMN u_datetime SET DEFAULT '0000-01-01 00:00:00';
UPDATE c_cmd SET u_datetime = '0000-01-01 00:00:00';
ALTER TABLE c_cmd ALTER COLUMN u_datetime SET NOT NULL;
