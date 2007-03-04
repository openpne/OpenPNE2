({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨ：({$c_commu.name})</font></center>
<hr>

■イベント作成<br>
({if $err_msg})
({foreach from=$err_msg item=item})
<font color="red">({$item})</font></br>
<br>
({/foreach})
({/if})
({t_form m=ktai a=do_c_event_add_insert_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
タイトル<font color="red">※</font><br>
<input type="text" name="title" value="({$event.title})"><br>
開催日時<font color="red">※</font><br>
<select name="open_date_year">
<option value="">----</option>
({html_options values=$year selected=$event.open_date_year output=$year})
</select>年
<select name="open_date_month">
<option value="">--</option>
({html_options values=$month selected=$event.open_date_month output=$month})
</select>月
<select name="open_date_day">
<option value="">--</option>
({html_options values=$day selected=$event.open_date_day output=$day})
</select>日<br>
（補足：<input name="open_date_comment" value="({$event.open_date_comment})">）<br>
開催場所<br>
<select name="open_pref_id">
<option value="0">選択してください
({html_options options=$pref selected=$event.open_pref_id})
</select><br>
(補足：<input type="text" name="open_pref_comment" value="({$event.open_pref_comment})">)<br>
詳細<font color="red">※</font><br>
<textarea name="detail">({$event.detail})</textarea><br>
募集人数<br>
<input type="text" name="capacity" value="({$event.capacity})"><br>
募集期限<br>
<select name="invite_period_year">
<option value="">----</option>
({html_options values=$year selected=$event.invite_period_year output=$year})
</select>年
<select name="invite_period_month">
<option value="">--</option>
({html_options values=$month selected=$event.invite_period_month output=$month})
</select>月
<select name="invite_period_day">
<option value="">--</option>
({html_options values=$day selected=$event.invite_period_day output=$day})
</select>日<br>
<br>
<input type="submit" value="登録">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
