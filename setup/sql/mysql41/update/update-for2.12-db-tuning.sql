/* コメント記入履歴時間  */
ALTER TABLE c_commu_topic ADD COLUMN r_datetime_comment datetime NOT NULL default '0000-00-00 00:00:00';

/* Index 変更*/
DROP INDEX r_datetime_c_commu_id ON c_commu_topic;
CREATE INDEX r_datetime_c_commu_id ON c_commu_topic(c_commu_id,r_datetime_comment);

CREATE INDEX c_commu_id_c_member_id ON c_commu_member(c_commu_id,c_member_id);

/* 日記コメント記入履歴Table */
CREATE TABLE `c_diary_comment_summary` (
  `c_diary_comment_summary_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_diary_id`  int(11) NOT NULL default '0',
  `r_datetime`  datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (`c_diary_comment_summary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE INDEX `c_member_id_r_datetime` ON `c_diary_comment_summary`(c_member_id,r_datetime);
CREATE INDEX `c_diary_id` ON `c_diary_comment_summary`(c_diary_id);
CREATE INDEX `c_diary_id_r_datetime` ON `c_diary_comment_summary`(c_diary_id,r_datetime);
CREATE INDEX `c_member_id_c_diary_id` ON `c_diary_comment_summary`(c_member_id,c_diary_id);

/* 既存データのコンバート */
/* コメント記入履歴時間  */
DROP TABLE IF EXISTS `tmp_c_commu_topic`;
CREATE TABLE `tmp_c_commu_topic` (
  `c_commu_topic_id` int(11) NOT NULL default '0',
  `r_datetime_comment` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`c_commu_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO tmp_c_commu_topic (c_commu_topic_id, r_datetime_comment)
  (SELECT cct.c_commu_topic_id, MAX(cctc.r_datetime) as r_datetime_comment
     FROM c_commu_topic_comment AS cctc ,c_commu_topic AS cct
     WHERE cctc.c_commu_topic_id = cct.c_commu_topic_id 
     GROUP BY cct.c_commu_topic_id);

UPDATE c_commu_topic INNER JOIN tmp_c_commu_topic USING (c_commu_topic_id)
 SET c_commu_topic.r_datetime_comment = tmp_c_commu_topic.r_datetime_comment;

DROP TABLE tmp_c_commu_topic;

