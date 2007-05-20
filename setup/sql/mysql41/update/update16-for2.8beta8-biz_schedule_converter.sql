DELETE FROM biz_schedule_member
  USING biz_schedule_member, biz_schedule
  WHERE biz_schedule.biz_group_id > 0
    AND biz_schedule.biz_schedule_id = biz_schedule_member.biz_schedule_id;

INSERT INTO biz_schedule_member(c_member_id, biz_schedule_id)
  SELECT biz_group_member.c_member_id, biz_schedule.biz_schedule_id
    FROM biz_schedule, biz_group_member
    WHERE biz_schedule.biz_group_id > 0
      AND biz_schedule.biz_group_id = biz_group_member.biz_group_id;

UPDATE biz_schedule SET public_flag = 'private'
  WHERE public_flag = 'group';
