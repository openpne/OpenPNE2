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

