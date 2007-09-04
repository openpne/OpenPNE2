({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">携帯登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_04})">({$msg})</font><br>
<br>
({/if})
携帯の個体識別番号登録を行います。
ﾊﾟｽﾜｰﾄﾞを入力してください。<br>
<br>
({t_form _attr='utn' m=ktai a=do_h_regist_ktai_id})
<font color="#({$ktai_color_config.font_02})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<center>
<input name="submit" value="送信" type="submit">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
