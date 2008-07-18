
ALTER TABLE c_diary_comment ADD COLUMN number int4 NOT NULL default '0';


CREATE TABLE tmp_c_diary_comment (
  c_diary_comment_id serial NOT NULL,
  number int4 NOT NULL default '0',
  PRIMARY KEY  (c_diary_comment_id)
);

INSERT INTO tmp_c_diary_comment (c_diary_comment_id, number)
  (SELECT dc1.c_diary_comment_id, COUNT(*)
     FROM c_diary_comment AS dc1, c_diary_comment AS dc2
     WHERE dc1.c_diary_id = dc2.c_diary_id
       AND dc1.c_diary_comment_id >= dc2.c_diary_comment_id
     GROUP BY dc1.c_diary_comment_id);

UPDATE c_diary_comment 
 SET number = tmp_c_diary_comment.number
 FROM tmp_c_diary_comment 
    WHERE tmp_c_diary_comment.c_diary_comment_id = c_diary_comment.c_diary_comment_id;
 
DROP TABLE tmp_c_diary_comment;
