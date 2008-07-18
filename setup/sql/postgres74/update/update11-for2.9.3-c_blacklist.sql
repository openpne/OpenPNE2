CREATE TABLE c_blacklist (
  c_blacklist_id serial NOT NULL,
  easy_access_id bytea NOT NULL,
  info text NOT NULL,
  PRIMARY KEY  (c_blacklist_id)
);