CREATE TABLE biz_admin_config (
  biz_admin_config_id serial NOT NULL,
  name text NOT NULL,
  value text NOT NULL,
  PRIMARY KEY  (biz_admin_config_id)
);

CREATE TABLE biz_group (
  biz_group_id serial NOT NULL,
  name text NOT NULL,
  info text NOT NULL,
  admin_id int4 NOT NULL default '0',
  image_filename text NOT NULL,
  PRIMARY KEY  (biz_group_id)
);

CREATE TABLE biz_group_member (
  biz_group_member_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  biz_group_id int4 NOT NULL default '0',
  PRIMARY KEY  (biz_group_member_id)
);

CREATE TABLE biz_schedule (
  biz_schedule_id serial NOT NULL,
  title text NOT NULL,
  c_member_id int4 NOT NULL default '0',
  begin_date date NOT NULL default '0000-01-01',
  finish_date date NOT NULL default '0000-01-01',
  begin_time time default NULL,
  finish_time time default NULL,
  value text NOT NULL,
  rep_type int4 NOT NULL default '0',
  rep_first int4 NOT NULL default '0',
  is_read int4 NOT NULL default '0',
  public_flag varchar(20) NOT NULL default 'public',
  biz_group_id int4 default NULL,
  PRIMARY KEY  (biz_schedule_id)
);

CREATE TABLE biz_schedule_member (
  biz_schedule_member_id serial NOT NULL ,
  c_member_id int4 NOT NULL default '0',
  biz_schedule_id int4 NOT NULL default '0',
  is_read smallint NOT NULL default '0',
  PRIMARY KEY  (biz_schedule_member_id)
);

CREATE TABLE biz_shisetsu (
  biz_shisetsu_id serial NOT NULL,
  name text NOT NULL,
  image_filename text NOT NULL,
  info text NOT NULL,
  PRIMARY KEY  (biz_shisetsu_id)
);

CREATE TABLE biz_shisetsu_schedule (
  biz_shisetsu_schedule_id serial NOT NULL,
  biz_shisetsu_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  date date NOT NULL default '0000-01-01',
  begin_time time NOT NULL default '00:00:00',
  finish_time time NOT NULL default '00:00:00',
  PRIMARY KEY  (biz_shisetsu_schedule_id)
);

CREATE TABLE biz_todo (
  biz_todo_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  memo text NOT NULL,
  is_check smallint NOT NULL default '0',
  writer_id int4 NOT NULL default '0',
  sort_order int4 NOT NULL default '0',
  r_datetime timestamp default NULL,
  due_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  finish_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  priority int4 NOT NULL default '3',
  public_flag varchar(20) NOT NULL default 'public',
  biz_group_id int4 NOT NULL default '0',
  PRIMARY KEY  (biz_todo_id)
);

CREATE TABLE c_access_block (
  c_access_block_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_member_id_block int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_access_block_id)
);

CREATE INDEX c_member_id_c_member_id_block ON c_access_block(c_member_id,c_member_id_block);
CREATE INDEX c_member_id_block ON c_access_block(c_member_id_block);

CREATE TABLE c_access_log (
  c_access_log_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  page_name varchar(100) NOT NULL default '',
  target_c_member_id int4 default '0',
  target_c_commu_id int4 default '0',
  target_c_commu_topic_id int4 default '0',
  target_c_diary_id int4 default '0',
  ktai_flag int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_access_log_id)
);

CREATE TABLE c_action (
  c_action_id bigserial NOT NULL,
  name text NOT NULL,
  point bigint NOT NULL default '0',
  PRIMARY KEY  (c_action_id)
);

CREATE TABLE c_admin_config (
  c_admin_config_id serial NOT NULL,
  name varchar(64) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY  (c_admin_config_id),
  UNIQUE (name)
);

CREATE TABLE c_admin_user (
  c_admin_user_id serial NOT NULL,
  username varchar(64) NOT NULL default '',
  password varchar(40) NOT NULL default '',
  auth_type varchar(20) NOT NULL default 'all',
  sess_id varchar(32) NOT NULL default '',
  PRIMARY KEY  (c_admin_user_id),
  UNIQUE (username)
);

CREATE TABLE c_album (
  c_album_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  subject text NOT NULL,
  description text NOT NULL,
  album_cover_image text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  public_flag varchar(20) NOT NULL default 'public',
  PRIMARY KEY  (c_album_id)
);

CREATE INDEX c_album_c_member_id on c_album (c_member_id);

CREATE TABLE c_album_image (
  c_album_image_id serial NOT NULL,
  c_album_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  image_filename text NOT NULL,
  image_description text NOT NULL,
  filesize int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_album_image_id)
);

CREATE INDEX c_album_image_c_album_id on c_album_image(c_album_id);

CREATE TABLE c_api (
  c_api_id serial NOT NULL,
  name text NOT NULL,
  ip text,
  PRIMARY KEY  (c_api_id)
);

CREATE INDEX c_api_name on c_api (name);

CREATE TABLE c_api_member (
  c_api_member_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  token varchar(64) NOT NULL default '',
  PRIMARY KEY  (c_api_member_id),
  UNIQUE (c_member_id)
);

CREATE TABLE c_ashiato (
  c_ashiato_id serial NOT NULL,
  c_member_id_from int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date date NOT NULL default '0000-01-01',
  PRIMARY KEY  (c_ashiato_id)
);

CREATE INDEX c_ashiato_c_member_id_from on c_ashiato (c_member_id_from);
CREATE INDEX c_ashiato_c_member_id_to on c_ashiato (c_member_id_to);
CREATE INDEX c_ashiato_to_rdatetime on c_ashiato (c_member_id_to,r_datetime);
CREATE INDEX c_ashiato_to_from_rdate on c_ashiato (c_member_id_to,c_member_id_from,r_date);
CREATE INDEX c_ashiato_to_from_rdate_rdatetime on c_ashiato (c_member_id_to,c_member_id_from,r_date,r_datetime);
CREATE INDEX c_ashiato_rdatetime on c_ashiato (r_datetime);
CREATE INDEX c_ashiato_rdate on c_ashiato (r_date);

