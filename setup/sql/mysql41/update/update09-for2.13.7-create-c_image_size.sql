CREATE TABLE `c_image_size` (
    `c_image_size_id` int(11) NOT NULL auto_increment,
    `filename` text NOT NULL,
    `c_member_id` int(11) NOT NULL default '0',
    `filesize`   int(11) NOT NULL default '0',
    `image_category` enum('album','diary','commu','other') NOT NULL default 'other',
    `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
    PRIMARY KEY  (`c_image_size_id`),
    KEY `c_member_id` (`c_member_id`),
    KEY `c_member_id_image_category` (`c_member_id`,`image_category`),
    KEY `filename` (`filename`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

