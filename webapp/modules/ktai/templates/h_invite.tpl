({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">友人を招待</a></font><br>
</td></tr></table>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
現在、新規登録を停止しています。
({else})
({$smarty.const.SNS_NAME})に招待したい方のﾒｰﾙｱﾄﾞﾚｽを記入してください。<br>
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
※携帯ﾒｰﾙｱﾄﾞﾚｽには招待を送ることができません。<br>
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
※PCﾒｰﾙｱﾄﾞﾚｽには招待を送ることができません。<br>
({/if})

({t_form m=ktai a=do_h_invite_insert_c_invite})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
<input type="text" name="mail_address" istyle="3" mode="alphabet" maxlength="100"><br>
<br>
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6"></textarea><br>
<center>
<input type="submit" value="送信">
</center>
</form>
({/if})
({$inc_ktai_footer|smarty:nodefaults})