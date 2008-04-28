-- update01
UPDATE c_review_category SET category = 'Books' WHERE category = 'books-jp';
UPDATE c_review_category SET category = 'ForeignBooks' WHERE category = 'books-us';
UPDATE c_review_category SET category = 'Music' WHERE category = 'music-jp';
UPDATE c_review_category SET category = 'Classical' WHERE category = 'classical-jp';
UPDATE c_review_category SET category = 'DVD' WHERE category = 'dvd-jp';
UPDATE c_review_category SET category = 'VideoGames' WHERE category = 'videogames-jp';
UPDATE c_review_category SET category = 'Software' WHERE category = 'software-jp';
UPDATE c_review_category SET category = 'Electronics' WHERE category = 'electronics-jp';
UPDATE c_review_category SET category = 'Kitchen' WHERE category = 'kitchen-jp';
UPDATE c_review_category SET category = 'Toys' WHERE category = 'toys-jp';
UPDATE c_review_category SET category = 'SportingGoods' WHERE category = 'sporting-goods-jp';
UPDATE c_review_category SET category = 'HealthPersonalCare' WHERE category = 'hpc-jp';
INSERT INTO c_review_category VALUES (nextval('c_review_category_c_review_category_id_seq'),'Watches','時計',13);
INSERT INTO c_review_category VALUES (nextval('c_review_category_c_review_category_id_seq'),'Baby','ベビー＆マタニティ',14);
INSERT INTO c_review_category VALUES (nextval('c_review_category_c_review_category_id_seq'),'Apparel','アパレル＆シューズ',15);

-- update02
UPDATE c_commu SET info = info || 'http://maps.google.co.jp/maps?ll=' || map_latitude || ',' || map_longitude || '&z=' || map_zoom WHERE is_display_map = 1;

ALTER TABLE c_commu DROP COLUMN is_display_map;
ALTER TABLE c_commu DROP COLUMN map_latitude;
ALTER TABLE c_commu DROP COLUMN map_longitude;
ALTER TABLE c_commu DROP COLUMN map_zoom;

-- update03
CREATE INDEX c_member_id_c_member_id_block ON c_access_block(c_member_id,c_member_id_block);
CREATE INDEX c_member_id_block ON c_access_block(c_member_id_block);

CREATE INDEX c_review_id_r_datetime ON c_review_comment(c_review_id,r_datetime);
CREATE INDEX c_member_id_r_datetime ON c_review_comment(c_member_id,r_datetime);

CREATE INDEX c_commu_id_c_memer_id_to ON c_commu_admin_invite(c_commu_id,c_member_id_to);

-- update04
ALTER TABLE c_member_pre ADD COLUMN login_id varchar(255) NOT NULL default '';

-- update05
CREATE TABLE c_module (
  c_module_id serial NOT NULL,
  name text NOT NULL,
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY  (c_module_id),
  UNIQUE (name)
);

-- update06
DROP TABLE portal_config;
CREATE TABLE portal_config (
  portal_config_id serial NOT NULL,
  name text NOT NULL,
  value text NOT NULL,
  PRIMARY KEY (portal_config_id),
  UNIQUE (name)
);

DROP TABLE portal_layout;
CREATE TABLE portal_layout (
  portal_layout_id serial NOT NULL,
  content_name text NOT NULL,
  position int4 NOT NULL,
  is_image smallint NOT NULL default '0',
  PRIMARY KEY  (portal_layout_id),
  UNIQUE (content_name),
  UNIQUE (position)
);

DROP TABLE portal_free_area;
CREATE TABLE portal_free_area (
  portal_free_area_id serial NOT NULL,
  html text NOT NULL,
  name text NOT NULL,
  PRIMARY KEY (portal_free_area_id)
);

DROP TABLE portal_rss;
CREATE TABLE portal_rss (
  portal_rss_id serial NOT NULL,
  url text NOT NULL,
  name text NOT NULL,
  PRIMARY KEY (portal_rss_id)
);

