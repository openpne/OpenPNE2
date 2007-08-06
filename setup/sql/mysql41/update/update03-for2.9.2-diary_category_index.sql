/*!40101 SET NAMES utf8 */;

ALTER TABLE c_diary_category ADD INDEX c_member_id_c_diary_category_id(c_member_id, c_diary_category_id);
ALTER TABLE c_diary_category ADD INDEX category_name_c_member_id(category_name(20), c_member_id);
ALTER TABLE c_diary_category_diary ADD INDEX c_diary_category_id(c_diary_category_id);
ALTER TABLE c_diary_category_diary ADD INDEX c_diary_id(c_diary_id);
