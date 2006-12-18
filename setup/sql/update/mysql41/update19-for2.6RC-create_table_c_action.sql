CREATE TABLE c_action (
  c_action_id bigint(20) NOT NULL auto_increment,
  name text NOT NULL,
  point bigint(20) NOT NULL default '0',
  PRIMARY KEY  (c_action_id)
) TYPE=MyISAM;


CREATE TABLE c_rank (
  c_rank_id bigint(20) NOT NULL auto_increment,
  name text NOT NULL,
  image_filename text NOT NULL,
  point bigint(20) NOT NULL default '0',
  PRIMARY KEY  (c_rank_id)
) TYPE=MyISAM;
