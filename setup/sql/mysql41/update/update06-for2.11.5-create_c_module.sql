/*!40101 SET NAMES utf8 */;

CREATE TABLE `c_module` (
  `c_module_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `is_enabled` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_module_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

