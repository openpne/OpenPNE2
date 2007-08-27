({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">
({$smarty.const.SNS_NAME}) 退会</a></font><br>
</td></tr></table>

本当に退会してもよろしいですか?<br>
退会する場合は、確認のためﾊﾟｽﾜｰﾄﾞを入力してください。<br>

<hr color="#({$ktai_color_config.border_01})">
({if $msg})<font color="#ff0000">({$msg})</font><br><br>({/if})

({t_form m=ktai a=do_h_taikai})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_02})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="password" istyle="3" mode="alphabet" maxlength="12"><br>
<br>
<font color="#({$ktai_color_config.font_02})">退会理由：</font><br>
<textarea name="reason" rows="6"></textarea><br>
<center>
<input type="submit" value="退会する">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})