ALTER TABLE c_commu_admin_invite DROP INDEX c_commu_id_c_memer_id_to,
ADD INDEX c_commu_id_c_member_id_to (c_commu_id, c_member_id_to)
