ALTER TABLE c_member ADD COLUMN public_flag_birth_month_day varchar(20);
ALTER TABLE c_member ALTER COLUMN public_flag_birth_month_day SET DEFAULT 'public';
UPDATE c_member SET public_flag_birth_month_day = 'public';
ALTER TABLE c_member ALTER COLUMN public_flag_birth_month_day SET NOT NULL;

ALTER TABLE c_member_pre ADD COLUMN public_flag_birth_month_day varchar(20);
ALTER TABLE c_member_pre ALTER COLUMN public_flag_birth_month_day SET DEFAULT 'public';
UPDATE c_member_pre SET public_flag_birth_month_day = 'public';
ALTER TABLE c_member_pre ALTER COLUMN public_flag_birth_month_day SET NOT NULL;
