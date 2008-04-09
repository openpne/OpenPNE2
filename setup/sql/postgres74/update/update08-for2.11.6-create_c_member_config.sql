CREATE TABLE c_member_config (
  c_member_config_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_member_config_option_id int4 NOT NULL default '0',
  value text NOT NULL,
  PRIMARY KEY  (c_member_config_id)
);

CREATE TABLE c_member_config_option (
  c_member_config_option_id serial NOT NULL,
  name varchar(64) NOT NULL default '',
  PRIMARY KEY  (c_member_config_option_id),
  UNIQUE (name)
);

INSERT INTO c_member_config_option VALUES (nextval('c_member_config_option_c_member_config_option_id_seq'),'SEND_COMMENT_MAIL_KTAI');

