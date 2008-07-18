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