CREATE TABLE c_banner (
  c_banner_id serial NOT NULL,
  image_filename text NOT NULL,
  a_href text NOT NULL,
  type varchar(20) NOT NULL default 'TOP',
  nickname text NOT NULL,
  is_hidden_before smallint NOT NULL default '0',
  is_hidden_after smallint NOT NULL default '0',
  PRIMARY KEY  (c_banner_id)
);

CREATE TABLE c_banner_log (
  c_banner_log_id serial NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date date NOT NULL default '0000-01-01',
  c_banner_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  clicked_from text NOT NULL,
  PRIMARY KEY  (c_banner_log_id)
);

CREATE INDEX c_banner_log_c_banner_id on c_banner_log(c_banner_id);
CREATE INDEX c_banner_log_c_member_id on c_banner_log(c_member_id);

CREATE TABLE c_blacklist (
  c_blacklist_id serial NOT NULL,
  easy_access_id bytea NOT NULL,
  info text NOT NULL,
  PRIMARY KEY  (c_blacklist_id)
);

CREATE TABLE c_bookmark (
  c_bookmark_id serial NOT NULL,
  c_member_id_from int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_bookmark_id)
);

CREATE TABLE c_cmd (
  c_cmd_id serial NOT NULL,
  name text NOT NULL,
  permit int4 NOT NULL default '0',
  url varchar(128) NOT NULL default '',
  c_cmd_caster_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_cmd_id)
);

CREATE TABLE c_cmd_caster (
  c_cmd_caster_id serial NOT NULL,
  url varchar(128) NOT NULL default '',
  title text NOT NULL,
  description text NOT NULL,
  sort_order int4 NOT NULL default '0',
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY  (c_cmd_caster_id),
  UNIQUE (url)
);

CREATE TABLE c_commu (
  c_commu_id serial NOT NULL,
  name text NOT NULL,
  c_member_id_admin int4 NOT NULL default '0',
  c_member_id_sub_admin int4 NOT NULL default '0',
  info text NOT NULL,
  c_commu_category_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date date NOT NULL default '0000-01-01',
  image_filename text NOT NULL,
  is_send_join_mail smallint NOT NULL default '1',
  is_regist_join smallint NOT NULL default '0',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  is_admit varchar(20) NOT NULL default 'public',
  is_open varchar(20) NOT NULL default 'public',
  is_topic varchar(20) NOT NULL default 'member',
  is_comment varchar(20) NOT NULL default 'member',
  PRIMARY KEY (c_commu_id)
);

CREATE INDEX c_commu_c_commu_category_id on c_commu (c_commu_category_id);
CREATE INDEX c_commu_c_member_id_admin on c_commu (c_member_id_admin);
CREATE INDEX c_commu_r_datetime on c_commu (r_datetime);
CREATE INDEX c_commu_c_commu_category_id_r_datetime on c_commu (c_commu_category_id,r_datetime);

CREATE TABLE c_commu_admin_confirm (
  c_commu_admin_confirm_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  message text NOT NULL,
  PRIMARY KEY  (c_commu_admin_confirm_id)
);

CREATE INDEX c_commu_admin_confirm_c_member_id_to on c_commu_admin_confirm (c_member_id_to);
CREATE INDEX c_commu_admin_confirm_c_commu_id on c_commu_admin_confirm (c_commu_id);

CREATE TABLE c_commu_admin_invite (
  c_commu_admin_invite_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_commu_admin_invite_id)
);

CREATE INDEX c_commu_id_c_member_id_to ON c_commu_admin_invite(c_commu_id,c_member_id_to);

CREATE TABLE c_commu_category (
  c_commu_category_id serial NOT NULL,
  name text NOT NULL,
  sort_order int4 NOT NULL default '0',
  c_commu_category_parent_id int4 NOT NULL default '0',
  is_create_commu smallint NOT NULL default '1',
  PRIMARY KEY  (c_commu_category_id)
);

CREATE INDEX c_commu_category_c_commu_category_parent_id on c_commu_category (c_commu_category_parent_id);

CREATE TABLE c_commu_category_parent (
  c_commu_category_parent_id serial NOT NULL,
  name text NOT NULL,
  sort_order int4 NOT NULL default '0',
  PRIMARY KEY  (c_commu_category_parent_id)
);

CREATE INDEX c_commu_category_parent_sort_order on c_commu_category_parent (sort_order);

CREATE TABLE c_commu_member (
  c_commu_member_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_commu_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  is_receive_mail smallint NOT NULL default '0',
  is_receive_mail_pc int4 NOT NULL default '0',
  is_receive_message int4 NOT NULL default '1',
  is_display_topic_home smallint NOT NULL default '1',
  PRIMARY KEY  (c_commu_member_id)
);

CREATE INDEX c_commu_member_c_commu_id on c_commu_member (c_commu_id);
CREATE INDEX c_commu_member_c_member_id on c_commu_member (c_member_id);
CREATE INDEX c_commu_member_c_commu_id_r_datetime on c_commu_member (c_commu_id,r_datetime);
CREATE INDEX c_commu_member_c_commu_id_c_member_id on c_commu_member (c_commu_id,c_member_id);
CREATE INDEX c_commu_member_c_member_id_is_display_topic_home on c_commu_member (c_member_id, is_display_topic_home);

CREATE TABLE c_commu_member_confirm (
  c_commu_member_confirm_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  message text NOT NULL,
  PRIMARY KEY  (c_commu_member_confirm_id)
);

CREATE INDEX c_commu_member_confirm_c_member_id on c_commu_member_confirm (c_member_id);
CREATE INDEX c_commu_member_confirm_c_commu_id on c_commu_member_confirm (c_commu_id);

