/*!40101 SET NAMES utf8 */;

ALTER TABLE `c_member_pre` ADD COLUMN `ktai_session` varchar(255) NOT NULL default '';
ALTER TABLE `c_member_pre` ADD COLUMN `is_disabled_regist_easy_access_id` tinyint(1) NOT NULL default '0';

ALTER TABLE `c_member_ktai_pre` ADD COLUMN `is_disabled_regist_easy_access_id` tinyint(1) NOT NULL default '0';