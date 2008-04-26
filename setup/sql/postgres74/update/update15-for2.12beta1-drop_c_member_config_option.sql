ALTER TABLE c_member_config ADD COLUMN name varchar(64) NOT NULL default '';

UPDATE c_member_config SET name = c_member_config_option.name
    FROM c_member_config_option
    WHERE c_member_config.c_member_config_option_id = c_member_config_option.c_member_config_option_id;

DROP TABLE c_member_config_option;
ALTER TABLE c_member_config DROP COLUMN c_member_config_option_id;

CREATE INDEX c_member_config_name on c_member_config (name);
