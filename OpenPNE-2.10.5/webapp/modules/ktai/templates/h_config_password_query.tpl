({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">秘密の質問・答え設定</font><br>
</td></tr></table>

ﾊﾟｽﾜｰﾄﾞを忘れた場合に、ﾊﾟｽﾜｰﾄﾞを再発行するための秘密の質問とその答えを設定することができます。<br>

<hr color="#({$ktai_color_config.border_01})">

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_config_password_query_update_password_query})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">現在のﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="password" istyle="3" mode="alphabet" maxlength="12"><br>
<br>
<font color="#({$ktai_color_config.font_06})">秘密の質問：</font><br>
<select name="c_password_query_id">
<option value="0">選択してください
({foreach from=$password_query_list key=key item=item})
<option value="({$key})">({$item})
({/foreach})
</select><br>
<font color="#({$ktai_color_config.font_06})">秘密の質問の答え：</font><br>
<input type="text" name="password_query_answer"><br>
<center>
<input type="submit" value="設定"><br>
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
