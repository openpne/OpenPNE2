({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<center>({$SNS_NAME})ログイン</center>
<hr>

({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})

({if $msg})
<font color="red">({$msg})</font><br>
({/if})
<br>

({t_form _attr='utn' m=ktai a=do_o_easy_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
({if $ktai_address})
<input type="hidden" name="ktai_address" value="({$ktai_address})">
({/if})
★かんたんログイン<br>
<input type="submit" value="ログイン"><br>
<a href="({t_url m=ktai a=page_o_whatis_easy_login})">&gt;&gt;かんたんﾛｸﾞｲﾝとは</a>
</form>

<br>

({t_form m=ktai a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
({if $ktai_address})
<input type="hidden" name="username" value="({$ktai_address})">
({else})
({if !$smarty.const.IS_SLAVEPNE})
★携帯アドレス<br>
({else})
★メンバーID<br>
({/if})
<textarea name="username" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea><br>
({/if})
★パスワード<br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<input name="submit" value="ログイン" type="submit"><br>
</form>

<br>
<font color="orange">■このﾍﾟｰｼﾞをﾌﾞｯｸﾏｰｸしてください</font>
<hr>

({if $ktai_address})
<a href="({t_url m=ktai a=page_o_login})">&gt;&gt;携帯アドレスを入力</a><br>
({/if})
({if !$smarty.const.IS_SLAVEPNE})
<a href="({t_url m=ktai a=page_o_password_query})">&gt;&gt;パスワードを忘れた方</a><br>
({/if})

({if $smarty.const.IS_SLAVEPNE})
({elseif $IS_CLOSED_SNS})
<hr>
({$SNS_NAME})は招待制のソーシャルネットワーキングサービスです。<br>
登録には({$SNS_NAME})({if $smarty.const.IS_USER_INVITE})参加者({else})管理者({/if})からの招待が必要です。
({elseif !((($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI)) >> 1)})
<hr>
新規登録はPCからおこなってください。
({else})
<hr>
新規登録するには以下のリンクから、本文を入力せずにメールを送信してください。<br>
<br>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})">◆メールで登録！◆</a><br>
<br>
※かならず利用規約に同意してから登録をおこなってください。<br>
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
■<a href="({t_url m=ktai a=page_o_sns_privacy})">プライバシーポリシー</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
