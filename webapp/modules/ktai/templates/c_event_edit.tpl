({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｲﾍﾞﾝﾄの編集<br>
</td></tr></table>
<font color="#ff0000">※</font>は必須項目です。
<hr color="#0d6ddf">

({if $err_msg})
({foreach from=$err_msg item=item})
<font color="#ff0000">({$item})</font></br>
<br>
({/foreach})
({/if})

({t_form m=ktai a=do_c_event_edit_update_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$event.c_commu_id})">
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<font color="#999966">ﾀｲﾄﾙ：</font><font color="#ff0000">※</font><br>
<input type="text" name="title" value="({$event.name})"><br>
<br>
<font color="#999966">開催日時：</font><font color="#ff0000">※</font><br>
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
<font color="#999966">補足：</font><input type="text" name="open_date_comment" value="({$event.open_date_comment})"><br><br>
<font color="#999966">開催場所：</font><br>
<select name="open_pref_id">
<option value=0>選択してください
({html_options options=$pref selected=$event.open_pref_id})
</select><br>
<font color="#999966">補足：</font><input type="text" name="open_pref_comment" value="({$event.open_pref_comment})"><br><br>
<font color="#999966">詳細：</font><font color="#ff0000">※</font><br>
<textarea name="detail" rows="6">({$event.body})</textarea><br><br>
<font color="#999966">募集人数：</font><br>
<input type="text" name="capacity" value="({if $event.capacity})({$event.capacity})({/if})"><br><br>
<font color="#999966">募集期限：</font><br>
<select name="invite_period_year">
<option value="">----
({html_options values=$year selected=$event.invite_period_year output=$year})
</select>年
<select name="invite_period_month">
<option value="">--
({html_options values=$month selected=$event.invite_period_month output=$month})
</select>月
<select name="invite_period_day">
<option value="">--
({html_options values=$day selected=$event.invite_period_day output=$day})
</select>日<br>
<hr color="#0d6ddf">
<center>
<input type="submit" value="ｲﾍﾞﾝﾄを編集する">
</center>
</form>

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee">ｲﾍﾞﾝﾄの削除</font><br>
</td></tr>
</table>
上記のｲﾍﾞﾝﾄと書き込みを削除します。<br>
ﾄﾗﾌﾞﾙ等を避けるために、すでに参加者が居る場合は削除前に告知をおこなっておいてください。<br>
<hr color="#0d6ddf">
<center>
({t_form m=ktai a=page_c_event_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="ｲﾍﾞﾝﾄを削除する">
</form>
</center>
({$inc_ktai_footer|smarty:nodefaults})
