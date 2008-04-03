CREATE TABLE `c_blacklist` (
  `c_blacklist_id` int(11) NOT NULL auto_increment,
  `easy_access_id` blob NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`c_blacklist_id`)
) TYPE=MyISAM;