({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">携帯情報登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})
登録したﾊﾟｽﾜｰﾄﾞを入力してください。<br>
<br>
({t_form _attr='utn' m=ktai a=do_o_regist_ktai})
<input type="hidden" name="ses" value="({$ses})">
<font color="#({$ktai_color_config.font_06})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<hr color="#({$ktai_color_config.border_01})">
携帯個体識別番号を登録します。<br>
携帯個体識別番号に電話番号などの個人情報は含まれません。<br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input name="submit" value="登録" type="submit">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
