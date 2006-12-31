CREATE TABLE `c_cmd` (
  `c_cmd_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `permit` int NOT NULL DEFAULT 0,
  PRIMARY KEY  (`c_cmd_id`),
  KEY `name` (`name`(100)),
  UNIQUE KEY (`name`(100))
) ENGINE=MyISAM;
