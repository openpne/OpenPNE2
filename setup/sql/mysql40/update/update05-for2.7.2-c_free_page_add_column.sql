ALTER TABLE `c_free_page` ADD COLUMN `title` text NOT NULL DEFAULT '' after `c_free_page_id`;
ALTER TABLE `c_free_page` ADD COLUMN `type` enum('pc','ktai') NOT NULL default 'pc' after `body`;
ALTER TABLE `c_free_page` ADD COLUMN `auth` tinyint(1) NOT NULL DEFAULT 1 after `type`;
ALTER TABLE `c_free_page` CHANGE COLUMN `body` `body` MEDIUMTEXT NOT NULL DEFAULT '';
