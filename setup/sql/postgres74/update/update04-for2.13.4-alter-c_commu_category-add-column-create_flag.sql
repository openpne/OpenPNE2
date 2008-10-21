ALTER TABLE c_commu_category ADD COLUMN create_flag smallint;
ALTER TABLE c_commu_category ALTER COLUMN create_flag SET DEFAULT 0;
UPDATE c_commu_category SET create_flag = 1;
ALTER TABLE c_commu_category ALTER COLUMN create_flag SET NOT NULL;
