({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">予定削除</a></font><br>
</td></tr></table>
({*BEGIN:container*})
本当に削除しますか？<br>
<hr color="#0d6ddf">
({t_form m=ktai_biz a=do_fh_biz_schedule_delete})
<center>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="submit" value="はい">
</center>
</form>

({t_form m=ktai_biz a=page_fh_biz_schedule_view})
<center>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="id" value="({$schedule_id})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="submit" value="いいえ">
</center>
</form>
<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>

({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