CREATE TABLE c_commu_review (
  c_commu_review_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  c_review_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_commu_review_id)
);

CREATE INDEX c_commu_review_c_commu_id on c_commu_review (c_commu_id,c_review_id,c_member_id);

CREATE TABLE c_commu_sub_admin_confirm (
  c_commu_sub_admin_confirm_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  message text NOT NULL,
  PRIMARY KEY  (c_commu_sub_admin_confirm_id)
);

CREATE INDEX c_commu_sub_admin_confirm_c_member_id_to on c_commu_sub_admin_confirm (c_member_id_to);
CREATE INDEX c_commu_sub_admin_confirm_c_commu_id on c_commu_sub_admin_confirm (c_commu_id);

CREATE TABLE c_commu_topic (
  c_commu_topic_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  name text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date date NOT NULL default '0000-01-01',
  c_member_id int4 NOT NULL default '0',
  open_date date NOT NULL default '0000-01-01',
  open_date_comment varchar(100) NOT NULL default '',
  open_pref_id int4 NOT NULL default '0',
  open_pref_comment varchar(100) NOT NULL default '',
  invite_period date NOT NULL default '0000-01-01',
  event_flag int4 NOT NULL default '0',
  capacity int4 NOT NULL default '0',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_commu_topic_id)
);

CREATE INDEX c_commu_topic_c_member_id on c_commu_topic (c_member_id);
CREATE INDEX c_commu_topic_c_commu_id on c_commu_topic (c_commu_id);
CREATE INDEX c_commu_topic_r_datetime_c_commu_id on c_commu_topic (c_commu_id,u_datetime);

CREATE TABLE c_commu_topic_comment (
  c_commu_topic_comment_id serial NOT NULL,
  c_commu_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  body text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date date NOT NULL default '0000-01-01',
  number int4 NOT NULL default '0',
  c_commu_topic_id int4 NOT NULL default '0',
  image_filename1 varchar(200) NOT NULL default '',
  image_filename2 varchar(200) NOT NULL default '',
  image_filename3 varchar(200) NOT NULL default '',
  filename varchar(200) NOT NULL default '',
  PRIMARY KEY  (c_commu_topic_comment_id)
);

CREATE INDEX c_commu_topic_comment_c_commu_topic_id on c_commu_topic_comment (c_commu_topic_id);
CREATE INDEX c_commu_topic_comment_c_commu_id on c_commu_topic_comment (c_commu_id);
CREATE INDEX c_commu_topic_comment_c_member_id on c_commu_topic_comment (c_member_id);
CREATE INDEX c_commu_topic_comment_r_datetime_c_commu_id on c_commu_topic_comment (r_datetime,c_commu_id);

CREATE TABLE c_config_color (
  c_config_color_id serial NOT NULL,
  color_0 char(6) NOT NULL default '',
  color_1 char(6) NOT NULL default '',
  color_2 char(6) NOT NULL default '',
  color_3 char(6) NOT NULL default '',
  color_4 char(6) NOT NULL default '',
  color_5 char(6) NOT NULL default '',
  color_6 char(6) NOT NULL default '',
  color_7 char(6) NOT NULL default '',
  color_8 char(6) NOT NULL default '',
  color_9 char(6) NOT NULL default '',
  color_10 char(6) NOT NULL default '',
  color_11 char(6) NOT NULL default '',
  color_12 char(6) NOT NULL default '',
  color_13 char(6) NOT NULL default '',
  color_14 char(6) NOT NULL default '',
  color_15 char(6) NOT NULL default '',
  color_16 char(6) NOT NULL default '',
  color_17 char(6) NOT NULL default '',
  color_18 char(6) NOT NULL default '',
  color_19 char(6) NOT NULL default '',
  color_20 char(6) NOT NULL default '',
  color_21 char(6) NOT NULL default '',
  color_22 char(6) NOT NULL default '',
  color_23 char(6) NOT NULL default '',
  color_24 char(6) NOT NULL default '',
  color_25 char(6) NOT NULL default '',
  color_26 char(6) NOT NULL default '',
  color_27 char(6) NOT NULL default '',
  color_28 char(6) NOT NULL default '',
  color_29 char(6) NOT NULL default '',
  color_30 char(6) NOT NULL default '',
  color_31 char(6) NOT NULL default '',
  color_32 char(6) NOT NULL default '',
  color_33 char(6) NOT NULL default '',
  color_34 char(6) NOT NULL default '',
  color_35 char(6) NOT NULL default '',
  color_36 char(6) NOT NULL default '',
  color_37 char(6) NOT NULL default '',
  color_38 char(6) NOT NULL default '',
  color_39 char(6) NOT NULL default '',
  color_40 char(6) NOT NULL default '',
  color_41 char(6) NOT NULL default '',
  color_42 char(6) NOT NULL default '',
  color_43 char(6) NOT NULL default '',
  color_44 char(6) NOT NULL default '',
  color_45 char(6) NOT NULL default '',
  color_46 char(6) NOT NULL default '',
  color_47 char(6) NOT NULL default '',
  color_48 char(6) NOT NULL default '',
  color_49 char(6) NOT NULL default '',
  color_50 char(6) NOT NULL default '',
  caption char(32) NOT NULL default '',
  PRIMARY KEY  (c_config_color_id)
);

