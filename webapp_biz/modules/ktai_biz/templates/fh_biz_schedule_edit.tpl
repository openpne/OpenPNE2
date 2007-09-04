({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">予定編集</a></font><br>
</td></tr></table>
時刻以外は必須です。<br>
携帯からは繰り返し予定は編集・削除できません。
<hr color="#0d6ddf">
({*BEGIN:container*})
({if $msg})
<font color=red>※({$msg})</font><br>
<br>
({/if})
({t_form m=ktai_biz a=do_fh_biz_schedule_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="hidden" name="sc_j_mem" value="({$member_e})">
<input type="hidden" name="sc_title" value="({$title})">
<input type="hidden" name="sc_memo" value="({$value})">
<input type="hidden" name="writer" value="({$writer})">
<input type="hidden" name="target_id" value="({$t_id})">

<font color="#999966">予定日：</font><br>
<input type="text" name='sc_b_year' size="4" value="({$begin.year})">年
		<input type="text" name='sc_b_month' size="2" value="({$begin.month})">月
		<input type="text" name='sc_b_date' size="2" value="({$begin.day})">日<br>
<br>
<font color="#999966">時刻：</font><br>
<input type="text" name='sc_b_hour' size="2" value="({$begin.hour})">時
	<input type="text" name='sc_b_minute' size="2" value="({$begin.min})">分
	～
	<input type="text" name='sc_f_hour' size="2" value="({$finish.hour})">時
	<input type="text" name='sc_f_minute' size="2" value="({$finish.min})">分<br>
<br>
<font color="#999966">ﾀｲﾄﾙ：</font><br>
<input type="text" name='sc_title' value="({$title})"><br>
<br>
<font color="#999966">詳細：</font><br>
({$value})<br>
<br>
<font color="#999966">登録者：</font><br>
({$writer})<br>
<br>
<input type="hidden" name="biz_group_id" value="0">
<input type="hidden" name="public_flag" value="public">

<font color="#999966">公開範囲：</font><br>
<input type='radio' name='public_flag' value='public' ({if $public_flag == 'public'})checked({/if})>全体に公開<br>
<input type='radio' name='public_flag' value='private' ({if $public_flag == 'private'})checked({/if})>参加者のみに公開<br>
<br>

<font color="#999966">参加者：</font><br>
	({foreach item=name key=id from=$member})
		({$name})&nbsp;
	({/foreach})

<br>

<center>
<input type='submit' name='entry' value='編集'>
</center>
</form>
({t_form m=ktai_biz a=page_fh_calendar_week})
<center>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="submit" value="キャンセル">
</center>
</form>
<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
