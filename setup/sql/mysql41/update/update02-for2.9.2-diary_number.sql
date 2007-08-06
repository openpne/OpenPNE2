/*!40101 SET NAMES utf8 */;

ALTER TABLE `c_diary_comment` ADD COLUMN `number` int(11) NOT NULL default '0';


CREATE TABLE `tmp_c_diary_comment` (
  `c_diary_comment_id` int(11) NOT NULL auto_increment,
  `number` int(11) NOT NULL default '0',
  PRIMARY KEY  (`c_diary_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO tmp_c_diary_comment (c_diary_comment_id, number)
  (SELECT dc1.c_diary_comment_id, COUNT(*)
     FROM c_diary_comment AS dc1, c_diary_comment AS dc2
     WHERE dc1.c_diary_id = dc2.c_diary_id
       AND dc1.c_diary_comment_id >= dc2.c_diary_comment_id
     GROUP BY dc1.c_diary_comment_id);

UPDATE c_diary_comment INNER JOIN tmp_c_diary_comment USING (c_diary_comment_id)
 SET c_diary_comment.number = tmp_c_diary_comment.number;
 
DROP TABLE tmp_c_diary_comment;
