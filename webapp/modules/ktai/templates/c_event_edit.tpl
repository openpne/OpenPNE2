({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｲﾍﾞﾝﾄの編集</font><br>
</td></tr></table>
<font color="#({$ktai_color_config.font_09})">※</font>は必須項目です。
<hr color="#({$ktai_color_config.border_01})">

({if $err_msg})
({foreach from=$err_msg item=item})
<font color="#({$ktai_color_config.font_09})">({$item})</font></br>
<br>
({/foreach})
({/if})

({t_form m=ktai a=do_c_event_edit_update_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$event.c_commu_id})">
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><font color="#({$ktai_color_config.font_09})">※</font><br>
<input type="text" name="title" value="({$event.name})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">開催日時：</font><font color="#({$ktai_color_config.font_09})">※</font><br>
<select name="open_date_year">
<option value="0">----
({html_options values=$year selected=$event.open_date_year output=$year})
</select>年
<select name="open_date_month">
<option value="0">--
({html_options values=$month selected=$event.open_date_month output=$month})
</select>月
<select name="open_date_day">
<option value="0">--
({html_options values=$day selected=$event.open_date_day output=$day})
</select>日<br>
<font color="#({$ktai_color_config.font_06})">補足：</font><input type="text" name="open_date_comment" value="({$event.open_date_comment})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">開催場所：</font><br>
<select name="open_pref_id">
<option value="0">選択してください
({html_options options=$pref selected=$event.open_pref_id})
</select><br>
<font color="#({$ktai_color_config.font_06})">補足：</font><input type="text" name="open_pref_comment" value="({$event.open_pref_comment})"><br><br>
<font color="#({$ktai_color_config.font_06})">詳細：</font><font color="#({$ktai_color_config.font_09})">※</font><br>
<textarea name="detail" rows="6">({$event.body})</textarea><br>
<br>
<font color="#({$ktai_color_config.font_06})">募集期限：</font><br>
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
<br>
<font color="#({$ktai_color_config.font_06})">募集人数：</font><br>
<input type="text" name="capacity" value="({if $event.capacity})({$event.capacity})({/if})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">写真：</font><br>
[i:68]<a href="({t_url m=ktai a=page_c_topic_edit_image})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;({$tail})">写真を編集する</a><br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ｲﾍﾞﾝﾄを編集する">
</center>
</form>

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">ｲﾍﾞﾝﾄの削除</font><br>
</td></tr>
</table>
上記のｲﾍﾞﾝﾄと書き込みを削除します。<br>
ﾄﾗﾌﾞﾙ等を避けるために、すでに参加者が居る場合は削除前に告知をおこなっておいてください。<br>
<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=page_c_event_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$event.c_commu_topic_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="ｲﾍﾞﾝﾄを削除する">
</form>
</center>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$event.c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
