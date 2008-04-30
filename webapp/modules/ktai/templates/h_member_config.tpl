({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">その他設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_DIARY_HALF})ｺﾒﾝﾄﾒｰﾙ受信設定</font><br>
</td></tr></table>
({$WORD_DIARY_HALF})にｺﾒﾝﾄがついた時に登録されている携帯ﾒｰﾙｱﾄﾞﾚｽにお知らせします。
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">({$WORD_DIARY_HALF})ｺﾒﾝﾄﾒｰﾙ受信設定：</font><br>
({t_form m=ktai a=do_h_member_config})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="SEND_DIARY_COMMENT_MAIL_KTAI" value="1"({if $C_MEMBER_CONFIG.SEND_DIARY_COMMENT_MAIL_KTAI}) checked="checked"({/if})>
受け取る<br>
<input type="radio" name="SEND_DIARY_COMMENT_MAIL_KTAI" value="0"({if !$C_MEMBER_CONFIG.SEND_DIARY_COMMENT_MAIL_KTAI}) checked="checked"({/if})>
受け取らない<br>

({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾏｲﾎｰﾑへの最新情報表示</font><br>
</td></tr></table>
ﾏｲﾎｰﾑに表示する情報を選択出来ます。
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">最新({$WORD_DIARY_HALF})表示：</font><br>
<input type="radio" name="DISPLAY_CHANGE_NEWDIARY_HOME_KTAI" value="0"({if !$C_MEMBER_CONFIG.DISPLAY_CHANGE_NEWDIARY_HOME_KTAI}) checked="checked"({/if})>
ﾏｲﾌﾚﾝﾄﾞの({$WORD_DIARY_HALF})の新着を表示<br>
<input type="radio" name="DISPLAY_CHANGE_NEWDIARY_HOME_KTAI" value="1"({if $C_MEMBER_CONFIG.DISPLAY_CHANGE_NEWDIARY_HOME_KTAI}) checked="checked"({/if})>
全体の({$WORD_DIARY_HALF})の新着を表示<br>
<font color="#({$ktai_color_config.font_06})">最新ﾄﾋﾟｯｸ表示：</font><br>
<input type="radio" name="DISPLAY_CHANGE_NEWTOPIC_HOME_KTAI" value="0"({if !$C_MEMBER_CONFIG.DISPLAY_CHANGE_NEWTOPIC_HOME_KTAI}) checked="checked"({/if})>
参加({$WORD_COMMUNITY_HALF})の新着ﾄﾋﾟｯｸを表示<br>
<input type="radio" name="DISPLAY_CHANGE_NEWTOPIC_HOME_KTAI" value="1"({if $C_MEMBER_CONFIG.DISPLAY_CHANGE_NEWTOPIC_HOME_KTAI}) checked="checked"({/if})>
全体の新着ﾄﾋﾟｯｸを表示<br>
({/if})

<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="変更">
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
