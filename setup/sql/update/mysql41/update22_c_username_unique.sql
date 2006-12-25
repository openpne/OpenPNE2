ALTER TABLE c_username DROP INDEX `c_member_id`;
ALTER TABLE c_username DROP INDEX `username`;

ALTER TABLE c_username ADD UNIQUE INDEX `c_member_id`(c_member_id);
ALTER TABLE c_username ADD UNIQUE INDEX `username`(username);