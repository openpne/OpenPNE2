TRUNCATE TABLE `c_diary_comment_log`;

CREATE TABLE `tmp_c_diary_comment_log` (
  `c_diary_comment_log_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL default '0',
  `c_diary_id`  int(11) NOT NULL default '0',
  `r_datetime`  datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (`c_diary_comment_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO tmp_c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, c_member_id, c_diary_id, MAX(r_datetime) AS r_datetime
    FROM c_diary_comment
    GROUP BY c_member_id, c_diary_id
    ORDER BY r_datetime);

INSERT INTO c_diary_comment_log (c_diary_comment_log_id, c_member_id, c_diary_id, r_datetime)
  (SELECT NULL, tmp_c_diary_comment_log.c_member_id, tmp_c_diary_comment_log.c_diary_id, 
    tmp_c_diary_comment_log.r_datetime as r_datetime
    FROM tmp_c_diary_comment_log
    INNER JOIN c_diary USING (c_diary_id) 
    WHERE tmp_c_diary_comment_log.c_member_id <> c_diary.c_member_id
    ORDER BY r_datetime);

DROP TABLE `tmp_c_diary_comment_log`;
