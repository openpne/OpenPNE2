({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾏｲﾎｰﾑへの最新情報表示</font><br>
</td></tr></table>
ﾏｲﾎｰﾑに表示する情報を選択できます。
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">全体の最新({$WORD_DIARY_HALF})：</font><br>
({t_form m=ktai a=do_h_member_config_update_display_home})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="IS_DISPLAY_NEWDIARY_HOME_KTAI" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME_KTAI}) checked="checked"({/if})>
表示する<br>
<input type="radio" name="IS_DISPLAY_NEWDIARY_HOME_KTAI" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME_KTAI}) checked="checked"({/if})>
表示しない<br>
<font color="#({$ktai_color_config.font_06})">全体の最新({$WORD_COMMUNITY_HALF})書き込み：</font><br>
<input type="radio" name="IS_DISPLAY_NEWTOPIC_HOME_KTAI" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME_KTAI}) checked="checked"({/if})>
表示する<br>
<input type="radio" name="IS_DISPLAY_NEWTOPIC_HOME_KTAI" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME_KTAI}) checked="checked"({/if})>
表示しない<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="変更">
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
