ALTER TABLE `biz_schedule` ADD `public_flag` ENUM( 'public', 'group', 'private' ) NOT NULL DEFAULT 'public',
ADD `biz_group_id` INT NULL ;