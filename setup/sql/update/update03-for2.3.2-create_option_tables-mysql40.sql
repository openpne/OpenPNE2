CREATE TABLE `c_session` (
  `c_session_id` int(11) NOT NULL auto_increment,
  `sess_name` varchar(64) NOT NULL default '',
  `sess_id` varchar(32) NOT NULL default '',
  `sess_time` int(11) NOT NULL default '0',
  `sess_data` text NOT NULL,
  PRIMARY KEY  (`c_session_id`),
  UNIQUE KEY `sess_name` (`sess_name`,`sess_id`)
) TYPE=MyISAM;
CREATE TABLE `c_tmp_image` (
  `c_tmp_image_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` text,
  PRIMARY KEY  (`c_tmp_image_id`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM;
