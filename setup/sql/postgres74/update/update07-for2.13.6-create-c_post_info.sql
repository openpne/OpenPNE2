CREATE TABLE c_post_info (
  c_post_info_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  last_post_time int4 NOT NULL default '0',
  last_post_info int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_post_info_id)
);
CREATE INDEX c_post_info_c_member_id on c_post_info (c_member_id);
