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