DROP TABLE portal_link;
CREATE TABLE portal_link (
  portal_link_id serial NOT NULL,
  title text NOT NULL,
  url text NOT NULL,
  sort_order int4 NOT NULL default '0',
  is_target_blank smallint NOT NULL default '0',
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY (portal_link_id)
);

DROP TABLE portal_image;
CREATE TABLE portal_image (
  portal_image_id serial NOT NULL,
  image_filename text NOT NULL,
  PRIMARY KEY (portal_image_id)
);

DROP TABLE portal_layout_ktai;
CREATE TABLE portal_layout_ktai (
  portal_layout_ktai_id serial NOT NULL,
  content_name text NOT NULL,
  position int4 NOT NULL default '0',
  PRIMARY KEY (portal_layout_ktai_id),
  UNIQUE (content_name),
  UNIQUE (position)
);

DROP TABLE portal_free_area_ktai;
CREATE TABLE portal_free_area_ktai (
  portal_free_area_ktai_id serial NOT NULL,
  name text NOT NULL,
  html text NOT NULL,
  PRIMARY KEY (portal_free_area_ktai_id)
);

INSERT INTO portal_config VALUES (nextval('portal_config_portal_config_id_seq'),'USE_PORTAL','0');
INSERT INTO portal_config VALUES (nextval('portal_config_portal_config_id_seq'),'HEAD_TEXT_TYPE','0');
INSERT INTO portal_config VALUES (nextval('portal_config_portal_config_id_seq'),'HEAD_TEXT','');
INSERT INTO portal_config VALUES (nextval('portal_config_portal_config_id_seq'),'LAYOUT_TYPE','2');
INSERT INTO portal_config VALUES (nextval('portal_config_portal_config_id_seq'),'COLOR_TYPE','005_openpne_blue');

INSERT INTO c_module VALUES(nextval('c_module_c_module_id_seq'), 'portal', 1);

-- update07
CREATE TABLE c_config_decoration (
  c_config_decoration_id serial NOT NULL,
  tagname text NOT NULL,
  caption text NOT NULL,
  sample text NOT NULL,
  is_enabled smallint NOT NULL default '1',
  PRIMARY KEY  (c_config_decoration_id)
);

INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:b','太字','<strong>表示例</strong>',1);
INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:u','下線','<ins>表示例</ins>',1);
INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:s','取り消し線','<del>表示例</del>',1);
INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:i','斜体','<em>表示例</em>',1);
INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:large','大きめの文字','<span style="font-size:20px;">表示例</span>',1);
INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:small','小さめの文字','<span style="font-size:8px;">表示例</span>',1);
INSERT INTO c_config_decoration VALUES (nextval('c_config_decoration_c_config_decoration_id_seq'),'op:color','文字色指定','<span style="color:#33F864;">表示例</span>',1);

INSERT INTO c_admin_config VALUES (nextval('c_admin_config_c_admin_config_id_seq'),'OPENPNE_USE_DECORATION',1);

-- update08
CREATE TABLE c_member_config (
  c_member_config_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_member_config_option_id int4 NOT NULL default '0',
  value text NOT NULL,
  PRIMARY KEY  (c_member_config_id)
);

CREATE TABLE c_member_config_option (
  c_member_config_option_id serial NOT NULL,
  name varchar(64) NOT NULL default '',
  PRIMARY KEY  (c_member_config_option_id),
  UNIQUE (name)
);

INSERT INTO c_member_config_option VALUES (nextval('c_member_config_option_c_member_config_option_id_seq'),'SEND_DIARY_COMMENT_MAIL_KTAI');

-- update09
ALTER TABLE c_message ADD COLUMN filename varchar(200) NOT NULL default '';

-- update10
CREATE TABLE c_album (
  c_album_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  subject text NOT NULL,
  description text NOT NULL,
  album_cover_image text NOT NULL,
  r_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  public_flag varchar(20) NOT NULL default 'public',
  PRIMARY KEY (c_album_id)
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
  PRIMARY KEY (c_album_image_id)
);

