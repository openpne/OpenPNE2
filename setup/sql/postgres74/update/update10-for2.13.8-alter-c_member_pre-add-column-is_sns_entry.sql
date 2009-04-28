ALTER TABLE c_member_pre ADD COLUMN is_sns_entry_confirm smallint;
ALTER TABLE c_member_pre ALTER COLUMN is_sns_entry_confirm SET DEFAULT 0;
UPDATE c_member_pre SET is_sns_entry_confirm = 0;
ALTER TABLE c_member_pre ALTER COLUMN is_sns_entry_confirm SET NOT NULL;
