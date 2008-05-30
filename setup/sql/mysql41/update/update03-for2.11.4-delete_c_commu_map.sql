/*!40101 SET NAMES utf8 */;

UPDATE `c_commu` SET `info` = CONCAT(`info`, 'http://maps.google.co.jp/maps?ll=', `map_latitude`, ',', `map_longitude`, '&z=', `map_zoom`) WHERE `is_display_map` = 1;

ALTER TABLE `c_commu` DROP COLUMN `is_display_map`;
ALTER TABLE `c_commu` DROP COLUMN `map_latitude`;
ALTER TABLE `c_commu` DROP COLUMN `map_longitude`;
ALTER TABLE `c_commu` DROP COLUMN `map_zoom`;
