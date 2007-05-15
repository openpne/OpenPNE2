CREATE TABLE `c_tmp_file` (
  `c_tmp_file_id` int(11) NOT NULL auto_increment,
  `filename` text NOT NULL,
  `bin` longblob NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `original_filename` text,
  PRIMARY KEY  (`c_tmp_file_id`),
  KEY `filename` (`filename`(100))
) ENGINE=MyISAM;

