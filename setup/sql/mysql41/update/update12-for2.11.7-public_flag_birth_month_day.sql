/*!40101 SET NAMES utf8 */;

ALTER IGNORE TABLE c_member ADD COLUMN public_flag_birth_month_day enum('public','friend','private') NOT NULL default 'public' AFTER public_flag_birth_year;
ALTER IGNORE TABLE c_member_pre ADD COLUMN public_flag_birth_month_day enum('public','friend','private') NOT NULL default 'public' AFTER public_flag_birth_year;
