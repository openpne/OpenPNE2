({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ﾊﾟｽﾜｰﾄﾞ変更<br>
</td></tr></table>
現在のﾊﾟｽﾜｰﾄﾞと新しいﾊﾟｽﾜｰﾄﾞを入力してください。
<hr color="#0d6ddf">
({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})
({t_form m=ktai a=do_h_config_password_update_password})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">現在のﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="old_password" istyle="3" mode="alphabet" maxlength="12"><br>
<font color="#999966">新しいﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="new_password" istyle="3" mode="alphabet" maxlength="12"><br>
<center>
<input type="submit" value="変更"><br>
</center>
</form>

<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
