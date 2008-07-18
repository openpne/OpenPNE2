({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">携帯ﾒｰﾙｱﾄﾞﾚｽ変更</font><br>
</td></tr></table>
登録されている携帯ﾒｰﾙｱﾄﾞﾚｽを変更します。<br>
新しい携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ﾎﾞﾀﾝを押してください。<br>
<hr color="#({$ktai_color_config.border_01})">
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})
({t_form m=ktai a=do_h_config_mail_insert_c_ktai_address_pre})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea>
<hr color="#({$ktai_color_config.border_01})">
届いたﾒｰﾙに記載してあるURLにｱｸｾｽして、ﾊﾟｽﾜｰﾄﾞを入力すると変更が完了します。
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne' && !$smarty.const.IS_SLAVEPNE_EMAIL_REGIST})
<br>初期設定ではメールアドレスが登録されておりません。新着情報などご希望の際はこちらからご登録ください。
({/if})
<br>※ﾄﾞﾒｲﾝ指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのﾒｰﾙを受信できるように指定してください。
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ﾒｰﾙ送信">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">

[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
