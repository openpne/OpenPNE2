({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<table width="100%">
<tr><td align="center">
<img src="./skin/default/img/ktai/skin_header.jpg" alt="({$smarty.const.SNS_NAME})"><br>
</td></tr>
({if $inc_ktai_entry_point[2]})
<tr><td>({$inc_ktai_entry_point[2]|smarty:nodefaults})<br>
</td></tr>
({/if})
</table>
<br>
<center>
このﾍﾟｰｼﾞをﾌﾞｯｸﾏｰｸしてください<br>
({if $msg})
<br>
<font color="#ff0000">({$msg})</font><br>
({/if})
</center>
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_01})">
%%i75%%<font color="#({$ktai_color_config.font_01})">かんたんﾛｸﾞｲﾝ</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
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

<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})">%%i116%%ﾊﾟｽﾜｰﾄﾞﾛｸﾞｲﾝ</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
({t_form m=ktai a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
({if $ktai_address})
<input type="hidden" name="username" value="({$ktai_address})">
({else})
({if !$smarty.const.IS_SLAVEPNE})
<font color="#({$ktai_color_config.bg_01})">★</font>携帯ｱﾄﾞﾚｽ<br>
({else})
<font color="#({$ktai_color_config.bg_01})">★</font>ﾒﾝﾊﾞｰID<br>
({/if})
<textarea name="username" rows="1" istyle="3" mode="alphabet"></textarea><br>
({/if})
<font color="#({$ktai_color_config.bg_01})">★</font>ﾊﾟｽﾜｰﾄﾞ<br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<center>
<input name="submit" value="ﾛｸﾞｲﾝ" type="submit"><br>
</center>
</form>
({if $ktai_address})
<a href="({t_url m=ktai a=page_o_login})">&gt;&gt;携帯ｱﾄﾞﾚｽを入力</a><br>
({/if})
({if !$smarty.const.IS_SLAVEPNE})
<a href="({t_url m=ktai a=page_o_password_query})">&gt;&gt;ﾊﾟｽﾜｰﾄﾞを忘れた方</a><br>
({/if})
</td></tr></table>
<br>
<hr color="#({$ktai_color_config.border_01})">
({if $IS_CLOSED_SNS})
({$SNS_NAME})は招待制のｿｰｼｬﾙﾈｯﾄﾜｰｷﾝｸﾞｻｰﾋﾞｽです。<br>
登録には({$SNS_NAME})参加者からの招待が必要です。<br>

({elseif !((($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI)) >> 1)})

新規登録はPCからおこなってください。<br>

({else})

新規登録するには以下のﾘﾝｸから、本文を入力せずにﾒｰﾙを送信してください。<br>
<br>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})">%%i106%%ﾒｰﾙで登録!</a><br>
<br>
※かならず利用規約に同意してから登録をおこなってください。<br>

<hr color="#({$ktai_color_config.border_01})">
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
■<a href="({t_url m=ktai a=page_o_sns_privacy})">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
