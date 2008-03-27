ALTER TABLE `c_sns_config_ktai` ADD COLUMN `bg_09` text NOT NULL;
ALTER TABLE `c_sns_config_ktai` ADD COLUMN `font_05` text NOT NULL;
ALTER TABLE `c_sns_config_ktai` ADD COLUMN `font_06` text NOT NULL;
ALTER TABLE `c_sns_config_ktai` ADD COLUMN `font_07` text NOT NULL;
ALTER TABLE `c_sns_config_ktai` ADD COLUMN `font_08` text NOT NULL;

UPDATE `c_sns_config_ktai` SET bg_09 = 'FFFFFF';
UPDATE `c_sns_config_ktai` SET font_05 = '000000';
UPDATE `c_sns_config_ktai` SET font_06 = '0000FF';
UPDATE `c_sns_config_ktai` SET font_07 = '0000FF';
UPDATE `c_sns_config_ktai` SET font_08 = '800080';
