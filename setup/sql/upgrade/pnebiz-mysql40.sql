CREATE TABLE `biz_admin_config` (
  `biz_admin_config_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`biz_admin_config_id`)
) TYPE=MyISAM;
INSERT INTO `biz_admin_config` VALUES (1, 'IS_CLOSED_SHISETSU', '0');

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

