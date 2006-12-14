ALTER TABLE `biz_todo` ADD `due_datetime` DATETIME NOT NULL ,
ADD `finish_datetime` DATETIME NOT NULL ,
ADD `priority` INT NOT NULL DEFAULT '3',
ADD `public_flag` ENUM( 'public', 'group', 'private' ) NOT NULL DEFAULT 'public',
ADD `biz_group_id` INT NOT NULL ;