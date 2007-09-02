({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">携帯登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})
登録したﾊﾟｽﾜｰﾄﾞを入力してください。<br>
<br>
({t_form _attr='utn' m=ktai a=do_o_regist_ktai_id})
<input type="hidden" name="ses" value="({$ses})">
<font color="#({$ktai_color_config.font_02})">携帯ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
({$pre.ktai_address})<br>
<font color="#({$ktai_color_config.font_02})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<hr>
ﾒﾝﾊﾞｰ登録の際に携帯電話の個体識別番号を登録します。<br>
個体識別番号に電話番号などの個人情報は含まれません。<br>
<hr>
<center>
<input name="submit" value="送信" type="submit">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
