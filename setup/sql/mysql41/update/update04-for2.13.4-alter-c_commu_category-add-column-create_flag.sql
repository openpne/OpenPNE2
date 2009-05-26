ALTER TABLE c_commu_category ADD COLUMN create_flag tinyint(1) NOT NULL default 0;
UPDATE c_commu_category SET create_flag = 1;
