/*!40101 SET NAMES utf8 */;

CREATE INDEX c_member_id_c_member_id_block on c_access_block(c_member_id,c_member_id_block);
CREATE INDEX c_member_id_block ON c_access_block(c_member_id_block);

CREATE INDEX c_review_id_r_datetime ON c_review_comment(c_review_id,r_datetime);
CREATE INDEX c_member_id_r_datetime ON c_review_comment(c_member_id,r_datetime);

CREATE INDEX c_commu_id_c_memer_id_to ON c_commu_admin_invite(c_commu_id,c_member_id_to);

