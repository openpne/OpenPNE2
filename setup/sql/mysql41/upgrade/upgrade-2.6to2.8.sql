/*!40101 SET NAMES utf8 */;

-- update01
ALTER TABLE c_message ADD INDEX c_member_id_to_is_read_is_send(c_member_id_to, is_read, is_send);
ALTER TABLE c_commu_topic ADD INDEX r_datetime_c_commu_id(r_datetime, c_commu_id);

-- update02

INSERT INTO `c_review_category` (category,category_disp,sort_order) VALUES ('hpc-jp','ヘルス＆ビューティー',12);

-- update03

ALTER TABLE `c_commu` ADD COLUMN `is_adult` tinyint(1) NOT NULL DEFAULT '0';

-- update04

ALTER TABLE `c_commu_topic` ADD COLUMN `capacity` int(11) NOT NULL DEFAULT '0' after `event_flag`;

-- update05

ALTER TABLE `c_free_page` ADD COLUMN `title` text NOT NULL DEFAULT '' after `c_free_page_id`;
ALTER TABLE `c_free_page` ADD COLUMN `type` enum('pc','ktai') NOT NULL default 'pc' after `body`;
ALTER TABLE `c_free_page` ADD COLUMN `auth` tinyint(1) NOT NULL DEFAULT 1 after `type`;
ALTER TABLE `c_free_page` CHANGE COLUMN `body` `body` MEDIUMTEXT NOT NULL DEFAULT '';

-- update06

ALTER TABLE c_commu_topic_comment ADD INDEX r_datetime_c_commu_id(r_datetime, c_commu_id);

-- update07

CREATE TABLE `c_black_list` (
 `c_black_list_id` int(11) NOT NULL auto_increment,
 `address` blob NOT NULL,
 `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
 `memo` text NOT NULL,
  PRIMARY KEY  (`c_black_list_id`),
  UNIQUE KEY `address` (`address`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- update08

ALTER TABLE `c_commu_topic_comment` ADD COLUMN `filename` varchar(200) NOT NULL DEFAULT '' after `image_filename3`;

CREATE TABLE `c_file` (
  `c_file_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` text,
  PRIMARY KEY  (`c_file_id`),
  KEY `filename` (`filename`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- update09

INSERT INTO c_cmd VALUES (NULL,'r.tabelog.com',127);
INSERT INTO c_cmd VALUES (NULL,'maps.google.com',127);
INSERT INTO c_cmd VALUES (NULL,'maps.google.co.jp',127);
INSERT INTO c_cmd VALUES (NULL,'www.google.com',127);
INSERT INTO c_cmd VALUES (NULL,'www.google.co.jp',127);

-- update10

ALTER TABLE c_file DROP COLUMN type;
ALTER TABLE c_file ADD (original_filename text);

-- update11

INSERT INTO c_cmd VALUES (NULL,'blog-apart.com',127);
INSERT INTO c_cmd VALUES (NULL,'livlyisland',127);
INSERT INTO c_cmd VALUES (NULL,'tagfriends',127);
INSERT INTO c_cmd VALUES (NULL,'www.blog-apart.com',127);
INSERT INTO c_cmd VALUES (NULL,'slurl.com',127);
INSERT INTO c_cmd VALUES (NULL,'www.netprice.co.jp',127);

-- update12

DROP TABLE `c_black_list`;

-- update13

ALTER TABLE `c_commu` DROP COLUMN `is_adult`;

-- update14

CREATE TABLE `c_tmp_file` (
  `c_tmp_file_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `original_filename` text,
  PRIMARY KEY  (`c_tmp_file_id`),
  KEY `filename` (`filename`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- update15

UPDATE `c_action` SET name = '入会する' WHERE c_action_id = 1;
UPDATE `c_action` SET name = '自分の日記にコメントされる' WHERE c_action_id = 2;
UPDATE `c_action` SET name = '他人の日記にコメントする' WHERE c_action_id = 3;
UPDATE `c_action` SET name = '日記を書く' WHERE c_action_id = 4;
UPDATE `c_action` SET name = 'マイフレンドの紹介文を書く' WHERE c_action_id = 5;
UPDATE `c_action` SET name = 'レビューを書く' WHERE c_action_id = 6;
UPDATE `c_action` SET name = '友人を招待する' WHERE c_action_id = 7;
UPDATE `c_action` SET name = 'マイフレンドにメンバーを紹介する' WHERE c_action_id = 8;
INSERT INTO `c_action` VALUES (9,'コミュニティにトピックを作成する',0);
INSERT INTO `c_action` VALUES (10,'コミュニティにイベントを作成する',0);
INSERT INTO `c_action` VALUES (11,'コミュニティのトピック・イベントにコメントする',0);

-- update16

DELETE FROM biz_schedule_member
  USING biz_schedule_member, biz_schedule
  WHERE biz_schedule.biz_group_id > 0
    AND biz_schedule.biz_schedule_id = biz_schedule_member.biz_schedule_id;

INSERT INTO biz_schedule_member(c_member_id, biz_schedule_id)
  SELECT biz_group_member.c_member_id, biz_schedule.biz_schedule_id
    FROM biz_schedule, biz_group_member
    WHERE biz_schedule.biz_group_id > 0
      AND biz_schedule.biz_group_id = biz_group_member.biz_group_id;

UPDATE biz_schedule SET public_flag = 'private'
  WHERE public_flag = 'group';

-- misc

DELETE FROM `c_admin_config` WHERE name IN ('OPENPNE_USE_POINT_RANK', 'OPENPNE_DISP_POINT', 'OPENPNE_DISP_RANK');
INSERT INTO `c_admin_config` VALUES (NULL, 'OPENPNE_USE_POINT_RANK', '1');
INSERT INTO `c_admin_config` VALUES (NULL, 'OPENPNE_DISP_POINT', '0');
INSERT INTO `c_admin_config` VALUES (NULL, 'OPENPNE_DISP_RANK', '0');
