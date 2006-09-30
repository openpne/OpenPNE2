-- update01
ALTER TABLE c_diary ADD INDEX r_datetime_c_member_id (r_datetime, c_member_id);
ALTER TABLE c_diary_comment ADD INDEX r_datetime_c_diary_id_c_member_id (r_datetime, c_diary_id, c_member_id);
ALTER TABLE c_diary_comment ADD INDEX c_member_id_c_diary_id (c_member_id, c_diary_id);

-- update02
ALTER TABLE c_commu ADD INDEX(r_datetime);
ALTER TABLE c_commu_member ADD INDEX c_commu_id_r_datetime(c_commu_id, r_datetime);
ALTER TABLE c_diary ADD INDEX c_member_id_r_date(c_member_id, r_date);
ALTER TABLE c_diary ADD INDEX c_member_id_r_datetime(c_member_id, r_datetime);
ALTER TABLE c_diary_comment ADD INDEX c_diary_id_r_datetime(c_diary_id, r_datetime);
ALTER TABLE c_friend ADD INDEX c_member_id_from_c_friend_id(c_member_id_from, c_friend_id);
ALTER TABLE c_friend ADD INDEX c_member_id_from_r_datetime(c_member_id_from, r_datetime);
ALTER TABLE c_friend ADD INDEX c_member_id_to_r_datetime_intro(c_member_id_to, r_datetime_intro);
ALTER TABLE c_member ADD INDEX birth_year_c_member_id(birth_year, c_member_id);
ALTER TABLE c_member_profile ADD INDEX c_profile_option_id_c_member_id(c_profile_option_id, c_member_id);
ALTER TABLE c_member_profile ADD INDEX public_flag_c_profile_option_id(public_flag, c_profile_option_id);
ALTER TABLE c_message ADD INDEX c_member_id_from_r_datetime(c_member_id_from, r_datetime);
ALTER TABLE c_message ADD INDEX c_member_id_to_r_datetime(c_member_id_to, r_datetime);
ALTER TABLE c_profile_option ADD INDEX c_profile_id_sort_order(c_profile_id, sort_order);
ALTER TABLE c_rss_cache ADD INDEX c_member_id_r_datetime(c_member_id, r_datetime);

-- update03
CREATE TABLE IF NOT EXISTS `c_session` (
  `c_session_id` int(11) NOT NULL auto_increment,
  `sess_name` varchar(64) NOT NULL default '',
  `sess_id` varchar(32) NOT NULL default '',
  `sess_time` int(11) NOT NULL default '0',
  `sess_data` text NOT NULL,
  PRIMARY KEY  (`c_session_id`),
  UNIQUE KEY `sess_name` (`sess_name`,`sess_id`)
) TYPE=MyISAM;

