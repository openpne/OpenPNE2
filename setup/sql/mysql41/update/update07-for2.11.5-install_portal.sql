/*!40101 SET NAMES utf8 */;

DROP TABLE IF EXISTS `portal_config`;
CREATE TABLE `portal_config` (
  `portal_config_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`portal_config_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_layout`;
CREATE TABLE `portal_layout` (
  `portal_layout_id` int(11) NOT NULL auto_increment,
  `content_name` varchar(64) NOT NULL,
  `position` int(11) NOT NULL,
  `is_image` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`portal_layout_id`),
  UNIQUE KEY `content_name` (`content_name`),
  UNIQUE KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_free_area`;
CREATE TABLE `portal_free_area` (
  `portal_free_area_id` int(11) NOT NULL auto_increment,
  `html` text NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`portal_free_area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_rss`;
CREATE TABLE `portal_rss` (
  `portal_rss_id` int(11) NOT NULL auto_increment,
  `url` text NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`portal_rss_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_link`;
CREATE TABLE `portal_link` (
  `portal_link_id` int(11) NOT NULL auto_increment,
  `title` varchar(64) NOT NULL,
  `url` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  `is_target_blank` tinyint(4) NOT NULL default '0',
  `is_enabled` tinyint(4) default NULL default '0',
  PRIMARY KEY  (`portal_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_image`;
CREATE TABLE `portal_image` (
  `portal_image_id` int(11) NOT NULL auto_increment,
  `image_filename` text NOT NULL,
  PRIMARY KEY  (`portal_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_layout_ktai`;
CREATE TABLE `portal_layout_ktai` (
  `portal_layout_ktai_id` int(11) NOT NULL auto_increment,
  `content_name` varchar(64) NOT NULL,
  `position` int(11) NOT NULL default '0',
  PRIMARY KEY  (`portal_layout_ktai_id`),
  UNIQUE KEY `content_name` (`content_name`),
  UNIQUE KEY `postion` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `portal_free_area_ktai`;
CREATE TABLE `portal_free_area_ktai` (
  `portal_free_area_ktai_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `html` text NOT NULL,
  PRIMARY KEY  (`portal_free_area_ktai_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `portal_config` VALUES
  (1,'USE_PORTAL','0'),
  (2,'HEAD_TEXT_TYPE','0'),
  (3,'HEAD_TEXT',''),
  (4,'LAYOUT_TYPE','2'),
  (5,'COLOR_TYPE','005_openpne_blue');

INSERT IGNORE INTO `c_module` VALUES(NULL, 'portal', 1);

