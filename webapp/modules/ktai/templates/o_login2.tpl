({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾒｰﾙｱﾄﾞﾚｽ登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})
ﾊﾟｽﾜｰﾄﾞを入力してください。<br>
<br>
({t_form _attr='utn' m=ktai a=do_o_update_ktai_address})
<input type="hidden" name="ses" value="({$ses})">
<font color="#({$ktai_color_config.font_06})">携帯ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
({$pre.ktai_address})<br>
<font color="#({$ktai_color_config.font_06})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<center>
<input name="submit" value="送信" type="submit">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
