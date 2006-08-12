##
## セッションデータ保存用テーブル
## (通常のデータとは別データベースにもおけます)
##

CREATE TABLE c_session (
  c_session_id int(11) NOT NULL auto_increment,
  sess_name varchar(64) NOT NULL default '',
  sess_id varchar(32) NOT NULL default '',
  sess_time int(11) NOT NULL default '0',
  sess_data text NOT NULL,
  PRIMARY KEY (c_session_id),
  UNIQUE KEY (sess_name, sess_id)
) TYPE=MyISAM;
