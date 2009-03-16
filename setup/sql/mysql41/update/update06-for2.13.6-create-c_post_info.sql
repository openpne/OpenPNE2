CREATE TABLE `c_post_info` (
  `c_post_info_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `last_post_time` int(11) NOT NULL default '0',
  `last_post_count` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_post_info_id`),
  KEY  `c_member_id` (`c_member_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

