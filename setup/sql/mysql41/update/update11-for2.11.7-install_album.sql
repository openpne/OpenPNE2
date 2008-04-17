DROP TABLE IF EXISTS `c_album`;
CREATE TABLE IF NOT EXISTS `c_album` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `c_album_image`;
CREATE TABLE IF NOT EXISTS `c_album_image` (
  `c_album_image_id` int(11) NOT NULL auto_increment,
  `c_album_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `image_filename` text NOT NULL,
  `image_description` text NOT NULL,
  `filesize` int(11) NOT NULL default '0',
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_album_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
