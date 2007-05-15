({$inc_ktai_header|smarty:nodefaults})

<center>友人を招待する</center>
<hr>
({if $msg})
<font color=red>({$msg})</font><br>
<br>
({/if})

({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
現在、新規登録を停止しています。
({else})
({$smarty.const.SNS_NAME})に招待したい方のメールアドレスを記入してください。<br>
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
※携帯アドレスには招待を送ることができません。<br>
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
※PCアドレスには招待を送ることができません。<br>
({/if})

({t_form m=ktai a=do_h_invite_insert_c_invite})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
ﾒｰﾙｱﾄﾞﾚｽ<br>
<input type="text" name="mail_address" istyle="3" mode="alphabet" maxlength="100"><br>
ﾒｯｾｰｼﾞ<br>
<textarea name="body" cols="15"></textarea><br>
<input type="submit" value="送信">
</form>
({/if})

<hr>

({$inc_ktai_footer|smarty:nodefaults})