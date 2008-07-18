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

