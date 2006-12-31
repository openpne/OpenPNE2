CREATE TABLE `c_diary_category` (
  `c_diary_category_id` int(11) NOT NULL auto_increment,
  `category_name` text NOT NULL,
  `c_member_id` int(11) NOT NULL,
  `r_datetime` datetime NOT NULL,
  PRIMARY KEY  (`c_diary_category_id`)
) ENGINE=MyISAM;

CREATE TABLE `c_diary_category_diary` (
  `c_diary_category_diary_id` int(11) NOT NULL auto_increment,
  `c_diary_category_id` int(11) NOT NULL,
  `c_diary_id` int(11) NOT NULL,
  PRIMARY KEY  (`c_diary_category_diary_id`)
) ENGINE=MyISAM;
