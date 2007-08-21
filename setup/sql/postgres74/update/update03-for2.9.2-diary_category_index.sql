
CREATE INDEX c_member_id_c_diary_category_id on c_diary_category (c_member_id, c_diary_category_id);
CREATE INDEX category_name_c_member_id on c_diary_category (category_name, c_member_id);
CREATE INDEX c_diary_category_id on c_diary_category_diary (c_diary_category_id);
CREATE INDEX c_diary_id on c_diary_category_diary (c_diary_id);
