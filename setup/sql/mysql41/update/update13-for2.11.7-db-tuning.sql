ALTER TABLE c_commu_topic ADD COLUMN u_datetime datetime NOT NULL default '0000-00-00 00:00:00';

DROP INDEX r_datetime_c_commu_id ON c_commu_topic;
CREATE INDEX r_datetime_c_commu_id ON c_commu_topic(c_commu_id,u_datetime);

CREATE INDEX c_commu_id_c_member_id ON c_commu_member(c_commu_id,c_member_id);

CREATE TABLE `c_diary_comment_log` (
  `c_diary_comment_log_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_diary_id`  int(11) NOT NULL default '0',
  `r_datetime`  datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (`c_diary_comment_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE INDEX `c_member_id_r_datetime` ON `c_diary_comment_log`(c_member_id,r_datetime);
CREATE INDEX `c_diary_id` ON `c_diary_comment_log`(c_diary_id);
CREATE INDEX `c_diary_id_r_datetime` ON `c_diary_comment_log`(c_diary_id,r_datetime);
CREATE INDEX `c_member_id_c_diary_id` ON `c_diary_comment_log`(c_member_id,c_diary_id);

DROP TABLE IF EXISTS `tmp_c_commu_topic`;
CREATE TABLE `tmp_c_commu_topic` (
  `c_commu_topic_id` int(11) NOT NULL default '0',
  `u_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_commu_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO tmp_c_commu_topic (c_commu_topic_id, u_datetime)
  (SELECT cct.c_commu_topic_id, MAX(cctc.r_datetime) as u_datetime
     FROM c_commu_topic_comment AS cctc ,c_commu_topic AS cct
     WHERE cctc.c_commu_topic_id = cct.c_commu_topic_id 
     GROUP BY cct.c_commu_topic_id);

UPDATE c_commu_topic INNER JOIN tmp_c_commu_topic USING (c_commu_topic_id)
 SET c_commu_topic.u_datetime = tmp_c_commu_topic.u_datetime;

DROP TABLE tmp_c_commu_topic;

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, c_member_id, c_diary_id, MAX(r_datetime) AS r_datetime
    FROM c_diary_comment
    WHERE TO_DAYS(NOW()) - TO_DAYS(r_datetime) <= 15
    GROUP BY c_member_id, c_diary_id
    ORDER BY r_datetime);

