({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
携帯ﾒｰﾙｱﾄﾞﾚｽ変更<br>
</td></tr></table>
登録ﾒｰﾙｱﾄﾞﾚｽ(携帯電話)を変更します。<br>
新しい携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ﾎﾞﾀﾝを押してください。<br>
<hr color="#0d6ddf">
({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})
({t_form m=ktai a=do_h_config_mail_insert_c_ktai_address_pre})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea>
<hr color="#b3ceef">
届いたﾒｰﾙに記載してあるURLにｱｸｾｽして、ﾊﾟｽﾜｰﾄﾞを入力すると変更が完了します。
<hr color="#b3ceef">
<center>
<input type="submit" value="ﾒｰﾙ送信">
</center>
</form>
<hr color="#0d6ddf">

%%i117%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
