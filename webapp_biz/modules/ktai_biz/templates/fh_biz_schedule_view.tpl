({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">予定の詳細</font></center>
<hr>
({*BEGIN:container*})
ﾀｲﾄﾙ：({$schedule.title})<br>
日時：
({if $schedule.rep_type_loc})
毎週&nbsp;({$schedule.rep_type_loc})&nbsp;曜日({$schedule.begin_time}) ({if $schedule.begin_time})～({/if})
({$schedule.finish_time}) <br>
開始日：({$repeat_begin_date|date_format:"%Y年%m月%d日"})<br>
期間：({$repeat_term})週間<br>
({else})
	({$schedule.begin_date})
	
	({$schedule.begin_time}) ({if $schedule.begin_time})～({/if})
({if $schedule.begin_date != $schedule.finish_date})
	({$schedule.finish_date})
({/if})
({$schedule.finish_time}) <br>
({/if})

詳細：({$schedule.value})<br>
登録者：<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})&amp;({$tail})">({$schedule.writer_name})</a><br>
公開範囲：
({if $schedule.public_flag == "public"})
全員に公開
({elseif $schedule.public_flag == "group"})
グループまで公開
({elseif $schedule.public_flag == "private"})
公開しない
({/if})<br>
参加者：
({foreach item=name key=id from=$jmembers})
	<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$id})&amp;({$tail})">({$name})</a>&nbsp;
({/foreach})
({if $jam})
	<div align="right"><a href="({t_url m=ktai_biz a=page_fh_biz_schedule_view_member})&amp;id=({$schedule_id})&amp;target_id=({$t_id})&amp;({$tail})">全員表示する</a></div>
({/if})

<br>

<center>
({if !$schedule.rep_type_loc})
({t_form m=ktai_biz a=page_fh_biz_schedule_edit})
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
</form>

({t_form m=ktai_biz a=page_fh_biz_schedule_delete})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="hidden" name="target_id" value="({$t_id})">
<input value="削除" type="submit">
</form>
({/if})
	
</center>
({if $schedule.rep_type_loc})
	<hr>
	＊携帯からは繰り返し予定は編集・削除できません。
({/if})

<hr>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
