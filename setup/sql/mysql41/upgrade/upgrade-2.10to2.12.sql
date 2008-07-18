/*!40101 SET NAMES utf8 */;

-- update01
ALTER TABLE c_pc_address_pre CHANGE COLUMN c_pc_addess_pre_id c_pc_address_pre_id int(11) NOT NULL auto_increment;

-- update02
UPDATE `c_review_category` SET `category` = 'Books' WHERE `category` = 'books-jp';
UPDATE `c_review_category` SET `category` = 'ForeignBooks' WHERE `category` = 'books-us';
UPDATE `c_review_category` SET `category` = 'Music' WHERE `category` = 'music-jp';
UPDATE `c_review_category` SET `category` = 'Classical' WHERE `category` = 'classical-jp';
UPDATE `c_review_category` SET `category` = 'DVD' WHERE `category` = 'dvd-jp';
UPDATE `c_review_category` SET `category` = 'VideoGames' WHERE `category` = 'videogames-jp';
UPDATE `c_review_category` SET `category` = 'Software' WHERE `category` = 'software-jp';
UPDATE `c_review_category` SET `category` = 'Electronics' WHERE `category` = 'electronics-jp';
UPDATE `c_review_category` SET `category` = 'Kitchen' WHERE `category` = 'kitchen-jp';
UPDATE `c_review_category` SET `category` = 'Toys' WHERE `category` = 'toys-jp';
UPDATE `c_review_category` SET `category` = 'SportingGoods' WHERE `category` = 'sporting-goods-jp';
UPDATE `c_review_category` SET `category` = 'HealthPersonalCare' WHERE `category` = 'hpc-jp';
INSERT IGNORE INTO `c_review_category` VALUES (NULL,'Watches','時計',13);
INSERT IGNORE INTO `c_review_category` VALUES (NULL,'Baby','ベビー＆マタニティ',14);
INSERT IGNORE INTO `c_review_category` VALUES (NULL,'Apparel','アパレル＆シューズ',15);

-- update03
UPDATE `c_commu` SET `info` = CONCAT(`info`, 'http://maps.google.co.jp/maps?ll=', `map_latitude`, ',', `map_longitude`, '&z=', `map_zoom`) WHERE `is_display_map` = 1;

ALTER TABLE `c_commu` DROP COLUMN `is_display_map`;
ALTER TABLE `c_commu` DROP COLUMN `map_latitude`;
ALTER TABLE `c_commu` DROP COLUMN `map_longitude`;
ALTER TABLE `c_commu` DROP COLUMN `map_zoom`;

-- update04
CREATE INDEX c_member_id_c_member_id_block on c_access_block(c_member_id,c_member_id_block);
CREATE INDEX c_member_id_block ON c_access_block(c_member_id_block);

CREATE INDEX c_review_id_r_datetime ON c_review_comment(c_review_id,r_datetime);
CREATE INDEX c_member_id_r_datetime ON c_review_comment(c_member_id,r_datetime);

CREATE INDEX c_commu_id_c_memer_id_to ON c_commu_admin_invite(c_commu_id,c_member_id_to);

-- update05
ALTER TABLE c_member_pre ADD COLUMN login_id varchar(255) NOT NULL default '';

