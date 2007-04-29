CREATE TABLE `c_black_list` (
 `c_black_list_id` int(11) NOT NULL auto_increment,
 `address` blob NOT NULL,
 `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
 `memo` text NOT NULL,
  PRIMARY KEY  (`c_black_list_id`),
  UNIQUE KEY `address` (`address`(100))
) TYPE=MyISAM ;