-- update11
ALTER TABLE c_member ADD COLUMN public_flag_birth_month_day varchar(20) NOT NULL default 'public';
ALTER TABLE c_member_pre ADD COLUMN public_flag_birth_month_day varchar(20) NOT NULL default 'public';

-- update12
ALTER TABLE c_commu_topic ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';

DROP INDEX c_commu_topic_r_datetime_c_commu_id;
CREATE INDEX c_commu_topic_r_datetime_c_commu_id on c_commu_topic (c_commu_id,u_datetime);

CREATE INDEX c_commu_member_c_commu_id_c_member_id on c_commu_member (c_commu_id,c_member_id);

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

CREATE TABLE tmp_c_commu_topic (
  c_commu_topic_id serial NOT NULL,
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_commu_topic_id)
);

INSERT INTO tmp_c_commu_topic (c_commu_topic_id, u_datetime)
  (SELECT cct.c_commu_topic_id, MAX(cctc.r_datetime) as u_datetime
     FROM c_commu_topic_comment AS cctc ,c_commu_topic AS cct
     WHERE cctc.c_commu_topic_id = cct.c_commu_topic_id 
     GROUP BY cct.c_commu_topic_id);

UPDATE c_commu_topic SET u_datetime = tmp_c_commu_topic.u_datetime
    FROM tmp_c_commu_topic
    WHERE c_commu_topic.c_commu_topic_id = tmp_c_commu_topic.c_commu_topic_id;

DROP TABLE tmp_c_commu_topic;

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, c_member_id, c_diary_id, MAX(r_datetime) AS r_datetime
    FROM c_diary_comment
    WHERE r_datetime <= current_timestamp + '-15 days'
    GROUP BY c_member_id, c_diary_id
    ORDER BY r_datetime);

-- update13
TRUNCATE TABLE c_diary_comment_log;

CREATE TABLE tmp_c_diary_comment_log (
  c_diary_comment_log_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_diary_id  int4 NOT NULL default '0',
  r_datetime  timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY (c_diary_comment_log_id)
);

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, c_member_id, c_diary_id, MAX(r_datetime) AS r_datetime
    FROM c_diary_comment
    WHERE r_datetime <= current_timestamp + '-15 days'
    GROUP BY c_member_id, c_diary_id
    ORDER BY r_datetime);

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, tmp_c_diary_comment_log.c_member_id, tmp_c_diary_comment_log.c_diary_id, 
    tmp_c_diary_comment_log.r_datetime as r_datetime
    FROM tmp_c_diary_comment_log
    INNER JOIN c_diary USING (c_diary_id) 
    WHERE tmp_c_diary_comment_log.c_member_id <> c_diary.c_member_id
    ORDER BY r_datetime);

DROP TABLE tmp_c_diary_comment_log;

-- update14
CREATE TABLE c_cmd_caster (
  c_cmd_caster_id serial NOT NULL,
  url varchar(128) NOT NULL default '',
  title text NOT NULL,
  description text NOT NULL,
  sort_order int4 NOT NULL default '0',
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY  (c_cmd_caster_id),
  UNIQUE url (url)
);

ALTER TABLE c_cmd ADD COLUMN url varchar(128) NOT NULL default '';
DROP INDEX name;
DROP INDEX name_2;
ALTER TABLE c_cmd ADD COLUMN c_cmd_caster_id int4 NOT NULL default '0';
ALTER TABLE c_cmd ADD COLUMN r_datetime timestamp NOT NULL default '0000-01-01 00:00:00';
ALTER TABLE c_cmd ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';

-- update15
ALTER TABLE c_member_config ADD COLUMN name varchar(64) NOT NULL default '';

UPDATE c_member_config SET name = c_member_config_option.name
    FROM c_member_config_option
    WHERE c_member_config.c_member_config_option_id = c_member_config_option.c_member_config_option_id;

DROP TABLE c_member_config_option;
ALTER TABLE c_member_config DROP COLUMN c_member_config_option_id;

-- update16
CREATE INDEX c_album_image_c_album_id on c_album_image (c_album_id);