CREATE TABLE c_config_color_ktai (
  c_config_color_ktai_id serial NOT NULL,
  color_0 char(6) NOT NULL default '',
  color_1 char(6) NOT NULL default '',
  color_2 char(6) NOT NULL default '',
  color_3 char(6) NOT NULL default '',
  color_4 char(6) NOT NULL default '',
  color_5 char(6) NOT NULL default '',
  color_6 char(6) NOT NULL default '',
  color_7 char(6) NOT NULL default '',
  color_8 char(6) NOT NULL default '',
  color_9 char(6) NOT NULL default '',
  color_10 char(6) NOT NULL default '',
  color_11 char(6) NOT NULL default '',
  color_12 char(6) NOT NULL default '',
  color_13 char(6) NOT NULL default '',
  color_14 char(6) NOT NULL default '',
  color_15 char(6) NOT NULL default '',
  color_16 char(6) NOT NULL default '',
  color_17 char(6) NOT NULL default '',
  color_18 char(6) NOT NULL default '',
  color_19 char(6) NOT NULL default '',
  color_20 char(6) NOT NULL default '',
  color_21 char(6) NOT NULL default '',
  color_22 char(6) NOT NULL default '',
  color_23 char(6) NOT NULL default '',
  color_24 char(6) NOT NULL default '',
  color_25 char(6) NOT NULL default '',
  color_26 char(6) NOT NULL default '',
  color_27 char(6) NOT NULL default '',
  color_28 char(6) NOT NULL default '',
  color_29 char(6) NOT NULL default '',
  color_30 char(6) NOT NULL default '',
  color_31 char(6) NOT NULL default '',
  color_32 char(6) NOT NULL default '',
  color_33 char(6) NOT NULL default '',
  color_34 char(6) NOT NULL default '',
  color_35 char(6) NOT NULL default '',
  color_36 char(6) NOT NULL default '',
  color_37 char(6) NOT NULL default '',
  color_38 char(6) NOT NULL default '',
  color_39 char(6) NOT NULL default '',
  color_40 char(6) NOT NULL default '',
  color_41 char(6) NOT NULL default '',
  color_42 char(6) NOT NULL default '',
  color_43 char(6) NOT NULL default '',
  color_44 char(6) NOT NULL default '',
  color_45 char(6) NOT NULL default '',
  color_46 char(6) NOT NULL default '',
  color_47 char(6) NOT NULL default '',
  color_48 char(6) NOT NULL default '',
  color_49 char(6) NOT NULL default '',
  color_50 char(6) NOT NULL default '',
  caption char(32) NOT NULL default '',
  PRIMARY KEY  (c_config_color_ktai_id)
);

CREATE TABLE c_config_decoration (
  c_config_decoration_id serial NOT NULL,
  tagname text NOT NULL,
  caption text NOT NULL,
  sample text NOT NULL,
  is_enabled smallint NOT NULL default '1',
  PRIMARY KEY  (c_config_decoration_id)
);

CREATE TABLE c_diary (
  c_diary_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  subject text NOT NULL,
  body text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date date NOT NULL default '0000-01-01',
  image_filename_1 text NOT NULL,
  image_filename_2 text NOT NULL,
  image_filename_3 text NOT NULL,
  is_checked smallint NOT NULL default '0',
  public_flag varchar(20) NOT NULL default 'public',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  is_comment_input smallint NOT NULL default '1',
  PRIMARY KEY  (c_diary_id)
);

CREATE INDEX c_diary_c_member_id on c_diary (c_member_id);
CREATE INDEX c_diary_r_datetime_c_member_id on c_diary (r_datetime,c_member_id);
CREATE INDEX c_diary_c_member_id_r_date on c_diary (c_member_id,r_date);
CREATE INDEX c_diary_c_member_id_r_datetime on c_diary (c_member_id,r_datetime);
CREATE INDEX c_diary_r_datetime on c_diary (r_datetime);
CREATE INDEX c_diary_c_member_id_r_datetime_public_flag on c_diary (c_member_id,r_datetime,public_flag);

CREATE TABLE c_diary_category (
  c_diary_category_id serial NOT NULL,
  category_name text  NOT NULL,
  c_member_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_diary_category_id)
);

CREATE INDEX c_diary_category_c_member_id_c_diary_category_id on c_diary_category (c_member_id,c_diary_category_id);
CREATE INDEX c_diary_category_category_name_c_member_id on c_diary_category (category_name,c_member_id);

CREATE TABLE c_diary_category_diary (
  c_diary_category_diary_id serial NOT NULL,
  c_diary_category_id int4 NOT NULL default '0',
  c_diary_id int4 NOT NULL default '0',
  PRIMARY KEY  (c_diary_category_diary_id)
);

CREATE INDEX c_diary_category_diary_c_diary_category_id on c_diary_category_diary (c_diary_category_id);
CREATE INDEX c_diary_category_diary_c_diary_id on c_diary_category_diary (c_diary_id);

CREATE TABLE c_diary_comment (
  c_diary_comment_id serial NOT NULL,
  c_diary_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  body text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  image_filename_1 text NOT NULL,
  image_filename_2 text NOT NULL,
  image_filename_3 text NOT NULL,
  number int4 NOT NULL default '0',
  PRIMARY KEY  (c_diary_comment_id)
);

CREATE INDEX c_diary_comment_c_member_id on c_diary_comment (c_member_id);
CREATE INDEX c_diary_comment_c_diary_id on c_diary_comment (c_diary_id);
CREATE INDEX c_diary_comment_r_datetime_c_diary_id_c_member_id on c_diary_comment (r_datetime,c_diary_id,c_member_id);
CREATE INDEX c_diary_comment_c_member_id_c_diary_id on c_diary_comment (c_member_id,c_diary_id);
CREATE INDEX c_diary_comment_c_diary_id_r_datetime on c_diary_comment (c_diary_id,r_datetime);
CREATE INDEX c_diary_comment_c_member_id_r_datetime_c_diary_id on c_diary_comment (c_member_id,r_datetime,c_diary_id);

CREATE TABLE c_diary_comment_log (
  c_diary_comment_log_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_diary_id  int4 NOT NULL default '0',
  r_datetime  timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY (c_diary_comment_log_id)
);

