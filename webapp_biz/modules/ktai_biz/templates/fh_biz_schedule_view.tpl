({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">予定の詳細</a></font><br>
</td></tr></table>
<br>
({*BEGIN:container*})
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><br>
({$schedule.title})<br>
<br>
<font color="#({$ktai_color_config.font_06})">日時：</font><br>
({if $schedule.rep_type_loc})
毎週&nbsp;({$schedule.rep_type_loc})&nbsp;曜日({$schedule.begin_time}) ({if $schedule.begin_time})～({/if})
({$schedule.finish_time}) <br>
開始日：({$repeat_begin_date|date_format:"%Y年%m月%d日"})<br>
期間：({$repeat_term})週間<br>
({else})
({strip})
	({$schedule.begin_date})
({if $schedule.begin_date != $schedule.finish_date})
	～({$schedule.finish_date})
({/if})
({/strip})
({strip})
({$schedule.begin_time})
({if $schedule.begin_time || $schedule.finish_time})～({/if})
({$schedule.finish_time}) <br>
({/strip})
({/if})
<br>
<font color="#({$ktai_color_config.font_06})">詳細：</font><br>
({$schedule.value})<br>
<br>
<font color="#({$ktai_color_config.font_06})">登録者：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})&amp;({$tail})">({$schedule.writer_name})</a><br>
<br>
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
({if $schedule.public_flag == "private"})
参加者のみに公開
({else})
全体に公開
({/if})<br>
<br>
<font color="#({$ktai_color_config.font_06})">参加者：</font><br>
({foreach item=name key=id from=$jmembers})
	<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$id})&amp;({$tail})">({$name})</a>&nbsp;
({/foreach})
({if $jam})
	<div align="right">
	<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai_biz a=page_fh_biz_schedule_view_member})&amp;id=({$schedule_id})&amp;target_id=({$t_id})&amp;({$tail})">全員表示する</a></div>
({/if})
<br>
({if !$schedule.rep_type_loc})
({t_form m=ktai_biz a=page_fh_biz_schedule_edit})
<center>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="begin_date" value="({$schedule.begin_date})">
<input type="hidden" name="begin_time" value="({$schedule.begin_time})">
<input type="hidden" name="finish_time" value="({$schedule.finish_time})">
<input type="hidden" name="title" value="({$schedule.title})">
<input type="hidden" name="value" value="({$schedule.value})">
<input type="hidden" name="writer" value="({$schedule.writer_name})">
<input type="hidden" name="members" value="({$jmembers_enc})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="hidden" name="public_flag" value="({$schedule.public_flag})">
<input type="hidden" name="target_id" value="({$t_id})">
<input value="編集" type="submit">
</center>
</form>

({t_form m=ktai_biz a=page_fh_biz_schedule_delete})
<center>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="hidden" name="target_id" value="({$t_id})">
<input value="削除" type="submit">
</center>
</form>
({/if})
({if $schedule.rep_type_loc})
	<hr color="#({$ktai_color_config.border_01})">
	＊携帯からは繰り返し予定は編集・削除できません。
({/if})

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
