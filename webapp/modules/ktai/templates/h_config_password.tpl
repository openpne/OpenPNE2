({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ﾊﾟｽﾜｰﾄﾞ変更<br>
</td></tr></table>
現在のﾊﾟｽﾜｰﾄﾞと新しいﾊﾟｽﾜｰﾄﾞを入力してください。
<hr color="#({$ktai_color_config.border_01})">
({if $msg})
<font color="#({$ktai_color_config.font_04})">({$msg})</font><br>
<br>
({/if})
({t_form m=ktai a=do_h_config_password_update_password})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_02})">現在のﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="old_password" istyle="3" mode="alphabet" maxlength="12"><br>
<font color="#({$ktai_color_config.font_02})">新しいﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="new_password" istyle="3" mode="alphabet" maxlength="12"><br>
<center>
<input type="submit" value="変更"><br>
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
%%i90%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
