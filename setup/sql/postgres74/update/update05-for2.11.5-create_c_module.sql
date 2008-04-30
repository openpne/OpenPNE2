CREATE TABLE c_module (
  c_module_id serial NOT NULL,
  name text NOT NULL,
  is_enabled smallint NOT NULL default '0',
  PRIMARY KEY  (c_module_id),
  UNIQUE (name)
);

