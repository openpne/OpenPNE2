
CREATE TABLE c_send_messages_history (
  c_send_messages_history_id bigint(20) NOT NULL auto_increment,
  subject text NOT NULL,
  body text NOT NULL,
  send_num bigint(20) NOT NULL default '0',
  type enum('mail','message') NOT NULL default 'mail',
  c_member_ids text NOT NULL,
  r_datetime datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (c_send_messages_history_id)
) TYPE=MyISAM;


CREATE TABLE c_message_queue (
  c_message_queue_id bigint(20) NOT NULL auto_increment,
  c_member_id_from bigint(20) NOT NULL default '0',
  c_member_id_to bigint(20) NOT NULL default '0',
  subject text NOT NULL,
  body text NOT NULL,
  PRIMARY KEY  (c_message_queue_id)
) TYPE=MyISAM;
