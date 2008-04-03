ALTER TABLE `c_sns_config_ktai` ADD COLUMN `font_09` text NOT NULL;
UPDATE `c_sns_config_ktai` SET font_09 = bg_06;

ALTER TABLE `c_sns_config_ktai` ADD COLUMN `bg_10` text NOT NULL;
UPDATE `c_sns_config_ktai` SET bg_10 = bg_08;
