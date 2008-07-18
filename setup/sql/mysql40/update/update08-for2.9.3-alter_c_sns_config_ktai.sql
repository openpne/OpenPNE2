ALTER TABLE `c_sns_config_ktai` ADD COLUMN `bg_08` text NOT NULL;
ALTER TABLE `c_sns_config_ktai` ADD COLUMN `font_04` text NOT NULL;

UPDATE `c_sns_config_ktai` SET bg_08 = 'FFFFFF';
UPDATE `c_sns_config_ktai` SET font_04 = 'FF0000';
