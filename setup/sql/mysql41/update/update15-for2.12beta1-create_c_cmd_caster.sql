/*!40101 SET NAMES utf8 */;

CREATE TABLE `c_cmd_caster` (
  `c_cmd_caster_id` int(11) NOT NULL auto_increment,
  `url` varchar(128) NOT NULL default '',
  `title` text NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  `is_enabled` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_cmd_caster_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `c_cmd` ADD COLUMN `url` varchar(128) NOT NULL default '';
ALTER TABLE `c_cmd` DROP INDEX `name`;
ALTER TABLE `c_cmd` DROP INDEX `name_2`;
ALTER TABLE `c_cmd` ADD COLUMN `c_cmd_caster_id` int(11) NOT NULL default '0';
ALTER TABLE `c_cmd` ADD COLUMN `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00';
ALTER TABLE `c_cmd` ADD COLUMN `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00';

