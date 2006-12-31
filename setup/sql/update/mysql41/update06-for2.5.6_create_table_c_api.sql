CREATE TABLE `c_api` (
  `c_api_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `ip` text,
  PRIMARY KEY  (`c_api_id`),
  KEY `name` (`name`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
