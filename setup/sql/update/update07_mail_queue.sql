#
# `mail_queue`
#

CREATE TABLE mail_queue (
  id bigint(20) NOT NULL default '0',
  create_time datetime NOT NULL default '0000-00-00 00:00:00',
  time_to_send datetime NOT NULL default '0000-00-00 00:00:00',
  sent_time datetime default NULL,
  id_user bigint(20) NOT NULL default '0',
  ip varchar(20) NOT NULL default 'unknown',
  sender varchar(50) NOT NULL default '',
  recipient varchar(50) NOT NULL default '',
  headers text NOT NULL,
  body longtext NOT NULL,
  try_sent tinyint(4) NOT NULL default '0',
  delete_after_send tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY id (id),
  KEY time_to_send (time_to_send),
  KEY id_user (id_user)
);

#
# `mail_queue_seq`
#

CREATE TABLE mail_queue_seq (
  id int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (id)
);

#
# Data for `mail_queue_seq`
#

INSERT INTO mail_queue_seq (id) VALUES (1);