CREATE INDEX c_diary_comment_log_c_member_id_r_datetime on c_diary_comment_log (c_member_id,r_datetime);
CREATE INDEX c_diary_comment_log_c_diary_id on c_diary_comment_log (c_diary_id);
CREATE INDEX c_diary_comment_log_c_diary_id_r_datetime on c_diary_comment_log (c_diary_id,r_datetime);
CREATE INDEX c_diary_comment_log_c_member_id_c_diary_id on c_diary_comment_log (c_member_id,c_diary_id);

CREATE TABLE c_event_member (
  c_event_member_id serial NOT NULL,
  c_commu_topic_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  is_admin smallint NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_event_member_id)
);

CREATE INDEX c_event_member_c_commu_topic_id on c_event_member (c_commu_topic_id);
CREATE INDEX c_event_member_c_member_id on c_event_member (c_member_id);

CREATE TABLE c_file (
  c_file_id serial NOT NULL,
  filename text NOT NULL,
  bin bytea NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  original_filename text,
  PRIMARY KEY  (c_file_id)
);

CREATE INDEX c_file_filename on c_file (filename);

CREATE TABLE c_free_page (
  c_free_page_id bigserial NOT NULL,
  title text NOT NULL,
  body text NOT NULL,
  type varchar(20) NOT NULL default 'pc',
  auth smallint NOT NULL default '1',
  PRIMARY KEY  (c_free_page_id)
);

CREATE TABLE c_friend (
  c_friend_id serial NOT NULL,
  c_member_id_from int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  intro text NOT NULL,
  r_datetime_intro timestamp NOT NULL default '0000-01-01 00:00:00',
  is_display_friend_home smallint NOT NULL default '1',
  PRIMARY KEY  (c_friend_id)
);

CREATE INDEX c_friend_c_member_id_to on c_friend (c_member_id_to);
CREATE INDEX c_friend_c_member_id_from on c_friend (c_member_id_from);
CREATE INDEX c_friend_c_member_id_from_c_friend_id on c_friend (c_member_id_from,c_friend_id);
CREATE INDEX c_friend_c_member_id_from_r_datetime on c_friend (c_member_id_from,r_datetime);
CREATE INDEX c_friend_c_member_id_to_r_datetime_intro on c_friend (c_member_id_to,r_datetime_intro);
CREATE INDEX c_friend_c_member_id_from_is_display_friend_home on c_friend (c_member_id_from, is_display_friend_home);

CREATE TABLE c_friend_confirm (
  c_friend_confirm_id serial NOT NULL,
  c_member_id_from int4 NOT NULL default '0',
  c_member_id_to int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  message text NOT NULL,
  PRIMARY KEY  (c_friend_confirm_id)
);

CREATE INDEX c_friend_confirm_c_member_id_to on c_friend_confirm (c_member_id_to);
CREATE INDEX c_friend_confirm_c_member_id_from on c_friend_confirm (c_member_id_from);

CREATE TABLE c_holiday (
  c_holiday_id serial NOT NULL,
  name text  NOT NULL,
  month int4 NOT NULL default '0',
  day int4 NOT NULL default '0',
  PRIMARY KEY  (c_holiday_id)
);

CREATE TABLE c_image (
  c_image_id serial NOT NULL,
  filename text NOT NULL,
  bin bytea NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  type text,
  PRIMARY KEY  (c_image_id)
);

CREATE INDEX c_image_filename on c_image (filename);

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


CREATE TABLE c_ktai_address_pre (
  c_ktai_address_pre_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  session varchar(32) NOT NULL default '',
  ktai_address varchar(64) NOT NULL default '',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_ktai_address_pre_id),
  UNIQUE (session)
);

CREATE TABLE c_login_failure (
  c_login_failure_id serial NOT NULL,
  ip_addr varchar(64) NOT NULL default '',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_login_failure_id)
);

CREATE INDEX c_login_failure_ip_addr on c_login_failure (ip_addr);

CREATE TABLE c_login_reject (
  c_login_reject_id serial NOT NULL,
  ip_addr varchar(64) NOT NULL default '',
  expired_at timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_login_reject_id),
  UNIQUE (ip_addr)
);

CREATE TABLE c_member (
  c_member_id serial NOT NULL,
  nickname text NOT NULL,
  birth_year smallint NOT NULL default '0',
  birth_month smallint NOT NULL default '0',
  birth_day smallint NOT NULL default '0',
  public_flag_birth_year varchar(20) NOT NULL default 'public',
  public_flag_birth_month_day varchar(20) NOT NULL default 'public',
  image_filename text NOT NULL,
  image_filename_1 text NOT NULL,
  image_filename_2 text NOT NULL,
  image_filename_3 text NOT NULL,
  access_date timestamp NOT NULL default '0000-01-01 00:00:00',
  r_date timestamp NOT NULL default '0000-01-01 00:00:00',
  rss text NOT NULL,
  ashiato_mail_num int4 NOT NULL default '0',
  is_receive_mail smallint NOT NULL default '0',
  is_receive_daily_news smallint NOT NULL default '0',
  is_receive_ktai_mail smallint NOT NULL default '0',
  c_member_id_invite int4 NOT NULL default '0',
  c_password_query_id int4 NOT NULL default '0',
  public_flag_diary varchar(20) NOT NULL default 'public',
  is_login_rejected smallint NOT NULL default '0',
  is_shinobiashi smallint NOT NULL default '0',
  ashiato_count_log int4 NOT NULL default '0',
  schedule_start_day int4 NOT NULL default '0',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_member_id)
);

CREATE INDEX c_member_birth_year_c_member_id on c_member (birth_year,c_member_id);

CREATE TABLE c_member_config (
  c_member_config_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  name varchar(64) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY  (c_member_config_id)
);

CREATE TABLE c_member_ktai_pre (
  c_member_ktai_pre_id serial NOT NULL,
  session varchar(32) NOT NULL default '',
  ktai_address varchar(64) NOT NULL default '',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  c_member_id_invite int4 NOT NULL default '0',
  is_disabled_regist_easy_access_id smallint NOT NULL default '0',
  PRIMARY KEY  (c_member_ktai_pre_id),
  UNIQUE (session)
);

