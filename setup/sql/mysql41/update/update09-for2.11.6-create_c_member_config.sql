/*!40101 SET NAMES utf8 */;

CREATE TABLE `c_member_config` (
  `c_member_config_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_member_config_option_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`c_member_config_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_member_config_option_id` (`c_member_config_option_id`),
  KEY `c_member_config_option_id_c_member_id` (`c_member_config_option_id`,`c_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `c_member_config_option` (
  `c_member_config_option_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`c_member_config_option_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `c_member_config_option` VALUES (NULL,'SEND_DIARY_COMMENT_MAIL_KTAI');

