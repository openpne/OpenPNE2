CREATE TABLE `c_commu_sub_admin_confirm` (
  `c_commu_sub_admin_confirm_id` int(11) NOT NULL auto_increment,
  `c_commu_id` int(11) NOT NULL default '0',
  `c_member_id_to` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` text NOT NULL,
  PRIMARY KEY  (`c_commu_sub_admin_confirm_id`),
  KEY `c_member_id_to` (`c_member_id_to`),
  KEY `c_commu_id` (`c_commu_id`)
) ENGINE=MyISAM ;
