CREATE TABLE `c_username` (
  `c_username_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `username` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`c_username_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM;
