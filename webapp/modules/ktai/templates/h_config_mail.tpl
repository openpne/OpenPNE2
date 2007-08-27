({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
携帯ﾒｰﾙｱﾄﾞﾚｽ変更<br>
</td></tr></table>
登録ﾒｰﾙｱﾄﾞﾚｽ(携帯電話)を変更します。<br>
新しい携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ﾎﾞﾀﾝを押してください。<br>
<hr color="#({$ktai_color_config.border_01})">
({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})
({t_form m=ktai a=do_h_config_mail_insert_c_ktai_address_pre})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_02})">ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea>
<hr color="#b3ceef">
届いたﾒｰﾙに記載してあるURLにｱｸｾｽして、ﾊﾟｽﾜｰﾄﾞを入力すると変更が完了します。
<hr color="#b3ceef">
<center>
<input type="submit" value="ﾒｰﾙ送信">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">

%%i90%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
