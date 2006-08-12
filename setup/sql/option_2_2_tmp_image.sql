CREATE TABLE c_tmp_image (
  c_tmp_image_id int(11) NOT NULL auto_increment,
  filename text NOT NULL,
  bin longblob NOT NULL,
  r_datetime datetime NOT NULL default '0000-00-00 00:00:00',
  type text,
  PRIMARY KEY  (c_tmp_image_id),
  KEY filename (filename(100))
) TYPE=MyISAM;
