({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ﾒｰﾙｱﾄﾞﾚｽ登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})
ﾊﾟｽﾜｰﾄﾞを入力してください。<br>
<br>
({t_form _attr='utn' m=ktai a=do_o_update_ktai_address})
<input type="hidden" name="ses" value="({$ses})">
<font color="#999966">携帯ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
({$pre.ktai_address})<br>
<font color="#999966">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<center>
<input name="submit" value="送信" type="submit">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
