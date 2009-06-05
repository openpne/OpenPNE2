-- update01
ALTER TABLE c_review_comment ADD COLUMN u_datetime timestamp;
ALTER TABLE c_review_comment ALTER COLUMN u_datetime SET DEFAULT '0000-01-01 00:00:00';
UPDATE c_review_comment SET u_datetime = '0000-01-01 00:00:00';
ALTER TABLE c_review_comment ALTER COLUMN u_datetime SET NOT NULL;

UPDATE c_review_comment SET u_datetime = r_datetime;

-- update02
ALTER TABLE c_bookmark ADD COLUMN after_field timestamp;
ALTER TABLE c_bookmark ALTER COLUMN after_field SET default '0000-01-01 00:00:00';
UPDATE C_bookmark SET after_field = '0000-01-01 00:00:00';
ALTER TABLE c_bookmark ALTER COLUMN after_field SET NOT NULL;
UPDATE c_bookmark SET after_field = to_timestamp(r_datetime, 'YYYY-MM-DD HH24:MI:SS');
ALTER TABLE c_bookmark DROP r_datetime;
ALTER TABLE c_bookmark RENAME after_field TO r_datetime;

-- update03
ALTER TABLE c_member_secure ADD COLUMN sess_id varchar(32);
ALTER TABLE c_member_secure ALTER COLUMN sess_id SET DEFAULT '';
UPDATE c_member_secure SET sess_id = '';
ALTER TABLE c_member_secure ALTER COLUMN sess_id SET NOT NULL;

ALTER TABLE c_admin_user ADD COLUMN sess_id varchar(32);
ALTER TABLE c_admin_user ALTER COLUMN sess_id SET DEFAULT '';
UPDATE c_admin_user SET sess_id = '';
ALTER TABLE c_admin_user ALTER COLUMN sess_id SET NOT NULL;

-- update04
ALTER TABLE c_commu_category ADD COLUMN create_flag smallint;
ALTER TABLE c_commu_category ALTER COLUMN create_flag SET DEFAULT 0;
UPDATE c_commu_category SET create_flag = 1;
ALTER TABLE c_commu_category ALTER COLUMN create_flag SET NOT NULL;

-- update05
UPDATE c_image SET r_datetime = TO_TIMESTAMP(r_datetime::text, 'YYYY-MM-DD HH24:MI:SS') WHERE filename IN ('skin_no_image.gif', 'skin_no_logo.gif', 'skin_no_logo_small.gif', 'r_1_regular.gif', 'r_2_silver.gif', 'r_3_gold.gif', 'r_4_platinum.gif');
UPDATE c_member SET r_date = TO_TIMESTAMP(r_date::text, 'YYYY-MM-DD HH24:MI:SS'), u_datetime = TO_TIMESTAMP(u_datetime::text, 'YYYY-MM-DD HH24:MI:SS') WHERE c_member_id = 1;

-- update06
ALTER TABLE c_commu_category RENAME COLUMN create_flag TO is_create_commu;
ALTER TABLE c_commu_category ALTER COLUMN is_create_commu SET DEFAULT 1;
ALTER TABLE c_commu_category ALTER COLUMN is_create_commu SET NOT NULL;

-- update07
ALTER TABLE c_commu_member ADD COLUMN is_display_topic_home smallint;
ALTER TABLE c_commu_member ALTER COLUMN is_display_topic_home SET DEFAULT 1;
UPDATE c_commu_member SET is_display_topic_home = 1;
ALTER TABLE c_commu_member ALTER COLUMN is_display_topic_home SET NOT NULL;
CREATE INDEX c_commu_member_c_member_id_is_display_topic_home ON c_commu_member (c_member_id,is_display_topic_home);

-- update08
ALTER TABLE c_friend ADD COLUMN is_display_friend_home smallint;
ALTER TABLE c_friend ALTER COLUMN is_display_friend_home SET DEFAULT 1;
UPDATE c_friend SET is_display_friend_home = 1;
ALTER TABLE c_friend ALTER COLUMN is_display_friend_home SET NOT NULL;
CREATE INDEX c_friend_c_member_id_from_is_display_friend_home on c_friend (c_member_id_from,is_display_friend_home);

-- update09
ALTER TABLE c_diary ADD COLUMN is_comment_input smallint;
ALTER TABLE c_diary ALTER COLUMN is_comment_input SET DEFAULT 1;
ALTER TABLE c_diary ALTER COLUMN is_comment_input SET NOT NULL;
UPDATE c_diary SET is_comment_input = 1;

-- update10
ALTER TABLE c_member_pre ADD COLUMN is_sns_entry_confirm smallint;
ALTER TABLE c_member_pre ALTER COLUMN is_sns_entry_confirm SET DEFAULT 0;
UPDATE c_member_pre SET is_sns_entry_confirm = 0;
ALTER TABLE c_member_pre ALTER COLUMN is_sns_entry_confirm SET NOT NULL;

-- update11
CREATE TABLE c_image_size (
  c_image_size_id serial NOT NULL,
  filename text NOT NULL,
  c_member_id int4 NOT NULL default '0',
  filesize int4 NOT NULL default '0',
  image_category varchar(20) NOT NULL default 'other',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY (c_image_size_id)
);
CREATE INDEX c_image_size_c_member_id on c_image_size (c_member_id);
CREATE INDEX c_image_size_c_member_id_image_category on c_image_size (c_member_id,image_category);
CREATE INDEX c_image_size_filename on c_image_size (filename);

-- update12
ALTER TABLE c_tmp_image ADD COLUMN filesize int4;
ALTER TABLE c_tmp_image ALTER COLUMN filesize SET DEFAULT 0;
ALTER TABLE c_tmp_image ALTER COLUMN filesize SET NOT NULL;

-- update13
DROP INDEX c_commu_id_c_memer_id_to;
CREATE INDEX c_commu_id_c_member_id_to ON c_commu_admin_invite(c_commu_id,c_member_id_to);

-- update14
ALTER TABLE c_commu ADD COLUMN is_admit varchar(20);
ALTER TABLE c_commu ADD COLUMN is_open varchar(20);
ALTER TABLE c_commu ADD COLUMN is_topic varchar(20);
ALTER TABLE c_commu ADD COLUMN is_comment varchar(20);

ALTER TABLE c_commu ALTER COLUMN is_admit SET DEFAULT 'public';
ALTER TABLE c_commu ALTER COLUMN is_open SET DEFAULT 'public';
ALTER TABLE c_commu ALTER COLUMN is_topic SET DEFAULT 'member';
ALTER TABLE c_commu ALTER COLUMN is_comment SET DEFAULT 'member';
UPDATE c_commu SET is_admit='public',is_open='public',is_topic='member',is_comment='member';
UPDATE c_commu SET is_admit='auth',is_open='public' WHERE public_flag='auth_public';
UPDATE c_commu SET is_admit='auth',is_open='public' WHERE public_flag='auth_sns';
UPDATE c_commu SET is_admit='auth',is_open='member' WHERE public_flag='auth_commu_member';
UPDATE c_commu SET is_topic='admin_only' WHERE topic_authority='admin_only';

ALTER TABLE c_commu ALTER COLUMN is_admit SET NOT NULL;
ALTER TABLE c_commu ALTER COLUMN is_open SET NOT NULL;
ALTER TABLE c_commu ALTER COLUMN is_topic SET NOT NULL;
ALTER TABLE c_commu ALTER COLUMN is_comment SET NOT NULL;

-- update15
ALTER TABLE c_commu DROP public_flag CASCADE;
ALTER TABLE c_commu DROP topic_authority CASCADE;

-- update16, update17
