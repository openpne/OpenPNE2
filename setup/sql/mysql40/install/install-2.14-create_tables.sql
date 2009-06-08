CREATE TABLE `biz_admin_config` (
  `biz_admin_config_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`biz_admin_config_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_group` (
  `biz_group_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `info` text NOT NULL,
  `admin_id` int(11) NOT NULL default '0',
  `image_filename` text NOT NULL,
  PRIMARY KEY  (`biz_group_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_group_member` (
  `biz_group_member_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `biz_group_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`biz_group_member_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_schedule` (
  `biz_schedule_id` int(11) NOT NULL auto_increment,
  `title` mediumtext NOT NULL,
  `c_member_id` int(11) NOT NULL default '0',
  `begin_date` date NOT NULL default '0000-00-00',
  `finish_date` date NOT NULL default '0000-00-00',
  `begin_time` time default NULL,
  `finish_time` time default NULL,
  `value` mediumtext NOT NULL,
  `rep_type` int(11) NOT NULL default '0',
  `rep_first` int(11) NOT NULL default '0',
  `is_read` int(11) NOT NULL default '0',
  `public_flag` enum('public','group','private') NOT NULL default 'public',
  `biz_group_id` int(11) default NULL,
  PRIMARY KEY  (`biz_schedule_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_schedule_member` (
  `biz_schedule_member_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `biz_schedule_id` int(11) NOT NULL default '0',
  `is_read` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`biz_schedule_member_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_shisetsu` (
  `biz_shisetsu_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `image_filename` text NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`biz_shisetsu_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_shisetsu_schedule` (
  `biz_shisetsu_schedule_id` int(11) NOT NULL auto_increment,
  `biz_shisetsu_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `begin_time` time NOT NULL default '00:00:00',
  `finish_time` time NOT NULL default '00:00:00',
  PRIMARY KEY  (`biz_shisetsu_schedule_id`)
) TYPE=MyISAM;

CREATE TABLE `biz_todo` (
  `biz_todo_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `memo` text NOT NULL,
  `is_check` tinyint(1) NOT NULL default '0',
  `writer_id` int(11) NOT NULL default '0',
  `sort_order` int(11) NOT NULL default '0',
  `r_datetime` datetime default NULL,
  `due_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `finish_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `priority` int(11) NOT NULL default '3',
  `public_flag` enum('public','group','private') NOT NULL default 'public',
  `biz_group_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`biz_todo_id`)
) TYPE=MyISAM;

CREATE TABLE `c_access_block` (
  `c_access_block_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_member_id_block` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_access_block_id`),
  KEY `c_member_id_c_member_id_block` (`c_member_id`,`c_member_id_block`),
  KEY `c_member_id_block` (`c_member_id_block`)
) TYPE=MyISAM;

CREATE TABLE `c_access_log` (
  `c_access_log_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `page_name` varchar(100) NOT NULL default '',
  `target_c_member_id` int(11) default '0',
  `target_c_commu_id` int(11) default '0',
  `target_c_commu_topic_id` int(11) default '0',
  `target_c_diary_id` int(11) default '0',
  `ktai_flag` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_access_log_id`)
) TYPE=MyISAM;

CREATE TABLE `c_action` (
  `c_action_id` bigint(20) NOT NULL auto_increment,
  `name` text NOT NULL,
  `point` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`c_action_id`)
) TYPE=MyISAM;

CREATE TABLE `c_admin_config` (
  `c_admin_config_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`c_admin_config_id`),
  UNIQUE KEY `name` (`name`)
) TYPE=MyISAM;

CREATE TABLE `c_admin_user` (
  `c_admin_user_id` int(11) NOT NULL auto_increment,
  `username` varchar(64) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `auth_type` enum('all','normal') NOT NULL default 'all',
  `sess_id` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`c_admin_user_id`),
  UNIQUE KEY `username` (`username`)
) TYPE=MyISAM;

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
) TYPE=MyISAM;

CREATE TABLE `c_album_image` (
  `c_album_image_id` int(11) NOT NULL auto_increment,
  `c_album_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `image_filename` text NOT NULL,
  `image_description` text NOT NULL,
  `filesize` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_album_image_id`),
  KEY `c_album_id` (`c_album_id`)
) TYPE=MyISAM;

CREATE TABLE `c_api` (
  `c_api_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `ip` text,
  PRIMARY KEY  (`c_api_id`),
  KEY `name` (`name`(100))
) TYPE=MyISAM;

CREATE TABLE `c_api_member` (
  `c_api_member_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `token` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`c_api_member_id`),
  UNIQUE KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_ashiato` (
  `c_ashiato_id` int(11) NOT NULL auto_increment,
  `c_member_id_from` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`c_ashiato_id`),
  KEY `c_member_id_from` (`c_member_id_from`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_ashiato_to_rdatetime` (`c_member_id_to`,`r_datetime`),
  KEY `c_ashiato_to_rdate` (`c_member_id_to`,`r_date`),
  KEY `c_ashiato_to_from_rdate` (`c_member_id_to`,`c_member_id_from`,`r_date`),
  KEY `c_ashiato_to_from_rdate_rdatetime` (`c_member_id_to`,`c_member_id_from`,`r_date`,`r_datetime`),
  KEY `c_ashiato_rdatetime` (`r_datetime`),
  KEY `c_ashiato_rdate` (`r_date`)
) TYPE=MyISAM;

CREATE TABLE `c_banner` (
  `c_banner_id` int(11) NOT NULL auto_increment,
  `image_filename` text NOT NULL,
  `a_href` text NOT NULL,
  `type` enum('TOP','SIDE') NOT NULL default 'TOP',
  `nickname` text NOT NULL,
  `is_hidden_before` tinyint(1) NOT NULL default '0',
  `is_hidden_after` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_banner_id`)
) TYPE=MyISAM;

CREATE TABLE `c_banner_log` (
  `c_banner_log_id` int(11) NOT NULL auto_increment,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` date NOT NULL default '0000-00-00',
  `c_banner_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `clicked_from` text NOT NULL,
  PRIMARY KEY  (`c_banner_log_id`),
  KEY `c_banner_id` (`c_banner_id`),
  KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_blacklist` (
  `c_blacklist_id` int(11) NOT NULL auto_increment,
  `easy_access_id` blob NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`c_blacklist_id`)
) TYPE=MyISAM;

CREATE TABLE `c_bookmark` (
  `c_bookmark_id` int(11) NOT NULL auto_increment,
  `c_member_id_from` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_bookmark_id`)
) TYPE=MyISAM;

CREATE TABLE `c_cmd` (
  `c_cmd_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `permit` int(11) NOT NULL default '0',
  `url` varchar(128) NOT NULL default '',
  `c_cmd_caster_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_cmd_id`)
) TYPE=MyISAM;

CREATE TABLE `c_cmd_caster` (
  `c_cmd_caster_id` int(11) NOT NULL auto_increment,
  `url` varchar(128) NOT NULL default '',
  `title` text NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  `is_enabled` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_cmd_caster_id`),
  UNIQUE KEY `url` (`url`)
) TYPE=MyISAM;

CREATE TABLE `c_commu` (
  `c_commu_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `c_member_id_admin` int(11) NOT NULL default '0',
  `c_member_id_sub_admin` int(11) NOT NULL default '0',
  `info` text NOT NULL,
  `c_commu_category_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` date NOT NULL default '0000-00-00',
  `image_filename` text NOT NULL,
  `is_send_join_mail` tinyint(1) NOT NULL default '1',
  `is_regist_join` tinyint(1) NOT NULL default '0',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_admit` enum('public','auth') NOT NULL default 'public',
  `is_open` enum('public','member') NOT NULL default 'public',
  `is_topic` enum('member','admin_only','public') NOT NULL default 'member',
  `is_comment` enum('member','public') NOT NULL default 'member',
  PRIMARY KEY  (`c_commu_id`),
  KEY `c_commu_category_id` (`c_commu_category_id`),
  KEY `c_member_id_admin` (`c_member_id_admin`),
  KEY `r_datetime` (`r_datetime`),
  KEY `c_commu_category_id_r_datetime` (`c_commu_category_id`,`r_datetime`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_admin_confirm` (
  `c_commu_admin_confirm_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` text NOT NULL,
  PRIMARY KEY  (`c_commu_admin_confirm_id`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_commu_id` (`c_commu_id`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_admin_invite` (
  `c_commu_admin_invite_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_commu_admin_invite_id`),
  KEY `c_commu_id_c_member_id_to` (`c_commu_id`,`c_member_id_to`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_category` (
  `c_commu_category_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  `c_commu_category_parent_id` int(11) NOT NULL default '0',
  `is_create_commu` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_commu_category_id`),
  KEY `c_commu_category_parent_id` (`c_commu_category_parent_id`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_category_parent` (
  `c_commu_category_parent_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_commu_category_parent_id`),
  KEY `sort_order` (`sort_order`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_member` (
  `c_commu_member_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_commu_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_receive_mail` tinyint(1) NOT NULL default '0',
  `is_receive_mail_pc` int(11) NOT NULL default '0',
  `is_receive_message` int(11) NOT NULL default '1',
  `is_display_topic_home` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_commu_member_id`),
  KEY `c_commu_id` (`c_commu_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_commu_id_r_datetime` (`c_commu_id`,`r_datetime`),
  KEY `c_commu_id_c_member_id` (`c_commu_id`,`c_member_id`),
  KEY `c_member_id_is_display_topic_home` (`c_member_id`,`is_display_topic_home`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_member_confirm` (
  `c_commu_member_confirm_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` text NOT NULL,
  PRIMARY KEY  (`c_commu_member_confirm_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_commu_id` (`c_commu_id`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_review` (
  `c_commu_review_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_review_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_commu_review_id`),
  KEY `c_commu_id` (`c_commu_id`,`c_review_id`,`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_sub_admin_confirm` (
  `c_commu_sub_admin_confirm_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` text NOT NULL,
  PRIMARY KEY  (`c_commu_sub_admin_confirm_id`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_commu_id` (`c_commu_id`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_topic` (
  `c_commu_topic_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `name` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` date NOT NULL default '0000-00-00',
  `c_member_id` int(11) NOT NULL default '0',
  `open_date` date NOT NULL default '0000-00-00',
  `open_date_comment` varchar(100) NOT NULL default '',
  `open_pref_id` int(11) NOT NULL default '0',
  `open_pref_comment` varchar(100) NOT NULL default '',
  `invite_period` date NOT NULL default '0000-00-00',
  `event_flag` int(11) NOT NULL default '0',
  `capacity` int(11) NOT NULL default '0',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_commu_topic_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_commu_id` (`c_commu_id`),
  KEY `r_datetime_c_commu_id` (`c_commu_id`,`u_datetime`)
) TYPE=MyISAM;

CREATE TABLE `c_commu_topic_comment` (
  `c_commu_topic_comment_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `body` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` date NOT NULL default '0000-00-00',
  `number` int(11) NOT NULL default '0',
  `c_commu_topic_id` int(11) NOT NULL default '0',
  `image_filename1` varchar(200) NOT NULL default '',
  `image_filename2` varchar(200) NOT NULL default '',
  `image_filename3` varchar(200) NOT NULL default '',
  `filename` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`c_commu_topic_comment_id`),
  KEY `c_commu_topic_id` (`c_commu_topic_id`),
  KEY `c_commu_id` (`c_commu_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `r_datetime_c_commu_id` (`r_datetime`,`c_commu_id`)
) TYPE=MyISAM;

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

CREATE TABLE `c_config_decoration` (
  `c_config_decoration_id` int(11) NOT NULL auto_increment,
  `tagname` text NOT NULL,
  `caption` text NOT NULL,
  `sample` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_config_decoration_id`)
) TYPE=MyISAM;

CREATE TABLE `c_diary` (
  `c_diary_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` date NOT NULL default '0000-00-00',
  `image_filename_1` text NOT NULL,
  `image_filename_2` text NOT NULL,
  `image_filename_3` text NOT NULL,
  `is_checked` tinyint(1) NOT NULL default '0',
  `public_flag` enum('public','friend','private') NOT NULL default 'public',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_comment_input` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_diary_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `r_datetime_c_member_id` (`r_datetime`,`c_member_id`),
  KEY `c_member_id_r_date` (`c_member_id`,`r_date`),
  KEY `c_member_id_r_datetime` (`c_member_id`,`r_datetime`),
  KEY `r_datetime` (`r_datetime`),
  KEY `c_member_id_r_datetime_public_flag` (`c_member_id`,`r_datetime`,`public_flag`)
) TYPE=MyISAM;

CREATE TABLE `c_diary_category` (
  `c_diary_category_id` int(11) NOT NULL auto_increment,
  `category_name` text NOT NULL,
  `c_member_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_diary_category_id`),
  KEY `c_member_id_c_diary_category_id` (`c_member_id`,`c_diary_category_id`),
  KEY `category_name_c_member_id` (`category_name`(20),`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_diary_category_diary` (
  `c_diary_category_diary_id` int(11) NOT NULL auto_increment,
  `c_diary_category_id` int(11) NOT NULL default '0',
  `c_diary_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_diary_category_diary_id`),
  KEY `c_diary_category_id` (`c_diary_category_id`),
  KEY `c_diary_id` (`c_diary_id`)
) TYPE=MyISAM;

CREATE TABLE `c_diary_comment` (
  `c_diary_comment_id` int(11) NOT NULL auto_increment,
  `c_diary_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `body` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_filename_1` text NOT NULL,
  `image_filename_2` text NOT NULL,
  `image_filename_3` text NOT NULL,
  `number` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_diary_comment_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_diary_id` (`c_diary_id`),
  KEY `r_datetime_c_diary_id_c_member_id` (`r_datetime`,`c_diary_id`,`c_member_id`),
  KEY `c_member_id_c_diary_id` (`c_member_id`,`c_diary_id`),
  KEY `c_diary_id_r_datetime` (`c_diary_id`,`r_datetime`),
  KEY `c_member_id_r_datetime_c_diary_id` (`c_member_id`,`r_datetime`,`c_diary_id`)
) TYPE=MyISAM;

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
) TYPE=MyISAM;

CREATE TABLE `c_event_member` (
  `c_event_member_id` int(11) NOT NULL auto_increment,
  `c_commu_topic_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `is_admin` tinyint(4) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_event_member_id`),
  KEY `c_commu_topic_id` (`c_commu_topic_id`),
  KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_file` (
  `c_file_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `original_filename` text,
  PRIMARY KEY  (`c_file_id`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM;

CREATE TABLE `c_free_page` (
  `c_free_page_id` bigint(20) NOT NULL auto_increment,
  `title` text NOT NULL,
  `body` mediumtext NOT NULL,
  `type` enum('pc','ktai') NOT NULL default 'pc',
  `auth` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_free_page_id`)
) TYPE=MyISAM;

CREATE TABLE `c_friend` (
  `c_friend_id` int(11) NOT NULL auto_increment,
  `c_member_id_from` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `intro` text NOT NULL,
  `r_datetime_intro` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_display_friend_home` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`c_friend_id`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_member_id_from` (`c_member_id_from`),
  KEY `c_member_id_from_c_friend_id` (`c_member_id_from`,`c_friend_id`),
  KEY `c_member_id_from_r_datetime` (`c_member_id_from`,`r_datetime`),
  KEY `c_member_id_to_r_datetime_intro` (`c_member_id_to`,`r_datetime_intro`),
  KEY `c_member_id_from_is_display_friend_home` (`c_member_id_from`,`is_display_friend_home`)
) TYPE=MyISAM;

CREATE TABLE `c_friend_confirm` (
  `c_friend_confirm_id` int(11) NOT NULL auto_increment,
  `c_member_id_from` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` text NOT NULL,
  PRIMARY KEY  (`c_friend_confirm_id`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_member_id_from` (`c_member_id_from`)
) TYPE=MyISAM;

CREATE TABLE `c_holiday` (
  `c_holiday_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `month` int(11) NOT NULL default '0',
  `day` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_holiday_id`)
) TYPE=MyISAM;

CREATE TABLE `c_image` (
  `c_image_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` text,
  PRIMARY KEY  (`c_image_id`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM MAX_ROWS=190000;

CREATE TABLE `c_image_size` (
  `c_image_size_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `c_member_id` int(11) NOT NULL default '0',
  `filesize` int(11) NOT NULL default '0',
  `image_category` enum('album','diary','commu','other') NOT NULL default 'other',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_image_size_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_member_id_image_category` (`c_member_id`,`image_category`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM;

CREATE TABLE `c_ktai_address_pre` (
  `c_ktai_address_pre_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `session` varchar(32) NOT NULL default '',
  `ktai_address` varchar(64) NOT NULL default '',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_ktai_address_pre_id`),
  UNIQUE KEY `session` (`session`)
) TYPE=MyISAM;

CREATE TABLE `c_login_failure` (
  `c_login_failure_id` int(11) NOT NULL auto_increment,
  `ip_addr` varchar(64) NOT NULL default '',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_login_failure_id`),
  KEY `ip_addr` (`ip_addr`)
) TYPE=MyISAM;

CREATE TABLE `c_login_reject` (
  `c_login_reject_id` int(11) NOT NULL auto_increment,
  `ip_addr` varchar(64) NOT NULL default '',
  `expired_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_login_reject_id`),
  UNIQUE KEY `ip_addr` (`ip_addr`)
) TYPE=MyISAM;

CREATE TABLE `c_member` (
  `c_member_id` int(11) NOT NULL auto_increment,
  `nickname` text NOT NULL,
  `birth_year` smallint(4) NOT NULL default '0',
  `birth_month` tinyint(2) NOT NULL default '0',
  `birth_day` tinyint(2) NOT NULL default '0',
  `public_flag_birth_year` enum('public','friend','private') NOT NULL default 'public',
  `public_flag_birth_month_day` enum('public','friend','private') NOT NULL default 'public',
  `image_filename` text NOT NULL,
  `image_filename_1` text NOT NULL,
  `image_filename_2` text NOT NULL,
  `image_filename_3` text NOT NULL,
  `access_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `r_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `rss` text NOT NULL,
  `ashiato_mail_num` int(11) NOT NULL default '0',
  `is_receive_mail` tinyint(1) NOT NULL default '0',
  `is_receive_daily_news` tinyint(1) NOT NULL default '0',
  `is_receive_ktai_mail` tinyint(1) NOT NULL default '0',
  `c_member_id_invite` int(11) NOT NULL default '0',
  `c_password_query_id` int(11) NOT NULL default '0',
  `public_flag_diary` enum('public','friend','private') NOT NULL default 'public',
  `is_login_rejected` tinyint(1) NOT NULL default '0',
  `is_shinobiashi` tinyint(1) NOT NULL default '0',
  `ashiato_count_log` int(11) NOT NULL default '0',
  `schedule_start_day` int(11) NOT NULL default '0',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_member_id`),
  KEY `birth_year_c_member_id` (`birth_year`,`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_member_config` (
  `c_member_config_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`c_member_config_id`),
  KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_member_ktai_pre` (
  `c_member_ktai_pre_id` int(11) NOT NULL auto_increment,
  `session` varchar(32) NOT NULL default '',
  `ktai_address` varchar(64) NOT NULL default '',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `c_member_id_invite` int(11) NOT NULL default '0',
  `is_disabled_regist_easy_access_id` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_member_ktai_pre_id`),
  UNIQUE KEY `session` (`session`)
) TYPE=MyISAM;

CREATE TABLE `c_member_pre` (
  `c_member_pre_id` int(11) NOT NULL auto_increment,
  `session` varchar(255) NOT NULL default '',
  `nickname` text NOT NULL,
  `birth_year` smallint(4) NOT NULL default '0',
  `birth_month` tinyint(2) NOT NULL default '0',
  `birth_day` tinyint(2) NOT NULL default '0',
  `public_flag_birth_year` enum('public','friend','private') NOT NULL default 'public',
  `public_flag_birth_month_day` enum('public','friend','private') NOT NULL default 'public',
  `r_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_receive_mail` tinyint(1) NOT NULL default '0',
  `is_receive_daily_news` tinyint(1) NOT NULL default '0',
  `is_receive_ktai_mail` tinyint(1) NOT NULL default '0',
  `c_member_id_invite` int(11) NOT NULL default '0',
  `password` text NOT NULL,
  `pc_address` text NOT NULL,
  `ktai_address` text NOT NULL,
  `regist_address` text NOT NULL,
  `easy_access_id` text NOT NULL,
  `c_password_query_id` int(11) NOT NULL default '0',
  `c_password_query_answer` text NOT NULL,
  `ktai_session` varchar(255) NOT NULL default '',
  `is_disabled_regist_easy_access_id` tinyint(1) NOT NULL default '0',
  `login_id` varchar(255) NOT NULL default '',
  `is_sns_entry_confirm` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_member_pre_id`),
  UNIQUE KEY `session` (`session`)
) TYPE=MyISAM;

CREATE TABLE `c_member_pre_profile` (
  `c_member_pre_profile_id` int(11) NOT NULL auto_increment,
  `c_member_pre_id` int(11) NOT NULL default '0',
  `c_profile_id` int(11) NOT NULL default '0',
  `c_profile_option_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  `public_flag` enum('public','friend','private') NOT NULL default 'public',
  PRIMARY KEY  (`c_member_pre_profile_id`),
  KEY `c_member_pre_id` (`c_member_pre_id`),
  KEY `c_profile_id` (`c_profile_id`),
  KEY `c_profile_option_id` (`c_profile_option_id`)
) TYPE=MyISAM;

CREATE TABLE `c_member_profile` (
  `c_member_profile_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_profile_id` int(11) NOT NULL default '0',
  `c_profile_option_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  `public_flag` enum('public','friend','private') NOT NULL default 'public',
  PRIMARY KEY  (`c_member_profile_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_profile_id` (`c_profile_id`),
  KEY `c_profile_option_id` (`c_profile_option_id`),
  KEY `c_profile_option_id_c_member_id` (`c_profile_option_id`,`c_member_id`),
  KEY `public_flag_c_profile_option_id` (`public_flag`,`c_profile_option_id`)
) TYPE=MyISAM;

CREATE TABLE `c_member_secure` (
  `c_member_secure_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `hashed_password` blob NOT NULL,
  `hashed_password_query_answer` blob NOT NULL,
  `pc_address` blob NOT NULL,
  `ktai_address` blob NOT NULL,
  `regist_address` blob NOT NULL,
  `easy_access_id` blob NOT NULL,
  `sess_id` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`c_member_secure_id`),
  UNIQUE KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_message` (
  `c_message_id` int(11) NOT NULL auto_increment,
  `c_member_id_to` int(11) NOT NULL default '0',
  `c_member_id_from` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `body` text NOT NULL,
  `subject` text NOT NULL,
  `is_read` tinyint(1) NOT NULL default '0',
  `is_syoudaku` tinyint(1) NOT NULL default '0',
  `is_deleted_to` tinyint(1) NOT NULL default '0',
  `is_deleted_from` tinyint(1) NOT NULL default '0',
  `is_send` tinyint(1) NOT NULL default '0',
  `is_hensin` tinyint(1) NOT NULL default '0',
  `hensinmoto_c_message_id` int(8) NOT NULL default '0',
  `is_kanzen_sakujo_from` tinyint(1) NOT NULL default '0',
  `is_kanzen_sakujo_to` tinyint(1) NOT NULL default '0',
  `image_filename_1` text NOT NULL,
  `image_filename_2` text NOT NULL,
  `image_filename_3` text NOT NULL,
  `filename` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`c_message_id`),
  KEY `c_member_id_from` (`c_member_id_from`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_member_id_from_r_datetime` (`c_member_id_from`,`r_datetime`),
  KEY `c_member_id_to_r_datetime` (`c_member_id_to`,`r_datetime`),
  KEY `c_member_id_to_is_read_is_send` (`c_member_id_to`,`is_read`,`is_send`)
) TYPE=MyISAM;

CREATE TABLE `c_message_queue` (
  `c_message_queue_id` bigint(20) NOT NULL auto_increment,
  `c_member_id_from` bigint(20) NOT NULL default '0',
  `c_member_id_to` bigint(20) NOT NULL default '0',
  `subject` text NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY  (`c_message_queue_id`)
) TYPE=MyISAM;

CREATE TABLE `c_module` (
  `c_module_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `is_enabled` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`c_module_id`),
  UNIQUE KEY `name` (`name`)
) TYPE=MyISAM;

CREATE TABLE `c_navi` (
  `c_navi_id` int(11) NOT NULL auto_increment,
  `navi_type` varchar(10) NOT NULL default '',
  `sort_order` int(11) NOT NULL default '0',
  `url` text NOT NULL,
  `caption` text NOT NULL,
  PRIMARY KEY  (`c_navi_id`),
  KEY `type_sort` (`navi_type`,`sort_order`)
) TYPE=MyISAM;

CREATE TABLE `c_password_query` (
  `c_password_query_id` int(11) NOT NULL auto_increment,
  `c_password_query_question` text NOT NULL,
  PRIMARY KEY  (`c_password_query_id`)
) TYPE=MyISAM;

CREATE TABLE `c_pc_address_pre` (
  `c_pc_address_pre_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `pc_address` text NOT NULL,
  `session` varchar(32) NOT NULL default '',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_pc_address_pre_id`),
  KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_point_log` (
  `c_point_log_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `point` int(11) NOT NULL default '0',
  `memo` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_point_log_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `r_datetime` (`r_datetime`),
  KEY `c_member_id_2` (`c_member_id`,`r_datetime`)
) TYPE=MyISAM;

CREATE TABLE `c_point_log_tag` (
  `c_point_log_tag_id` int(11) NOT NULL auto_increment,
  `c_point_log_id` int(11) NOT NULL default '0',
  `tag` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`c_point_log_tag_id`),
  KEY `c_point_log_id` (`c_point_log_id`),
  KEY `tag` (`tag`),
  KEY `c_point_log_id_2` (`c_point_log_id`,`tag`)
) TYPE=MyISAM;

CREATE TABLE `c_profile` (
  `c_profile_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `caption` text NOT NULL,
  `info` text NOT NULL,
  `is_required` tinyint(1) NOT NULL default '0',
  `public_flag_edit` tinyint(1) NOT NULL default '0',
  `public_flag_default` enum('public','friend','private') NOT NULL default 'public',
  `form_type` enum('text','textlong','textarea','select','checkbox','radio') NOT NULL default 'text',
  `sort_order` int(11) NOT NULL default '0',
  `disp_regist` tinyint(1) NOT NULL default '0',
  `disp_config` tinyint(1) NOT NULL default '1',
  `disp_search` tinyint(1) NOT NULL default '1',
  `val_type` text NOT NULL,
  `val_regexp` text NOT NULL,
  `val_min` int(11) NOT NULL default '0',
  `val_max` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_profile_id`),
  KEY `sort_order` (`sort_order`)
) TYPE=MyISAM;

CREATE TABLE `c_profile_option` (
  `c_profile_option_id` int(11) NOT NULL auto_increment,
  `c_profile_id` int(11) NOT NULL default '0',
  `value` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_profile_option_id`),
  KEY `c_profile_id` (`c_profile_id`),
  KEY `sort_order` (`sort_order`),
  KEY `c_profile_id_sort_order` (`c_profile_id`,`sort_order`)
) TYPE=MyISAM;

CREATE TABLE `c_profile_pref` (
  `c_profile_pref_id` int(11) NOT NULL auto_increment,
  `pref` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  `map_latitude` double NOT NULL default '0',
  `map_longitude` double NOT NULL default '0',
  `map_zoom` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_profile_pref_id`),
  KEY `sort_order` (`sort_order`),
  KEY `map_latitude_map_longitude` (`map_latitude`,`map_longitude`)
) TYPE=MyISAM;

CREATE TABLE `c_rank` (
  `c_rank_id` bigint(20) NOT NULL auto_increment,
  `name` text NOT NULL,
  `image_filename` text NOT NULL,
  `point` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`c_rank_id`)
) TYPE=MyISAM;

CREATE TABLE `c_review` (
  `c_review_id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `release_date` varchar(100) NOT NULL default '0000-00-00',
  `manufacturer` text NOT NULL,
  `author` text NOT NULL,
  `c_review_category_id` int(11) NOT NULL default '0',
  `image_small` text NOT NULL,
  `image_medium` text NOT NULL,
  `image_large` text NOT NULL,
  `url` text NOT NULL,
  `asin` varchar(100) NOT NULL default '',
  `list_price` varchar(100) NOT NULL default '0',
  `retail_price` varchar(100) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_review_id`),
  KEY `c_review_category_id` (`c_review_category_id`)
) TYPE=MyISAM;

CREATE TABLE `c_review_category` (
  `c_review_category_id` int(11) NOT NULL auto_increment,
  `category` varchar(100) NOT NULL default '',
  `category_disp` varchar(100) NOT NULL default '',
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_review_category_id`)
) TYPE=MyISAM;

CREATE TABLE `c_review_clip` (
  `c_review_clip_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_review_id` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_review_clip_id`),
  KEY `c_member_id` (`c_member_id`,`c_review_id`)
) TYPE=MyISAM;

CREATE TABLE `c_review_comment` (
  `c_review_comment_id` int(11) NOT NULL auto_increment,
  `c_review_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `body` text NOT NULL,
  `satisfaction_level` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_review_comment_id`),
  KEY `c_review_id_r_datetime` (`c_review_id`,`r_datetime`),
  KEY `c_member_id_r_datetime` (`c_member_id`,`r_datetime`)
) TYPE=MyISAM;

CREATE TABLE `c_rss_cache` (
  `c_rss_cache_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `link` text NOT NULL,
  `cache_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_rss_cache_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_member_id_r_datetime` (`c_member_id`,`r_datetime`),
  KEY `r_datetime` (`r_datetime`),
  KEY `r_datetime_c_member_id` (`r_datetime`,`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_schedule` (
  `c_schedule_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `title` text NOT NULL,
  `body` text NOT NULL,
  `start_date` date NOT NULL default '0000-00-00',
  `start_time` time default NULL,
  `end_date` date NOT NULL default '0000-00-00',
  `end_time` time default NULL,
  `is_receive_mail` tinyint(1) NOT NULL default '0',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_schedule_id`),
  KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_searchlog` (
  `c_searchlog_id` int(11) NOT NULL auto_increment,
  `searchword` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `c_member_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_searchlog_id`),
  KEY `c_member_id` (`c_member_id`)
) TYPE=MyISAM;

CREATE TABLE `c_send_messages_history` (
  `c_send_messages_history_id` bigint(20) NOT NULL auto_increment,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `send_num` bigint(20) NOT NULL default '0',
  `type` enum('mail','message') NOT NULL default 'mail',
  `c_member_ids` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_send_messages_history_id`)
) TYPE=MyISAM;

CREATE TABLE `c_session` (
  `c_session_id` int(11) NOT NULL auto_increment,
  `sess_name` varchar(64) NOT NULL default '',
  `sess_id` varchar(32) NOT NULL default '',
  `sess_time` int(11) NOT NULL default '0',
  `sess_data` text NOT NULL,
  PRIMARY KEY  (`c_session_id`),
  UNIQUE KEY `sess_name` (`sess_name`,`sess_id`)
) TYPE=MyISAM;

CREATE TABLE `c_siteadmin` (
  `c_siteadmin_id` int(11) NOT NULL auto_increment,
  `target` varchar(100) NOT NULL default '',
  `body` text NOT NULL,
  `r_date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`c_siteadmin_id`),
  UNIQUE KEY `target` (`target`)
) TYPE=MyISAM;

CREATE TABLE `c_skin_filename` (
  `c_skin_filename_id` int(11) NOT NULL auto_increment,
  `skinname` varchar(64) NOT NULL default '',
  `filename` text NOT NULL,
  PRIMARY KEY  (`c_skin_filename_id`),
  UNIQUE KEY `skinname` (`skinname`)
) TYPE=MyISAM;

CREATE TABLE `c_template` (
  `c_template_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `source` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_template_id`),
  UNIQUE KEY `name` (`name`)
) TYPE=MyISAM;

CREATE TABLE `c_tmp_file` (
  `c_tmp_file_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `original_filename` text,
  PRIMARY KEY  (`c_tmp_file_id`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM;

CREATE TABLE `c_tmp_image` (
  `c_tmp_image_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` text,
  `filesize` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_tmp_image_id`),
  KEY `filename` (`filename`(100))
) TYPE=MyISAM;

CREATE TABLE `c_username` (
  `c_username_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `username` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`c_username_id`),
  UNIQUE KEY `c_member_id` (`c_member_id`),
  UNIQUE KEY `username` (`username`)
) TYPE=MyISAM;

CREATE TABLE `mail_queue` (
  `id` bigint(20) NOT NULL default '0',
  `create_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `time_to_send` datetime NOT NULL default '0000-00-00 00:00:00',
  `sent_time` datetime default NULL,
  `id_user` bigint(20) NOT NULL default '0',
  `ip` varchar(20) NOT NULL default 'unknown',
  `sender` varchar(50) NOT NULL default '',
  `recipient` varchar(50) NOT NULL default '',
  `headers` text NOT NULL,
  `body` longtext NOT NULL,
  `try_sent` tinyint(4) NOT NULL default '0',
  `delete_after_send` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `time_to_send` (`time_to_send`),
  KEY `id_user` (`id_user`)
) TYPE=MyISAM;

CREATE TABLE `mail_queue_seq` (
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

CREATE TABLE `portal_config` (
  `portal_config_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`portal_config_id`),
  UNIQUE KEY `name` (`name`)
) TYPE=MyISAM;

CREATE TABLE `portal_free_area` (
  `portal_free_area_id` int(11) NOT NULL auto_increment,
  `html` text NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`portal_free_area_id`)
) TYPE=MyISAM;

CREATE TABLE `portal_free_area_ktai` (
  `portal_free_area_ktai_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `html` text NOT NULL,
  PRIMARY KEY  (`portal_free_area_ktai_id`)
) TYPE=MyISAM;

CREATE TABLE `portal_image` (
  `portal_image_id` int(11) NOT NULL auto_increment,
  `image_filename` text NOT NULL,
  PRIMARY KEY  (`portal_image_id`)
) TYPE=MyISAM;

CREATE TABLE `portal_layout` (
  `portal_layout_id` int(11) NOT NULL auto_increment,
  `content_name` varchar(64) NOT NULL,
  `position` int(11) NOT NULL,
  `is_image` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`portal_layout_id`),
  UNIQUE KEY `content_name` (`content_name`),
  UNIQUE KEY `position` (`position`)
) TYPE=MyISAM;

CREATE TABLE `portal_layout_ktai` (
  `portal_layout_ktai_id` int(11) NOT NULL auto_increment,
  `content_name` varchar(64) NOT NULL,
  `position` int(11) NOT NULL default '0',
  PRIMARY KEY  (`portal_layout_ktai_id`),
  UNIQUE KEY `content_name` (`content_name`),
  UNIQUE KEY `postion` (`position`)
) TYPE=MyISAM;

CREATE TABLE `portal_link` (
  `portal_link_id` int(11) NOT NULL auto_increment,
  `title` varchar(64) NOT NULL,
  `url` text NOT NULL,
  `sort_order` int(11) NOT NULL default '0',
  `is_target_blank` tinyint(4) NOT NULL default '0',
  `is_enabled` tinyint(4) default '0',
  PRIMARY KEY  (`portal_link_id`)
) TYPE=MyISAM;

CREATE TABLE `portal_rss` (
  `portal_rss_id` int(11) NOT NULL auto_increment,
  `url` text NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`portal_rss_id`)
) TYPE=MyISAM;


