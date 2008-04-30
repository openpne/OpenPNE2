({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">予定削除</a></font><br>
</td></tr></table>

本当に削除しますか？<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai_biz a=do_fh_biz_schedule_delete})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai_biz a=page_fh_biz_schedule_view})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="id" value="({$schedule_id})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
