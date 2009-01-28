INSERT INTO biz_schedule
 (title, c_member_id, begin_date, finish_date, begin_time, finish_time, value)
 SELECT title, c_member_id, start_date, end_date, start_time, end_time, body FROM c_schedule;

INSERT INTO biz_schedule_member
 (c_member_id, biz_schedule_id, is_read)
 SELECT c_member_id, biz_schedule_id, 1 
FROM biz_schedule order by biz_schedule_id;