-- update06
DROP TABLE IF EXISTS `c_module`;
CREATE TABLE `c_module` (
  `c_module_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `is_enabled` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_module_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- update07
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

-- update08
DROP TABLE IF EXISTS `c_config_decoration`;
CREATE TABLE `c_config_decoration` (
  `c_config_decoration_id` int(11) NOT NULL auto_increment,
  `tagname` text NOT NULL,
  `caption` text NOT NULL,
  `sample` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_config_decoration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `c_config_decoration` VALUES (NULL,'op:b','太字','<strong>表示例</strong>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:u','下線','<ins>表示例</ins>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:s','取り消し線','<del>表示例</del>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:i','斜体','<em>表示例</em>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:large','大きめの文字','<span style="font-size:20px;">表示例</span>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:small','小さめの文字','<span style="font-size:8px;">表示例</span>',1);
INSERT INTO `c_config_decoration` VALUES (NULL,'op:color','文字色指定','<span style="color:#33F864;">表示例</span>',1);

INSERT IGNORE INTO `c_admin_config` VALUES (NULL,'OPENPNE_USE_DECORATION',1);

-- update09, update16, update17
DROP TABLE IF EXISTS `c_member_config`;
CREATE TABLE `c_member_config` (
  `c_member_config_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`c_member_config_id`),
  KEY `c_member_id` (`c_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- update10
ALTER TABLE c_message ADD COLUMN filename varchar(200) NOT NULL default '';

-- update11
DROP TABLE IF EXISTS `c_album`;
CREATE TABLE `c_album` (
  `c_album_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `subject` text NOT NULL,
  `description` text NOT NULL,
  `album_cover_image` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `public_flag` enum('public','friend','private') NOT NULL default 'public',
  PRIMARY KEY  (`c_album_id`),
  KEY `c_member_id` (`c_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_album_image`;
CREATE TABLE `c_album_image` (
  `c_album_image_id` int(11) NOT NULL auto_increment,
  `c_album_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `image_filename` text NOT NULL,
  `image_description` text NOT NULL,
  `filesize` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_album_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- update12
ALTER IGNORE TABLE c_member ADD COLUMN public_flag_birth_month_day enum('public','friend','private') NOT NULL default 'public' AFTER public_flag_birth_year;
ALTER IGNORE TABLE c_member_pre ADD COLUMN public_flag_birth_month_day enum('public','friend','private') NOT NULL default 'public' AFTER public_flag_birth_year;

-- update13, update14, update19
ALTER TABLE c_commu_topic ADD COLUMN u_datetime datetime NOT NULL default '0000-00-00 00:00:00';

DROP INDEX r_datetime_c_commu_id ON c_commu_topic;
CREATE INDEX r_datetime_c_commu_id ON c_commu_topic(c_commu_id,u_datetime);

CREATE INDEX c_commu_id_c_member_id ON c_commu_member(c_commu_id,c_member_id);

DROP TABLE IF EXISTS `tmp_c_commu_topic`;
CREATE TABLE `tmp_c_commu_topic` (
  `c_commu_topic_id` int(11) NOT NULL default '0',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_commu_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO tmp_c_commu_topic (c_commu_topic_id, u_datetime)
  (SELECT cct.c_commu_topic_id, MAX(cctc.r_datetime) as u_datetime
     FROM c_commu_topic_comment AS cctc ,c_commu_topic AS cct
     WHERE cctc.c_commu_topic_id = cct.c_commu_topic_id 
     GROUP BY cct.c_commu_topic_id);

UPDATE c_commu_topic INNER JOIN tmp_c_commu_topic USING (c_commu_topic_id)
 SET c_commu_topic.u_datetime = tmp_c_commu_topic.u_datetime;

DROP TABLE tmp_c_commu_topic;

DROP TABLE IF EXISTS `c_diary_comment_log`;
CREATE TABLE `c_diary_comment_log` (
  `c_diary_comment_log_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_diary_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_diary_comment_log_id`),
  KEY `c_member_id_r_datetime` (`c_member_id`,`r_datetime`),
  KEY `c_diary_id` (`c_diary_id`),
  KEY `c_diary_id_r_datetime` (`c_diary_id`,`r_datetime`),
  KEY `c_member_id_c_diary_id` (`c_member_id`,`c_diary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tmp_c_diary_comment_log;
CREATE TABLE `tmp_c_diary_comment_log` (
  `c_diary_comment_log_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_diary_id`  int(11) NOT NULL default '0',
  `r_datetime`  datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (`c_diary_comment_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO tmp_c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, c_member_id, c_diary_id, MAX(r_datetime) AS r_datetime
    FROM c_diary_comment
    GROUP BY c_member_id, c_diary_id
    ORDER BY r_datetime);

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, tmp_c_diary_comment_log.c_member_id, tmp_c_diary_comment_log.c_diary_id, 
    tmp_c_diary_comment_log.r_datetime as r_datetime
    FROM tmp_c_diary_comment_log
    INNER JOIN c_diary USING (c_diary_id) 
    WHERE tmp_c_diary_comment_log.c_member_id <> c_diary.c_member_id
    ORDER BY r_datetime);

DROP TABLE `tmp_c_diary_comment_log`;

-- update15
DROP TABLE IF EXISTS `c_cmd_caster`;
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

-- update18
CREATE INDEX `c_album_id` ON `c_album_image`(`c_album_id`);

