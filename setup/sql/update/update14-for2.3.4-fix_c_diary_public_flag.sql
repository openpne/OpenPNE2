ALTER TABLE `c_diary` CHANGE COLUMN `public_flag` `public_flag` enum('public','friend','private') NOT NULL default 'public';
ALTER TABLE `c_member` CHANGE COLUMN `public_flag_diary` `public_flag_diary` enum('public','friend','private') NOT NULL default 'public';

UPDATE c_diary INNER JOIN c_member USING (c_member_id) SET c_diary.public_flag = c_member.public_flag_diary ;