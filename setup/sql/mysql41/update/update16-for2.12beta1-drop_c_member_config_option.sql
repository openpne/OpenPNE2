/*!40101 SET NAMES utf8 */;

ALTER TABLE `c_member_config` ADD COLUMN `name` varchar(64) NOT NULL default '';

UPDATE c_member_config, c_member_config_option SET c_member_config.name = c_member_config_option.name
    WHERE c_member_config.c_member_config_option_id = c_member_config_option.c_member_config_option_id;

DROP TABLE `c_member_config_option`;
ALTER TABLE `c_member_config` DROP COLUMN `c_member_config_option_id`;