CREATE TABLE IF NOT EXISTS `c_tmp_image` (
  `c_tmp_image_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` text,
  PRIMARY KEY  (`c_tmp_image_id`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM;

-- update04
ALTER TABLE c_commu_category_parent ADD INDEX sort_order (sort_order);
ALTER TABLE c_diary ADD INDEX r_datetime (r_datetime);
ALTER TABLE c_diary_comment ADD INDEX c_member_id_r_datetime_c_diary_id (c_member_id, r_datetime, c_diary_id);
ALTER TABLE c_profile_pref ADD INDEX sort_order (sort_order);
ALTER TABLE c_rss_cache ADD INDEX r_datetime (r_datetime);
ALTER TABLE c_rss_cache ADD INDEX r_datetime_c_member_id (r_datetime, c_member_id);

-- update05
ALTER TABLE `c_diary_comment` ADD `image_filename_1` TEXT NOT NULL ,
ADD `image_filename_2` TEXT NOT NULL ,
ADD `image_filename_3` TEXT NOT NULL ;

-- update06
ALTER TABLE `c_sns_config` CHANGE `c_sns_config_id` `c_sns_config_id` INT( 11 ) NOT NULL AUTO_INCREMENT;

-- update07
ALTER TABLE `c_commu` ADD `is_display_map` BOOL NOT NULL,
ADD `map_latitude` DOUBLE NOT NULL ,
ADD `map_longitude` DOUBLE NOT NULL ,
ADD `map_zoom` INT NOT NULL ;

ALTER TABLE `c_profile_pref` ADD `map_latitude` DOUBLE NOT NULL ,
ADD `map_longitude` DOUBLE NOT NULL ,
ADD `map_zoom` INT NOT NULL ;
ALTER TABLE `c_profile_pref` ADD INDEX `map_latitude_map_longitude` ( `map_latitude` , `map_longitude` ) ;

UPDATE c_profile_pref SET map_latitude = '43.068612', map_longitude = '141.350768', map_zoom = 7 WHERE c_profile_pref_id = 1;
UPDATE c_profile_pref SET map_latitude = '40.828668', map_longitude = '140.734738', map_zoom = 7 WHERE c_profile_pref_id = 2;
UPDATE c_profile_pref SET map_latitude = '39.701547', map_longitude = '141.136599', map_zoom = 7 WHERE c_profile_pref_id = 3;
UPDATE c_profile_pref SET map_latitude = '38.260027', map_longitude = '140.882158', map_zoom = 7 WHERE c_profile_pref_id = 4;
UPDATE c_profile_pref SET map_latitude = '39.716748', map_longitude = '140.129931', map_zoom = 7 WHERE c_profile_pref_id = 5;
UPDATE c_profile_pref SET map_latitude = '38.248098', map_longitude = '140.327253', map_zoom = 7 WHERE c_profile_pref_id = 6;
UPDATE c_profile_pref SET map_latitude = '37.754123', map_longitude = '140.45968' , map_zoom = 7 WHERE c_profile_pref_id = 7;
UPDATE c_profile_pref SET map_latitude = '36.370911', map_longitude = '140.47676' , map_zoom = 7 WHERE c_profile_pref_id = 8;
UPDATE c_profile_pref SET map_latitude = '36.559246', map_longitude = '139.898389', map_zoom = 7 WHERE c_profile_pref_id = 9;
UPDATE c_profile_pref SET map_latitude = '36.383399', map_longitude = '139.072833', map_zoom = 7 WHERE c_profile_pref_id = 10;
UPDATE c_profile_pref SET map_latitude = '35.906439', map_longitude = '139.62405' , map_zoom = 7 WHERE c_profile_pref_id = 11;
UPDATE c_profile_pref SET map_latitude = '35.613425', map_longitude = '140.112837', map_zoom = 7 WHERE c_profile_pref_id = 12;
UPDATE c_profile_pref SET map_latitude = '35.681391', map_longitude = '139.766103', map_zoom = 7 WHERE c_profile_pref_id = 13;
UPDATE c_profile_pref SET map_latitude = '35.465941', map_longitude = '139.622847', map_zoom = 7 WHERE c_profile_pref_id = 14;
UPDATE c_profile_pref SET map_latitude = '37.912299', map_longitude = '139.060869', map_zoom = 7 WHERE c_profile_pref_id = 15;
UPDATE c_profile_pref SET map_latitude = '36.701384', map_longitude = '137.213091', map_zoom = 7 WHERE c_profile_pref_id = 16;
UPDATE c_profile_pref SET map_latitude = '36.578117', map_longitude = '136.648166', map_zoom = 7 WHERE c_profile_pref_id = 17;
UPDATE c_profile_pref SET map_latitude = '36.061479', map_longitude = '136.223261', map_zoom = 7 WHERE c_profile_pref_id = 18;
UPDATE c_profile_pref SET map_latitude = '35.667054', map_longitude = '138.569015', map_zoom = 7 WHERE c_profile_pref_id = 19;
UPDATE c_profile_pref SET map_latitude = '36.643307', map_longitude = '138.189101', map_zoom = 7 WHERE c_profile_pref_id = 20;
UPDATE c_profile_pref SET map_latitude = '35.409967', map_longitude = '136.756324', map_zoom = 7 WHERE c_profile_pref_id = 21;
UPDATE c_profile_pref SET map_latitude = '34.971629', map_longitude = '138.388579', map_zoom = 7 WHERE c_profile_pref_id = 22;
UPDATE c_profile_pref SET map_latitude = '35.170694', map_longitude = '136.881637', map_zoom = 7 WHERE c_profile_pref_id = 23;
UPDATE c_profile_pref SET map_latitude = '34.734418', map_longitude = '136.510581', map_zoom = 7 WHERE c_profile_pref_id = 24;
UPDATE c_profile_pref SET map_latitude = '35.002997', map_longitude = '135.864651', map_zoom = 7 WHERE c_profile_pref_id = 25;
UPDATE c_profile_pref SET map_latitude = '34.985705', map_longitude = '135.758228', map_zoom = 7 WHERE c_profile_pref_id = 26;
UPDATE c_profile_pref SET map_latitude = '34.702398', map_longitude = '135.495188', map_zoom = 7 WHERE c_profile_pref_id = 27;
UPDATE c_profile_pref SET map_latitude = '34.679453', map_longitude = '135.178221', map_zoom = 7 WHERE c_profile_pref_id = 28;
UPDATE c_profile_pref SET map_latitude = '34.680482', map_longitude = '135.818935', map_zoom = 7 WHERE c_profile_pref_id = 29;
UPDATE c_profile_pref SET map_latitude = '34.232436', map_longitude = '135.191454', map_zoom = 7 WHERE c_profile_pref_id = 30;
UPDATE c_profile_pref SET map_latitude = '35.493953', map_longitude = '134.225901', map_zoom = 7 WHERE c_profile_pref_id = 31;
UPDATE c_profile_pref SET map_latitude = '35.463947', map_longitude = '133.063871', map_zoom = 7 WHERE c_profile_pref_id = 32;
UPDATE c_profile_pref SET map_latitude = '34.666572', map_longitude = '133.918552', map_zoom = 7 WHERE c_profile_pref_id = 33;
UPDATE c_profile_pref SET map_latitude = '34.397446', map_longitude = '132.475593', map_zoom = 7 WHERE c_profile_pref_id = 34;
UPDATE c_profile_pref SET map_latitude = '34.172649', map_longitude = '131.48061' , map_zoom = 7 WHERE c_profile_pref_id = 35;
UPDATE c_profile_pref SET map_latitude = '34.074572', map_longitude = '134.551391', map_zoom = 7 WHERE c_profile_pref_id = 36;
UPDATE c_profile_pref SET map_latitude = '34.350754', map_longitude = '134.046821', map_zoom = 7 WHERE c_profile_pref_id = 37;
UPDATE c_profile_pref SET map_latitude = '33.839954', map_longitude = '132.751149', map_zoom = 7 WHERE c_profile_pref_id = 38;
UPDATE c_profile_pref SET map_latitude = '33.566758', map_longitude = '133.543522', map_zoom = 7 WHERE c_profile_pref_id = 39;
UPDATE c_profile_pref SET map_latitude = '33.590002', map_longitude = '130.420622', map_zoom = 7 WHERE c_profile_pref_id = 40;
UPDATE c_profile_pref SET map_latitude = '33.264212', map_longitude = '130.297608', map_zoom = 7 WHERE c_profile_pref_id = 41;
UPDATE c_profile_pref SET map_latitude = '32.753085', map_longitude = '129.870515', map_zoom = 7 WHERE c_profile_pref_id = 42;
UPDATE c_profile_pref SET map_latitude = '32.789207', map_longitude = '130.688499', map_zoom = 7 WHERE c_profile_pref_id = 43;
UPDATE c_profile_pref SET map_latitude = '33.232794', map_longitude = '131.606595', map_zoom = 7 WHERE c_profile_pref_id = 44;
UPDATE c_profile_pref SET map_latitude = '31.915323', map_longitude = '131.432083', map_zoom = 7 WHERE c_profile_pref_id = 45;
UPDATE c_profile_pref SET map_latitude = '31.602098', map_longitude = '130.564112', map_zoom = 7 WHERE c_profile_pref_id = 46;
UPDATE c_profile_pref SET map_latitude = '26.212401', map_longitude = '127.680932', map_zoom = 7 WHERE c_profile_pref_id = 47;

-- update08
ALTER TABLE `c_sns_config`
ADD `bg_11` TEXT NOT NULL,
ADD `bg_12` TEXT NOT NULL,
ADD `bg_13` TEXT NOT NULL ,
ADD `caption` varchar(100)  NOT NULL,
ADD `symbol` TEXT NOT NULL;

UPDATE `c_sns_config` SET 
bg_11 = 'C1C6CF',bg_12 = 'FFFFFF',bg_13 = 'E9EAF0',caption = '戻す',symbol='E9EAF0'
WHERE c_sns_config_id=1;

INSERT INTO `c_sns_config` VALUES
(2,'red',    'FFFFFF','DCAA9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','DCAA9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','DCAA9D','FFFFFF','FFFFFF','DCAA9D','FFFFFF','DCAA9D','DCAA9D','FFFFFF','FFFFFF','DCAA9D','E5A6A6','FFFFFF','FAE1DB','赤','E66161'),
(3,'yellow', 'FFFFFF','E9DC90','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','E9DC90','FFFFFF','FFFFFF','FFFFFF','FFFFFF','E9DC90','FFFFFF','FFFFFF','E9DC90','FFFFFF','E9DC90','E9DC90','FFFFFF','FFFFFF','E9DC90','F2D299','FFFFFF','FFF9D6','黄色','FFDE1E'),
(4,'green',  'FFFFFF','AEDC9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','AEDC9D','FFFFFF','FFFFFF','FFFFFF','FFFFFF','AEDC9D','FFFFFF','FFFFFF','AEDC9D','FFFFFF','AEDC9D','AEDC9D','FFFFFF','FFFFFF','AEDC9D','C5E5A6','FFFFFF','E3FADB','緑','6FDD46'),
(5,'gold',   'FFFFFF','C6C4B7','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C6C4B7','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C6C4B7','FFFFFF','FFFFFF','C6C4B7','FFFFFF','C6C4B7','C6C4B7','FFFFFF','FFFFFF','C6C4B7','CFCAC1','FFFFFF','F0EFE9','黄金','DEC079'),
(6,'water',  'FFFFFF','95CEEA','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','95CEEA','FFFFFF','FFFFFF','FFFFFF','FFFFFF','95CEEA','FFFFFF','FFFFFF','95CEEA','FFFFFF','95CEEA','95CEEA','FFFFFF','FFFFFF','95CEEA','9BE6F0','FFFFFF','D6F2FF','水色','2BD1E7'),
(7,'purple', 'FFFFFF','C29EE3','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C29EE3','FFFFFF','FFFFFF','FFFFFF','FFFFFF','C29EE3','FFFFFF','FFFFFF','C29EE3','FFFFFF','C29EE3','C29EE3','FFFFFF','FFFFFF','C29EE3','BCA7EC','FFFFFF','EEDCFE','紫','8A1EEA'),
(8,'default','FFFFFF','B7B9C6','FFFFFF','FFFFFF','FFFFFF','FFFFFF','FFFFFF','B7B9C6','FFFFFF','FFFFFF','FFFFFF','FFFFFF','B7B9C6','FFFFFF','FFFFFF','B7B9C6','FFFFFF','B7B9C6','B7B9C6','FFFFFF','FFFFFF','B7B9C6','C1C6CF','FFFFFF','E9EAF0','初期設定','E9EAF0');

-- update09
ALTER TABLE c_commu_member add `is_receive_message` int(11) NOT NULL default '1';

-- update10
ALTER TABLE c_message add `image_filename_1` text NOT NULL;
ALTER TABLE c_message add `image_filename_2` text NOT NULL;
ALTER TABLE c_message add `image_filename_3` text NOT NULL;

-- update11
CREATE TABLE mail_queue (
  id bigint(20) NOT NULL default '0',
  create_time datetime NOT NULL default '0000-00-00 00:00:00',
  time_to_send datetime NOT NULL default '0000-00-00 00:00:00',
  sent_time datetime default NULL,
  id_user bigint(20) NOT NULL default '0',
  ip varchar(20) NOT NULL default 'unknown',
  sender varchar(50) NOT NULL default '',
  recipient varchar(50) NOT NULL default '',
  headers text NOT NULL,
  body longtext NOT NULL,
  try_sent tinyint(4) NOT NULL default '0',
  delete_after_send tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY id (id),
  KEY time_to_send (time_to_send),
  KEY id_user (id_user)
) TYPE=MyISAM;

CREATE TABLE mail_queue_seq (
  id int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (id)
) TYPE=MyISAM;

INSERT INTO mail_queue_seq (id) VALUES (1);

-- update12
ALTER TABLE `c_member` CHANGE COLUMN `public_flag_diary` `public_flag_diary` enum('public','friend','private') NOT NULL default 'public';
ALTER TABLE `c_diary` ADD COLUMN `public_flag` enum('public','friend','private') NOT NULL default 'public';
UPDATE c_diary INNER JOIN c_member USING (c_member_id) SET c_diary.public_flag = c_member.public_flag_diary ;

-- update15
INSERT INTO `c_admin_config` values (NULL,'OPENPNE_ENABLE_ROLLOVER',0);