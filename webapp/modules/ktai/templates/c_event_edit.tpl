({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨ：({$c_commu.name})</font></center>
<hr>

■ｲﾍﾞﾝﾄ編集<br>
({if $err_msg})
({foreach from=$err_msg item=item})
<font color="red">({$item})</font></br>
<br>
({/foreach})
({/if})
({t_form m=ktai a=do_c_event_edit_update_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$event.c_commu_id})">
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
タイトル <font color="red">※</font><br>
<input type="text" name="title" value="({$event.name})" maxlength="120"><br>
開催日時 <font color="red">※</font><br>
<select name="open_date_year">
<option value=0>----
({html_options values=$year selected=$event.open_date_year output=$year})
</select>年
<select name="open_date_month">
<option value=0>--
({html_options values=$month selected=$event.open_date_month output=$month})
</select>月
<select name="open_date_day">
<option value=0>--
({html_options values=$day selected=$event.open_date_day output=$day})
</select>日<br>
(補足：<input type="text" name="open_date_comment" value="({$event.open_date_comment})">)<br>
開催場所<br>
<select name="open_pref_id">
<option value=0>選択してください
({html_options options=$pref selected=$event.open_pref_id})
</select><br>
(補足：<input type="text" name="open_pref_comment" value="({$event.open_pref_comment})">)<br>
詳細 <font color="red">※</font><br>
<textarea name="detail">({$event.body})</textarea><br>
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
<input type="submit" value="編集を確定">
</form>

<hr>
■ｲﾍﾞﾝﾄ削除<br>
({t_form m=ktai a=page_c_event_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="削除">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
