/*!40101 SET NAMES utf8 */;

CREATE TABLE `c_cmd_caster` (
  `c_cmd_caster_id` int(11) NOT NULL auto_increment,
  `url` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`c_cmd_caster_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

