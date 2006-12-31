ALTER TABLE `c_commu` ADD COLUMN `c_member_id_sub_admin` INT(11) NOT NULL after `c_member_id_admin`;
ALTER TABLE `c_commu` ADD COLUMN `topic_authority` enum('public','admin_only') NOT NULL DEFAULT 'public' after `c_member_id_sub_admin`;
