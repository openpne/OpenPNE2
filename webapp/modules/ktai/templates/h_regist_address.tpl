({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">携帯ﾒｰﾙｱﾄﾞﾚｽの登録</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})
携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ﾎﾞﾀﾝを押してください。<br>
届いたﾒｰﾙに記載してあるURLにｱｸｾｽして、ﾊﾟｽﾜｰﾄﾞを入力すると登録が完了します。<br>
※ﾄﾞﾒｲﾝ指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのﾒｰﾙを受信できるように指定してください。
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
({t_form m=ktai a=do_h_regist_address})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea><br>
<input type="submit" value="ﾒｰﾙを送信する"><br>
</form>
({$inc_ktai_footer|smarty:nodefaults})
