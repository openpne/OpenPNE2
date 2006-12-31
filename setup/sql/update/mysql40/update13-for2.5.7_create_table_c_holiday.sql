CREATE TABLE `c_holiday` (
  `c_holiday_id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  PRIMARY KEY  (`c_holiday_id`)
) ENGINE=MyISAM;

alter table c_sns_config ADD COLUMN bg_14 text NOT NULL after bg_13;
UPDATE c_sns_config SET bg_14 = 'FFFFFF';