CREATE TABLE c_member_pre (
  c_member_pre_id serial NOT NULL,
  session varchar(255) NOT NULL default '',
  nickname text NOT NULL,
  birth_year smallint NOT NULL default '0',
  birth_month smallint NOT NULL default '0',
  birth_day smallint NOT NULL default '0',
  public_flag_birth_year varchar(20) NOT NULL default 'public',
  public_flag_birth_month_day varchar(20) NOT NULL default 'public',
  r_date timestamp NOT NULL default '0000-01-01 00:00:00',
  is_receive_mail smallint NOT NULL default '0',
  is_receive_daily_news smallint NOT NULL default '0',
  is_receive_ktai_mail smallint NOT NULL default '0',
  c_member_id_invite int4 NOT NULL default '0',
  password text NOT NULL,
  pc_address text NOT NULL,
  ktai_address text NOT NULL,
  regist_address text NOT NULL,
  easy_access_id text NOT NULL,
  c_password_query_id int4 NOT NULL default '0',
  c_password_query_answer text NOT NULL,
  ktai_session varchar(255) NOT NULL default '',
  is_disabled_regist_easy_access_id smallint NOT NULL default '0',
  login_id varchar(255) NOT NULL default '',
  is_sns_entry_confirm smallint NOT NULL default '0',
  PRIMARY KEY  (c_member_pre_id),
  UNIQUE (session)
);

CREATE TABLE c_member_pre_profile (
  c_member_pre_profile_id serial NOT NULL,
  c_member_pre_id int4 NOT NULL default '0',
  c_profile_id int4 NOT NULL default '0',
  c_profile_option_id int4 NOT NULL default '0',
  value text NOT NULL,
  public_flag varchar(20) NOT NULL default 'public',
  PRIMARY KEY  (c_member_pre_profile_id)
);

CREATE INDEX c_member_pre_profile_c_member_pre_id on c_member_pre_profile (c_member_pre_id);
CREATE INDEX c_member_pre_profile_c_profile_id on c_member_pre_profile (c_profile_id);
CREATE INDEX c_member_pre_profile_c_profile_option_id on c_member_pre_profile (c_profile_option_id);

CREATE TABLE c_member_profile (
  c_member_profile_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_profile_id int4 NOT NULL default '0',
  c_profile_option_id int4 NOT NULL default '0',
  value text NOT NULL,
  public_flag varchar(20) NOT NULL default 'public',
  PRIMARY KEY  (c_member_profile_id)
);

CREATE INDEX c_member_profile_c_member_id on c_member_profile (c_member_id);
CREATE INDEX c_member_profile_c_profile_id on c_member_profile (c_profile_id);
CREATE INDEX c_member_profile_c_profile_option_id on c_member_profile (c_profile_option_id);
CREATE INDEX c_member_profile_c_profile_option_id_c_member_id on c_member_profile (c_profile_option_id,c_member_id);
CREATE INDEX c_member_profile_public_flag_c_profile_option_id on c_member_profile (public_flag,c_profile_option_id);

CREATE TABLE c_member_secure (
  c_member_secure_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  hashed_password bytea NOT NULL,
  hashed_password_query_answer bytea NOT NULL,
  pc_address bytea NOT NULL,
  ktai_address bytea NOT NULL,
  regist_address bytea NOT NULL,
  easy_access_id bytea NOT NULL,
  sess_id varchar(32) NOT NULL default '',
  PRIMARY KEY  (c_member_secure_id),
  UNIQUE (c_member_id)
);

CREATE TABLE c_message (
  c_message_id serial NOT NULL,
  c_member_id_to int4 NOT NULL default '0',
  c_member_id_from int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  body text NOT NULL,
  subject text NOT NULL,
  is_read smallint NOT NULL default '0',
  is_syoudaku smallint NOT NULL default '0',
  is_deleted_to smallint NOT NULL default '0',
  is_deleted_from smallint NOT NULL default '0',
  is_send smallint NOT NULL default '0',
  is_hensin smallint NOT NULL default '0',
  hensinmoto_c_message_id int4 NOT NULL default '0',
  is_kanzen_sakujo_from smallint NOT NULL default '0',
  is_kanzen_sakujo_to smallint NOT NULL default '0',
  image_filename_1 text NOT NULL,
  image_filename_2 text NOT NULL,
  image_filename_3 text NOT NULL,
  filename varchar(200) NOT NULL default '',
  PRIMARY KEY  (c_message_id)
);

CREATE INDEX c_message_c_member_id_from on c_message (c_member_id_from);
CREATE INDEX c_message_c_member_id_to on c_message (c_member_id_to);
CREATE INDEX c_message_c_member_id_from_r_datetime on c_message (c_member_id_from,r_datetime);
CREATE INDEX c_message_c_member_id_to_r_datetime on c_message (c_member_id_to,r_datetime);
CREATE INDEX c_message_c_member_id_to_is_read_is_send on c_message (c_member_id_to,is_read,is_send);

CREATE TABLE c_message_queue (
  c_message_queue_id bigserial NOT NULL,
  c_member_id_from bigint NOT NULL default '0',
  c_member_id_to bigint NOT NULL default '0',
  subject text NOT NULL,
  body text NOT NULL,
  PRIMARY KEY  (c_message_queue_id)
);

CREATE TABLE c_module (
  c_module_id serial NOT NULL,
  name text NOT NULL,
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY  (c_module_id),
  UNIQUE (name)
);

CREATE TABLE c_navi (
  c_navi_id serial NOT NULL,
  navi_type varchar(10) NOT NULL default '',
  sort_order int4 NOT NULL default '0',
  url text NOT NULL,
  caption text NOT NULL,
  PRIMARY KEY  (c_navi_id)
);

CREATE INDEX c_navi_type_sort on c_navi (navi_type,sort_order);

