CREATE TABLE c_point_log (
  c_point_log_id int(11) NOT NULL auto_increment,
  c_member_id int(11) NOT NULL default '0',
  `point` int(11) NOT NULL default '0',
  memo text NOT NULL,
  r_datetime datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (c_point_log_id),
  KEY c_member_id (c_member_id),
  KEY r_datetime (r_datetime),
  KEY c_member_id_2 (c_member_id,r_datetime)
) TYPE=MyISAM;

CREATE TABLE c_point_log_tag (
  c_point_log_tag_id int(11) NOT NULL auto_increment,
  c_point_log_id int(11) NOT NULL default '0',
  tag varchar(100) NOT NULL default '',
  PRIMARY KEY  (c_point_log_tag_id),
  KEY c_point_log_id (c_point_log_id),
  KEY tag (tag),
  KEY c_point_log_id_2 (c_point_log_id,tag)
) TYPE=MyISAM;

INSERT INTO c_profile (name, caption, is_required, public_flag_edit, public_flag_default, form_type, sort_order, disp_regist, disp_config, disp_search, val_type)
 VALUES ('PNE_POINT', 'ポイント', 0, 0, 'private', 'text', 1000, 0, 0, 0, 'int');
