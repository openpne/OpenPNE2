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