CREATE TABLE c_password_query (
  c_password_query_id serial NOT NULL,
  c_password_query_question text NOT NULL,
  PRIMARY KEY  (c_password_query_id)
);

CREATE TABLE c_pc_address_pre (
  c_pc_address_pre_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  pc_address text NOT NULL,
  session varchar(32) NOT NULL default '',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_pc_address_pre_id)
);

CREATE INDEX c_pc_address_pre_c_member_id on c_pc_address_pre (c_member_id);

CREATE TABLE c_point_log (
  c_point_log_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  point int4 NOT NULL default '0',
  memo text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_point_log_id)
);

CREATE INDEX c_point_log_c_member_id on c_point_log (c_member_id);
CREATE INDEX c_point_log_r_datetime on c_point_log (r_datetime);
CREATE INDEX c_point_log_c_member_id_2 on c_point_log (c_member_id,r_datetime);

CREATE TABLE c_point_log_tag (
  c_point_log_tag_id serial NOT NULL,
  c_point_log_id int4 NOT NULL default '0',
  tag varchar(100) NOT NULL default '',
  PRIMARY KEY  (c_point_log_tag_id)
);

CREATE INDEX c_point_log_tag_c_point_log_id on c_point_log_tag (c_point_log_id);
CREATE INDEX c_point_log_tag_tag on c_point_log_tag (tag);
CREATE INDEX c_point_log_tag_c_point_log_id_2 on c_point_log_tag (c_point_log_id,tag);

CREATE TABLE c_profile (
  c_profile_id serial NOT NULL,
  name text NOT NULL,
  caption text NOT NULL,
  info text NOT NULL,
  is_required smallint NOT NULL default '0',
  public_flag_edit smallint NOT NULL default '0',
  public_flag_default varchar(20) NOT NULL default 'public',
  form_type varchar(20) NOT NULL default 'text',
  sort_order int4 NOT NULL default '0',
  disp_regist smallint NOT NULL default '0',
  disp_config smallint NOT NULL default '1',
  disp_search smallint NOT NULL default '1',
  val_type text NOT NULL,
  val_regexp text NOT NULL,
  val_min int4 NOT NULL default '0',
  val_max int4 NOT NULL default '0',
  PRIMARY KEY  (c_profile_id)
);

CREATE INDEX c_profile_sort_order on c_profile (sort_order);

CREATE TABLE c_profile_option (
  c_profile_option_id serial NOT NULL,
  c_profile_id int4 NOT NULL default '0',
  value text NOT NULL,
  sort_order int4 NOT NULL default '0',
  PRIMARY KEY  (c_profile_option_id)
);

CREATE INDEX c_profile_option_c_profile_id on c_profile_option (c_profile_id);
CREATE INDEX c_profile_option_sort_order on c_profile_option (sort_order);
CREATE INDEX c_profile_option_c_profile_id_sort_order on c_profile_option (c_profile_id,sort_order);

CREATE TABLE c_profile_pref (
  c_profile_pref_id serial NOT NULL,
  pref text NOT NULL,
  sort_order int4 NOT NULL default '0',
  map_latitude double precision NOT NULL default '0',
  map_longitude double precision NOT NULL default '0',
  map_zoom int4 NOT NULL default '0',
  PRIMARY KEY  (c_profile_pref_id)
);

CREATE INDEX c_profile_pref_sort_order on c_profile_pref (sort_order);
CREATE INDEX c_profile_pref_map_latitude_map_longitude on c_profile_pref (map_latitude,map_longitude);

CREATE TABLE c_rank (
  c_rank_id bigserial NOT NULL,
  name text NOT NULL,
  image_filename text NOT NULL,
  point bigint NOT NULL default '0',
  PRIMARY KEY  (c_rank_id)
);

CREATE TABLE c_review (
  c_review_id serial NOT NULL,
  title text NOT NULL,
  release_date varchar(100) NOT NULL default '0000-01-01',
  manufacturer text NOT NULL,
  author text NOT NULL,
  c_review_category_id int4 NOT NULL default '0',
  image_small text NOT NULL,
  image_medium text NOT NULL,
  image_large text NOT NULL,
  url text NOT NULL,
  asin varchar(100) NOT NULL default '',
  list_price varchar(100) NOT NULL default '0',
  retail_price varchar(100) NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_review_id)
);

CREATE INDEX c_review_category_id on c_review (c_review_category_id);

CREATE TABLE c_review_category (
  c_review_category_id serial NOT NULL,
  category varchar(100) NOT NULL default '',
  category_disp varchar(100) NOT NULL default '',
  sort_order int4 NOT NULL default '0',
  PRIMARY KEY  (c_review_category_id)
);

CREATE TABLE c_review_clip (
  c_review_clip_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_review_id int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_review_clip_id)
);

CREATE INDEX c_review_clip_c_member_id on c_review_clip (c_member_id,c_review_id);

CREATE TABLE c_review_comment (
  c_review_comment_id serial NOT NULL,
  c_review_id int4 NOT NULL default '0',
  c_member_id int4 NOT NULL default '0',
  body text NOT NULL,
  satisfaction_level int4 NOT NULL default '0',
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_review_comment_id)
);

CREATE INDEX c_review_id_r_datetime ON c_review_comment(c_review_id,r_datetime);
CREATE INDEX c_member_id_r_datetime ON c_review_comment(c_member_id,r_datetime);

CREATE TABLE c_rss_cache (
  c_rss_cache_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  subject text NOT NULL,
  body text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  link text NOT NULL,
  cache_date timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_rss_cache_id)
);

CREATE INDEX c_rss_cache_c_member_id on c_rss_cache (c_member_id);
CREATE INDEX c_rss_cache_c_member_id_r_datetime on c_rss_cache (c_member_id,r_datetime);
CREATE INDEX c_rss_cache_r_datetime on c_rss_cache (r_datetime);
CREATE INDEX c_rss_cache_r_datetime_c_member_id on c_rss_cache (r_datetime,c_member_id);

