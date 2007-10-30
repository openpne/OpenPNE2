-- update02
ALTER IGNORE TABLE `c_diary_comment` ADD COLUMN `number` int(11) NOT NULL default '0';

DROP TABLE IF EXISTS `tmp_c_diary_comment`;
CREATE TABLE `tmp_c_diary_comment` (
  `c_diary_comment_id` int(11) NOT NULL auto_increment,
  `number` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_diary_comment_id`)
) TYPE=MyISAM;

INSERT INTO tmp_c_diary_comment (c_diary_comment_id, number)
  (SELECT dc1.c_diary_comment_id, COUNT(*)
     FROM c_diary_comment AS dc1, c_diary_comment AS dc2
     WHERE dc1.c_diary_id = dc2.c_diary_id
       AND dc1.c_diary_comment_id >= dc2.c_diary_comment_id
     GROUP BY dc1.c_diary_comment_id);

UPDATE c_diary_comment INNER JOIN tmp_c_diary_comment USING (c_diary_comment_id)
 SET c_diary_comment.number = tmp_c_diary_comment.number;
 
DROP TABLE tmp_c_diary_comment;

-- update03
ALTER IGNORE TABLE c_diary_category ADD INDEX c_member_id_c_diary_category_id(c_member_id, c_diary_category_id);
ALTER IGNORE TABLE c_diary_category ADD INDEX category_name_c_member_id(category_name(20), c_member_id);
ALTER IGNORE TABLE c_diary_category_diary ADD INDEX c_diary_category_id(c_diary_category_id);
ALTER IGNORE TABLE c_diary_category_diary ADD INDEX c_diary_id(c_diary_id);

-- update04
ALTER IGNORE TABLE `c_commu` ADD COLUMN `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00';
ALTER IGNORE TABLE `c_diary` ADD COLUMN `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00';
ALTER IGNORE TABLE `c_member` ADD COLUMN `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00';
ALTER IGNORE TABLE `c_schedule` ADD COLUMN `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00';

UPDATE `c_commu` SET u_datetime = r_datetime;
UPDATE `c_diary` SET u_datetime = r_datetime;
UPDATE `c_member` SET u_datetime = r_date;

-- update06 / update09 / update16
INSERT IGNORE INTO `c_profile` VALUES (NULL,'PNE_MY_NEWS','My News','',0,0,'private','text',1000,0,0,0,'','',0,0);
INSERT IGNORE INTO `c_profile` VALUES (NULL,'PNE_MY_NEWS_DATETIME','My News（更新記録）','',0,0,'private','text',1000,0,0,0,'','',0,0);

-- update07
ALTER TABLE c_image TYPE=MyISAM MAX_ROWS=190000;

-- update11
DROP TABLE IF EXISTS `c_blacklist`;
CREATE TABLE `c_blacklist` (
  `c_blacklist_id` int(11) NOT NULL auto_increment,
  `easy_access_id` blob NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`c_blacklist_id`)
) TYPE=MyISAM;

-- update12
DELETE FROM c_image WHERE filename IN ('skin_no_image_master.gif','skin_no_logo_master.gif','skin_no_logo_small_master.gif');

-- update13
DELETE FROM c_cmd WHERE permit = 127;

-- update15
INSERT IGNORE INTO `c_admin_config` VALUES (NULL,'OPENPNE_USE_KTAI_LOGO','0');

-- update17
ALTER IGNORE TABLE `c_member_pre` ADD COLUMN `ktai_session` varchar(255) NOT NULL default '';
ALTER IGNORE TABLE `c_member_pre` ADD COLUMN `is_disabled_regist_easy_access_id` tinyint(1) NOT NULL default '0';
ALTER IGNORE TABLE `c_member_ktai_pre` ADD COLUMN `is_disabled_regist_easy_access_id` tinyint(1) NOT NULL default '0';

-- update21
DROP TABLE IF EXISTS `c_config_color`;
CREATE TABLE `c_config_color` (
  `c_config_color_id` int(11) NOT NULL auto_increment,
  `color_0` char(6) NOT NULL default '',
  `color_1` char(6) NOT NULL default '',
  `color_2` char(6) NOT NULL default '',
  `color_3` char(6) NOT NULL default '',
  `color_4` char(6) NOT NULL default '',
  `color_5` char(6) NOT NULL default '',
  `color_6` char(6) NOT NULL default '',
  `color_7` char(6) NOT NULL default '',
  `color_8` char(6) NOT NULL default '',
  `color_9` char(6) NOT NULL default '',
  `color_10` char(6) NOT NULL default '',
  `color_11` char(6) NOT NULL default '',
  `color_12` char(6) NOT NULL default '',
  `color_13` char(6) NOT NULL default '',
  `color_14` char(6) NOT NULL default '',
  `color_15` char(6) NOT NULL default '',
  `color_16` char(6) NOT NULL default '',
  `color_17` char(6) NOT NULL default '',
  `color_18` char(6) NOT NULL default '',
  `color_19` char(6) NOT NULL default '',
  `color_20` char(6) NOT NULL default '',
  `color_21` char(6) NOT NULL default '',
  `color_22` char(6) NOT NULL default '',
  `color_23` char(6) NOT NULL default '',
  `color_24` char(6) NOT NULL default '',
  `color_25` char(6) NOT NULL default '',
  `color_26` char(6) NOT NULL default '',
  `color_27` char(6) NOT NULL default '',
  `color_28` char(6) NOT NULL default '',
  `color_29` char(6) NOT NULL default '',
  `color_30` char(6) NOT NULL default '',
  `color_31` char(6) NOT NULL default '',
  `color_32` char(6) NOT NULL default '',
  `color_33` char(6) NOT NULL default '',
  `color_34` char(6) NOT NULL default '',
  `color_35` char(6) NOT NULL default '',
  `color_36` char(6) NOT NULL default '',
  `color_37` char(6) NOT NULL default '',
  `color_38` char(6) NOT NULL default '',
  `color_39` char(6) NOT NULL default '',
  `color_40` char(6) NOT NULL default '',
  `color_41` char(6) NOT NULL default '',
  `color_42` char(6) NOT NULL default '',
  `color_43` char(6) NOT NULL default '',
  `color_44` char(6) NOT NULL default '',
  `color_45` char(6) NOT NULL default '',
  `color_46` char(6) NOT NULL default '',
  `color_47` char(6) NOT NULL default '',
  `color_48` char(6) NOT NULL default '',
  `color_49` char(6) NOT NULL default '',
  `color_50` char(6) NOT NULL default '',
  `caption` char(32) NOT NULL default '',
  PRIMARY KEY  (`c_config_color_id`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `c_config_color_ktai`;
CREATE TABLE `c_config_color_ktai` (
  `c_config_color_ktai_id` int(11) NOT NULL auto_increment,
  `color_0` char(6) NOT NULL default '',
  `color_1` char(6) NOT NULL default '',
  `color_2` char(6) NOT NULL default '',
  `color_3` char(6) NOT NULL default '',
  `color_4` char(6) NOT NULL default '',
  `color_5` char(6) NOT NULL default '',
  `color_6` char(6) NOT NULL default '',
  `color_7` char(6) NOT NULL default '',
  `color_8` char(6) NOT NULL default '',
  `color_9` char(6) NOT NULL default '',
  `color_10` char(6) NOT NULL default '',
  `color_11` char(6) NOT NULL default '',
  `color_12` char(6) NOT NULL default '',
  `color_13` char(6) NOT NULL default '',
  `color_14` char(6) NOT NULL default '',
  `color_15` char(6) NOT NULL default '',
  `color_16` char(6) NOT NULL default '',
  `color_17` char(6) NOT NULL default '',
  `color_18` char(6) NOT NULL default '',
  `color_19` char(6) NOT NULL default '',
  `color_20` char(6) NOT NULL default '',
  `color_21` char(6) NOT NULL default '',
  `color_22` char(6) NOT NULL default '',
  `color_23` char(6) NOT NULL default '',
  `color_24` char(6) NOT NULL default '',
  `color_25` char(6) NOT NULL default '',
  `color_26` char(6) NOT NULL default '',
  `color_27` char(6) NOT NULL default '',
  `color_28` char(6) NOT NULL default '',
  `color_29` char(6) NOT NULL default '',
  `color_30` char(6) NOT NULL default '',
  `color_31` char(6) NOT NULL default '',
  `color_32` char(6) NOT NULL default '',
  `color_33` char(6) NOT NULL default '',
  `color_34` char(6) NOT NULL default '',
  `color_35` char(6) NOT NULL default '',
  `color_36` char(6) NOT NULL default '',
  `color_37` char(6) NOT NULL default '',
  `color_38` char(6) NOT NULL default '',
  `color_39` char(6) NOT NULL default '',
  `color_40` char(6) NOT NULL default '',
  `color_41` char(6) NOT NULL default '',
  `color_42` char(6) NOT NULL default '',
  `color_43` char(6) NOT NULL default '',
  `color_44` char(6) NOT NULL default '',
  `color_45` char(6) NOT NULL default '',
  `color_46` char(6) NOT NULL default '',
  `color_47` char(6) NOT NULL default '',
  `color_48` char(6) NOT NULL default '',
  `color_49` char(6) NOT NULL default '',
  `color_50` char(6) NOT NULL default '',
  `caption` char(32) NOT NULL default '',
  PRIMARY KEY  (`c_config_color_ktai_id`)
) TYPE=MyISAM;

INSERT INTO c_config_color (color_0, color_1, color_2, color_3, color_4, color_5, color_6, color_7, color_8, color_9, color_10, color_11, color_12, color_13, color_14, color_15, color_16, color_17, color_18, caption)
 SELECT symbol, border_01, border_07, border_10, bg_00, bg_01, bg_02, bg_03, bg_04, bg_05, bg_06, bg_07, bg_08, bg_09, bg_10, bg_11, bg_12, bg_13, bg_14, caption
   FROM c_sns_config ORDER BY c_sns_config_id;

DROP TABLE IF EXISTS `c_sns_config`;

INSERT IGNORE INTO `c_config_color_ktai` VALUES 
  (1,'FFFFFF','FFFFFF','0D6DDF','DDDDDD','EEEEFF','7DDADF','E0EAEF','FFFFFF','C49FFF','DCD1EF','FFFFFF','0D6DDF','B3CEEF','BFA4EF','000000','0000FF','0000FF','800080','EEEEEE','999966','0C5F0F','C49FFF','FF0000','','','','','','','','','','','','','','','','','','','','','','','','','','','','','現在の設定');

INSERT IGNORE INTO `c_admin_config` VALUES (NULL, 'OPENPNE_USE_FLASH_LIST', '1');

INSERT IGNORE INTO `c_admin_config` VALUES (NULL, 'OPENPNE_SKIN_THEME', '900_openpne_ver28');
