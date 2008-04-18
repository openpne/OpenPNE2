ALTER TABLE c_commu_topic ADD COLUMN u_datetime timestamp NOT NULL default '0000-01-01 00:00:00';

DROP INDEX c_commu_topic_r_datetime_c_commu_id;
CREATE INDEX c_commu_topic_r_datetime_c_commu_id on c_commu_topic (c_commu_id,u_datetime);

CREATE INDEX c_commu_member_c_commu_id_c_member_id on c_commu_member (c_commu_id,c_member_id);

CREATE TABLE c_diary_comment_log (
  c_diary_comment_log_id serial NOT NULL,
  c_member_id int4 NOT NULL default '0',
  c_diary_id  int4 NOT NULL default '0',
  r_datetime  timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY (c_diary_comment_log_id)
);

CREATE INDEX c_diary_comment_log_c_member_id_r_datetime on c_diary_comment_log (c_member_id,r_datetime);
CREATE INDEX c_diary_comment_log_c_diary_id on c_diary_comment_log (c_diary_id);
CREATE INDEX c_diary_comment_log_c_diary_id_r_datetime on c_diary_comment_log (c_diary_id,r_datetime);
CREATE INDEX c_diary_comment_log_c_member_id_c_diary_id on c_diary_comment_log (c_member_id,c_diary_id);

CREATE TABLE tmp_c_commu_topic (
  c_commu_topic_id serial NOT NULL,
  u_datetime timestamp NOT NULL default '0000-01-01 00:00:00',
  PRIMARY KEY  (c_commu_topic_id)
);

INSERT INTO tmp_c_commu_topic (c_commu_topic_id, u_datetime)
  (SELECT cct.c_commu_topic_id, MAX(cctc.r_datetime) as u_datetime
     FROM c_commu_topic_comment AS cctc ,c_commu_topic AS cct
     WHERE cctc.c_commu_topic_id = cct.c_commu_topic_id 
     GROUP BY cct.c_commu_topic_id);

UPDATE c_commu_topic SET u_datetime = tmp_c_commu_topic.u_datetime
    FROM tmp_c_commu_topic
    WHERE c_commu_topic.c_commu_topic_id = tmp_c_commu_topic.c_commu_topic_id;

DROP TABLE tmp_c_commu_topic;

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, c_member_id, c_diary_id, MAX(r_datetime) AS r_datetime
    FROM c_diary_comment
    WHERE r_datetime <= current_timestamp + '-15 days'
    GROUP BY c_member_id, c_diary_id
    ORDER BY r_datetime);

