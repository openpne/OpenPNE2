({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾊﾟｽﾜｰﾄﾞ再設定</a></font><br>
</td></tr></table>
新しいﾊﾟｽﾜｰﾄﾞを入力してください。
({if $msg})
<br>
<font color="#({$ktai_color_config.font_09})">({$msg})</font>
({/if})
({t_form m=ktai a=do_o_password_reset})
<input type="hidden" name="id" value="({$id})">
<input type="hidden" name="session" value="({$session})">
<font color="#({$ktai_color_config.font_06})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="new_password" istyle="3" mode="alphabet" maxlength="12"><br>
<center>
<input type="submit" value="変更"><br>
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
