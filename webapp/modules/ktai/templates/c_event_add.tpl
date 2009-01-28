({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｲﾍﾞﾝﾄの作成</font><br>
</td></tr></table>
<font color="#({$ktai_color_config.font_09})">※</font>は必須項目です。
<hr color="#({$ktai_color_config.border_01})">

({if $err_msg})
({foreach from=$err_msg item=item})
<font color="#({$ktai_color_config.font_09})">({$item})</font></br>
<br>
({/foreach})
({/if})
({t_form m=ktai a=do_c_event_add_insert_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><font color="#({$ktai_color_config.font_09})">※</font><br>
<input type="text" name="title" value="({$event.title})"><br><br>
<font color="#({$ktai_color_config.font_06})">開催日時：</font><font color="#({$ktai_color_config.font_09})">※</font><br>
<select name="open_date_year">
<option value="">----
({html_options values=$year selected=$event.open_date_year output=$year})
</select>年
<select name="open_date_month">
<option value="">--
({html_options values=$month selected=$event.open_date_month output=$month})
</select>月
<select name="open_date_day">
<option value="">--
({html_options values=$day selected=$event.open_date_day output=$day})
</select>日<br>
<font color="#({$ktai_color_config.font_06})">補足：</font><input name="open_date_comment" value="({$event.open_date_comment})"><br><br>
<font color="#({$ktai_color_config.font_06})">開催場所：</font><br>
<select name="open_pref_id">
<option value="0">▼都道府県
({html_options options=$pref selected=$event.open_pref_id})
</select><br>
<font color="#({$ktai_color_config.font_06})">補足：</font><input type="text" name="open_pref_comment" value="({$event.open_pref_comment})"><br><br>
<font color="#({$ktai_color_config.font_06})">詳細：</font><font color="#({$ktai_color_config.font_09})">※</font><br>
<textarea name="detail" rows="6">({$event.detail})</textarea><br>
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
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ｲﾍﾞﾝﾄを作成する">
</center>
</form>
({$inc_ktai_footer|smarty:nodefaults})
