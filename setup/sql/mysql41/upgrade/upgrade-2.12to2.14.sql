-- update01
ALTER TABLE c_review_comment ADD COLUMN u_datetime datetime NOT NULL default '0000-00-00 00:00:00';

UPDATE c_review_comment SET u_datetime = r_datetime;

-- update02
ALTER TABLE c_bookmark CHANGE r_datetime r_datetime datetime NOT NULL DEFAULT '0000-00-00 00:00:00';

-- update03
ALTER TABLE c_member_secure ADD COLUMN sess_id varchar(32) NOT NULL default '';
ALTER TABLE c_admin_user ADD COLUMN sess_id varchar(32) NOT NULL default '';

-- update04
ALTER TABLE c_commu_category ADD COLUMN create_flag tinyint(1) NOT NULL default 0;
UPDATE c_commu_category SET create_flag = 1;

-- update05
ALTER TABLE c_commu_category CHANGE COLUMN create_flag is_create_commu tinyint(1) NOT NULL default 1;

-- update06
ALTER TABLE c_commu_member ADD COLUMN is_display_topic_home tinyint(1) NOT NULL default 1;
CREATE INDEX c_member_id_is_display_topic_home ON c_commu_member (c_member_id, is_display_topic_home);

-- update07
ALTER TABLE c_friend ADD COLUMN is_display_friend_home tinyint(1) NOT NULL default 1;
CREATE INDEX c_member_id_from_is_display_friend_home ON c_friend(c_member_id_from, is_display_friend_home);

-- update08
ALTER TABLE c_diary ADD COLUMN is_comment_input tinyint(1) NOT NULL default 1;

-- update09
ALTER TABLE c_member_pre ADD COLUMN is_sns_entry_confirm tinyint(1) NOT NULL default '0';

-- update10
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

-- update11
ALTER TABLE c_tmp_image ADD COLUMN filesize int(11) NOT NULL DEFAULT '0';

-- update12
ALTER TABLE c_commu_admin_invite DROP INDEX c_commu_id_c_memer_id_to,
ADD INDEX c_commu_id_c_member_id_to (c_commu_id, c_member_id_to);

-- update13
ALTER TABLE c_commu ADD COLUMN is_admit enum('public','auth') NOT NULL default 'public';
ALTER TABLE c_commu ADD COLUMN is_open enum('public','member') NOT NULL default 'public';
ALTER TABLE c_commu ADD COLUMN is_topic enum('member','admin_only','public') NOT NULL default 'member';
ALTER TABLE c_commu ADD COLUMN is_comment enum('member','public') NOT NULL default 'member';

UPDATE c_commu SET is_admit='public',is_open='public',is_comment='member' WHERE public_flag='public';
UPDATE c_commu SET is_admit='auth',is_open='public',is_comment='member' WHERE public_flag='auth_public';
UPDATE c_commu SET is_admit='auth',is_open='public',is_comment='member' WHERE public_flag='auth_sns';
UPDATE c_commu SET is_admit='auth',is_open='member',is_comment='member' WHERE public_flag='auth_commu_member';

UPDATE c_commu SET is_topic='member' WHERE topic_authority='public';
UPDATE c_commu SET is_topic='admin_only' WHERE topic_authority='admin_only';

-- update14
ALTER TABLE c_commu DROP public_flag;
ALTER TABLE c_commu DROP topic_authority;

-- update15,update16
