UPDATE c_image SET r_datetime = TO_TIMESTAMP(r_datetime, 'YYYY-MM-DD HH24:MI:SS') WHERE filename IN ('skin_no_image.gif', 'skin_no_logo.gif', 'skin_no_logo_small.gif', 'r_1_regular.gif', 'r_2_silver.gif', 'r_3_gold.gif', 'r_4_platinum.gif');
UPDATE c_member SET r_date = TO_TIMESTAMP(r_date, 'YYYY-MM-DD HH24:MI:SS'), u_datetime = TO_TIMESTAMP(u_datetime, 'YYYY-MM-DD HH24:MI:SS') WHERE c_member_id = 1;
UPDATE c_siteadmin SET r_date = TO_TIMESTAMP(r_date, 'YYYY-MM-DD HH24:MI:SS');