CREATE TABLE c_schedule (
  c_schedule_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  title text NOT NULL,
  body text NOT NULL,
  start_date date NOT NULL default '0000-01-01',
  start_time time default NULL,
  end_date date NOT NULL default '0000-01-01',
  end_time time default NULL,
  is_receive_mail smallint NOT NULL default '0',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_schedule_id)
);

CREATE INDEX c_schedule_c_member_id on c_schedule (c_member_id);

CREATE TABLE c_searchlog (
  c_searchlog_id serial NOT NULL,
  searchword text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  c_member_id int4 NOT NULL default '0',
  PRIMARY KEY  (c_searchlog_id)
);

CREATE INDEX c_searchlog_c_member_id on c_schedule (c_member_id);

CREATE TABLE c_send_messages_history (
  c_send_messages_history_id serial NOT NULL,
  subject text NOT NULL,
  body text NOT NULL,
  send_num bigint NOT NULL default '0',
  type varchar(20) NOT NULL default 'mail',
  c_member_ids text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_send_messages_history_id)
);

CREATE TABLE c_session (
  c_session_id serial NOT NULL,
  sess_name varchar(64) NOT NULL default '',
  sess_id varchar(32) NOT NULL default '',
  sess_time int4 NOT NULL default '0',
  sess_data text NOT NULL,
  PRIMARY KEY  (c_session_id),
  CONSTRAINT sess_name UNIQUE(sess_name,sess_id)
);

CREATE TABLE c_siteadmin (
  c_siteadmin_id serial NOT NULL,
  target varchar(100) NOT NULL default '',
  body text NOT NULL,
  r_date date NOT NULL default '0000-01-01',
  PRIMARY KEY  (c_siteadmin_id),
  UNIQUE (target)
);

CREATE TABLE c_skin_filename (
  c_skin_filename_id serial NOT NULL,
  skinname varchar(64) NOT NULL default '',
  filename text NOT NULL,
  PRIMARY KEY  (c_skin_filename_id),
  UNIQUE (skinname)
);

CREATE TABLE c_template (
  c_template_id serial NOT NULL,
  name varchar(64) NOT NULL default '',
  source text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_template_id),
  UNIQUE (name)
);

CREATE TABLE c_tmp_file (
  c_tmp_file_id serial NOT NULL,
  filename text NOT NULL,
  bin bytea NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  original_filename text,
  PRIMARY KEY  (c_tmp_file_id)
);

CREATE INDEX c_tmp_file_filename on c_tmp_file (filename);

CREATE TABLE c_tmp_image (
  c_tmp_image_id serial NOT NULL,
  filename text NOT NULL,
  bin bytea NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  type text,
  filesize int4 NOT NULL default '0',
  PRIMARY KEY  (c_tmp_image_id)
);

CREATE INDEX c_tmp_image_filename on c_tmp_image(filename);

CREATE TABLE c_username (
  c_username_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  username varchar(255) NOT NULL default '0',
  PRIMARY KEY  (c_username_id),
  UNIQUE (c_member_id),
  UNIQUE (username)
);

CREATE TABLE mail_queue (
  id bigint NOT NULL default '0',
  create_time timestamp NOT NULL default '0000-01-01 00:00:00',
  time_to_send timestamp NOT NULL default '0000-01-01 00:00:00',
  sent_time timestamp default NULL,
  id_user bigint NOT NULL default '0',
  ip varchar(20) NOT NULL default 'unknown',
  sender varchar(50) NOT NULL default '',
  recipient varchar(50) NOT NULL default '',
  headers text NOT NULL,
  body text NOT NULL,
  try_sent smallint NOT NULL default '0',
  delete_after_send smallint NOT NULL default '1',
  PRIMARY KEY  (id)
);

CREATE INDEX mail_queue_id on mail_queue (id);
CREATE INDEX mail_queue_time_to_send on mail_queue (time_to_send);
CREATE INDEX mail_queue_id_user on mail_queue (id_user);

CREATE TABLE mail_queue_seq (
  id serial NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE portal_config (
  portal_config_id serial NOT NULL,
  name text NOT NULL,
  value text NOT NULL,
  PRIMARY KEY (portal_config_id),
  UNIQUE (name)
);

CREATE TABLE portal_layout (
  portal_layout_id serial NOT NULL,
  content_name text NOT NULL,
  position int4 NOT NULL,
  is_image smallint NOT NULL default '0',
  PRIMARY KEY  (portal_layout_id),
  UNIQUE (content_name),
  UNIQUE (position)
);

CREATE TABLE portal_free_area (
  portal_free_area_id serial NOT NULL,
  html text NOT NULL,
  name text NOT NULL,
  PRIMARY KEY (portal_free_area_id)
);

CREATE TABLE portal_rss (
  portal_rss_id serial NOT NULL,
  url text NOT NULL,
  name text NOT NULL,
  PRIMARY KEY (portal_rss_id)
);

CREATE TABLE portal_link (
  portal_link_id serial NOT NULL,
  title text NOT NULL,
  url text NOT NULL,
  sort_order int4 NOT NULL default '0',
  is_target_blank smallint NOT NULL default '0',
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY (portal_link_id)
);

CREATE TABLE portal_image (
  portal_image_id serial NOT NULL,
  image_filename text NOT NULL,
  PRIMARY KEY (portal_image_id)
);

CREATE TABLE portal_layout_ktai (
  portal_layout_ktai_id serial NOT NULL,
  content_name text NOT NULL,
  position int4 NOT NULL default '0',
  PRIMARY KEY (portal_layout_ktai_id),
  UNIQUE (content_name),
  UNIQUE (position)
);

CREATE TABLE portal_free_area_ktai (
  portal_free_area_ktai_id serial NOT NULL,
  name text NOT NULL,
  html text NOT NULL,
  PRIMARY KEY (portal_free_area_ktai_id)
);

