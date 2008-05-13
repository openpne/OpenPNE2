({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<table width="100%">
({if $smarty.const.OPENPNE_USE_KTAI_LOGO})
<tr><td align="center">
<img src="({t_img_url_skin filename=skin_ktai_header f=jpg})" alt="({$smarty.const.SNS_NAME})"><br>
</td></tr>
({else})
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$smarty.const.SNS_NAME})</font><br>
</td></tr>
({/if})
</table>
({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})
<br>
<center>
このﾍﾟｰｼﾞをﾌﾞｯｸﾏｰｸしてください<br>
({if $msg})
<br>
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
({/if})
</center>
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
[i:75]<font color="#({$ktai_color_config.font_05})">かんたんﾛｸﾞｲﾝ</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
<br>
<center>
({t_form _attr='utn' m=ktai a=do_o_easy_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
({if $ktai_address})
<input type="hidden" name="ktai_address" value="({$ktai_address})">
({/if})
<input type="submit" value="かんたんﾛｸﾞｲﾝ"><br>
</form>
</center>
<br>
<a href="({t_url m=ktai a=page_o_whatis_easy_login})">&gt;&gt;かんたんﾛｸﾞｲﾝとは</a><br>
</td></tr></table>
<br>

<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">[i:116]ﾊﾟｽﾜｰﾄﾞﾛｸﾞｲﾝ</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
({t_form m=ktai a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
({if $ktai_address})
<input type="hidden" name="username" value="({$ktai_address})">
({else})
({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})
<font color="#({$ktai_color_config.bg_02})">★</font>携帯ﾒｰﾙｱﾄﾞﾚｽ<br>
({else})
<font color="#({$ktai_color_config.bg_02})">★</font>ﾛｸﾞｲﾝID<br>
({/if})
<textarea name="username" rows="1" istyle="3" mode="alphabet"></textarea><br>
({/if})
<font color="#({$ktai_color_config.bg_02})">★</font>ﾊﾟｽﾜｰﾄﾞ<br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<center>
<input name="submit" value="ﾛｸﾞｲﾝ" type="submit"><br>
</center>
</form>
({if $ktai_address})
<a href="({t_url m=ktai a=page_o_login})">&gt;&gt;携帯ﾒｰﾙｱﾄﾞﾚｽを入力</a><br>
({/if})
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_KTAI})
<a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_KTAI})">&gt;&gt;ﾊﾟｽﾜｰﾄﾞを忘れた方</a><br>
({/if})
({else})
<a href="({t_url m=ktai a=page_o_password_query})">&gt;&gt;ﾊﾟｽﾜｰﾄﾞを忘れた方</a><br>
({/if})
</td></tr></table>
<br>
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
<hr color="#({$ktai_color_config.border_01})">
■<a href="({$smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})">新規登録について</a><br>
({/if})
({elseif $IS_CLOSED_SNS})
<hr color="#({$ktai_color_config.border_01})">
({$SNS_NAME})は招待制のｿｰｼｬﾙﾈｯﾄﾜｰｷﾝｸﾞｻｰﾋﾞｽです。<br>
登録には({$SNS_NAME})({if $smarty.const.IS_USER_INVITE})参加者({else})管理者({/if})からの招待が必要です。<br>
({elseif !((($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI)) >> 1)})
<hr color="#({$ktai_color_config.border_01})">
新規登録はPCからおこなってください。<br>
({else})
<hr color="#({$ktai_color_config.border_01})">
新規登録するには以下のﾘﾝｸから、本文を入力せずにﾒｰﾙを送信してください。<br>
<br>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})">[i:106]ﾒｰﾙで登録!</a><br>
<br>
※かならず利用規約に同意してから登録をおこなってください。<br>
※ﾄﾞﾒｲﾝ指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのﾒｰﾙを受信できるように指定してください。<br>

<hr color="#({$ktai_color_config.border_01})">
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
({if $smarty.const.OPENPNE_DISP_KTAI_SNS_PRIVACY})
■<a href="({t_url m=ktai a=page_o_sns_privacy})">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>
({/if})
({/if})

({$inc_ktai_footer|smarty:nodefaults})
