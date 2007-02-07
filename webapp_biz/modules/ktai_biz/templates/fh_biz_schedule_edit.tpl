({$inc_ktai_header|smarty:nodefaults})
({if $msg})
	<font color=red>※({$msg})</font>
({/if})
<center><font color="orange">予定編集</font></center>
<hr>
({*BEGIN:container*})

({t_form m=ktai_biz a=do_fh_biz_schedule_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="hidden" name="sc_j_mem" value="({$member_e})">
<input type="hidden" name="sc_title" value="({$title})">
<input type="hidden" name="sc_memo" value="({$value})">
<input type="hidden" name="writer" value="({$writer})">

予定日：<input type="text" name='sc_b_year' size="2" value="({$begin.year})">年
		<input type="text" name='sc_b_month' size="2" value="({$begin.month})">月
		<input type="text" name='sc_b_date' size="2" value="({$begin.day})">日<br>
		
時刻：<input type="text" name='sc_b_hour' size="2" value="({$begin.hour})">時
	<input type="text" name='sc_b_minute' size="2" value="({$begin.min})">分
	～
	<input type="text" name='sc_f_hour' size="2" value="({$finish.hour})">時
	<input type="text" name='sc_f_minute' size="2" value="({$finish.min})">分<br>
	
ﾀｲﾄﾙ：<input type="text" name='sc_title' size="30" value="({$title})"><br>

詳細：({$value})<br>
登録者：({$writer})<br>
公開範囲：<br>
<input type='radio' name='public_flag' value='public' ({if $public_flag == 'public'})checked({/if})>全体に公開<br>
<input type='radio' name='public_flag' value='group' ({if $public_flag == 'group'})checked({/if})>グループまで公開<br>
<input type='radio' name='public_flag' value='private' ({if $public_flag == 'private'})checked({/if})>公開しない<br>
<br>
参加者：
	({foreach item=name key=id from=$member})
		({$name})&nbsp;
	({/foreach})

<br>

<center>
<input type='submit' name='entry' value='編集'>
</form>
</center>

<center>
({t_form m=ktai_biz a=page_fh_calendar_week})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$t_id})">
<input type="submit" value="キャンセル">
</form>
</center>
<hr>
＊時刻以外は必須です。<br>
＊携帯からは繰り返し予定は編集・削除できません。
<hr>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
