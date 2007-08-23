({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">登録ﾒｰﾙｱﾄﾞﾚｽ(携帯電話)の登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})
携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ﾎﾞﾀﾝを押してください。<br>
届いたﾒｰﾙに記載してあるURLにｱｸｾｽして、ﾊﾟｽﾜｰﾄﾞを入力すると登録が完了します。
<hr color="#0d6ddf">
<font color="#999966">ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
({t_form m=ktai a=do_h_regist_address})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea><br>
<input type="submit" value="ﾒｰﾙを送信する"><br>
</form>
({$inc_ktai_footer|smarty:nodefaults})
