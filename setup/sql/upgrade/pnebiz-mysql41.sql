CREATE TABLE `biz_admin_config` (
  `biz_admin_config_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`biz_admin_config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;
INSERT INTO `biz_admin_config` VALUES (1, 'IS_CLOSED_SHISETSU', '0');

CREATE TABLE `biz_group` (
  `biz_group_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `info` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `image_filename` text NOT NULL,
  PRIMARY KEY  (`biz_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_group_member` (
  `biz_group_member_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL,
  `biz_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`biz_group_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_schedule` (
  `biz_schedule_id` int(11) NOT NULL auto_increment,
  `title` mediumtext NOT NULL,
  `c_member_id` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `begin_time` time default NULL,
  `finish_time` time default NULL,
  `value` mediumtext NOT NULL,
  `rep_type` int(11) NOT NULL,
  `rep_first` int(11) NOT NULL,
  `is_read` int(11) NOT NULL,
  PRIMARY KEY  (`biz_schedule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_schedule_member` (
  `biz_schedule_member_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL,
  `biz_schedule_id` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  PRIMARY KEY  (`biz_schedule_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_shisetsu` (
  `biz_shisetsu_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `image_filename` text NOT NULL,
  PRIMARY KEY  (`biz_shisetsu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_shisetsu_schedule` (
  `biz_shisetsu_schedule_id` int(11) NOT NULL auto_increment,
  `biz_shisetsu_id` int(11) NOT NULL,
  `c_member_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `begin_time` time NOT NULL,
  `finish_time` time NOT NULL,
  PRIMARY KEY  (`biz_shisetsu_schedule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_state` (
  `biz_state_id` int(11) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL,
  `state` text,
  PRIMARY KEY  (`biz_state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

CREATE TABLE `biz_todo` (
  `biz_todo_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `memo` text NOT NULL,
  `is_check` tinyint(1) NOT NULL default '0',
  `writer_id` int(11) NOT NULL default '0',
  `sort_order` int(11) NOT NULL,
  `r_datetime` datetime default NULL,
  PRIMARY KEY  (`biz_todo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

