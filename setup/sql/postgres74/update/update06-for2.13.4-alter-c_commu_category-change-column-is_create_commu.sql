ALTER TABLE c_commu_category RENAME COLUMN create_flag TO is_create_commu;
ALTER TABLE c_commu_category ALTER COLUMN is_create_commu SET DEFAULT 1;
ALTER TABLE c_commu_category ALTER COLUMN is_create_commu SET NOT NULL;
