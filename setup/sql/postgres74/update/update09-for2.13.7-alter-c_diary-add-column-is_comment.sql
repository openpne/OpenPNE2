ALTER TABLE c_diary ADD COLUMN is_comment_input smallint;
ALTER TABLE c_diary ALTER COLUMN is_comment_input SET DEFAULT 1;
ALTER TABLE c_diary ALTER COLUMN is_comment_input SET NOT NULL;
