({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
({$smarty.const.SNS_NAME}) 退会</a></font><br>
</td></tr></table>

本当に退会してもよろしいですか?<br>
退会する場合は、確認のためﾊﾟｽﾜｰﾄﾞを入力してください。<br>
<br>
管理者になっている({$WORD_COMMUNITY_HALF})があれば、副管理者に管理権限が移管されます。また、副管理者がいない場合は参加日時のもっとも早いﾒﾝﾊﾞｰに権限が移管されます。<br>

<hr color="#({$ktai_color_config.border_01})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br><br>({/if})

({t_form m=ktai a=do_h_taikai})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="password" istyle="3" mode="alphabet" maxlength="12"><br>
<br>
<font color="#({$ktai_color_config.font_06})">退会理由：</font><br>
<textarea name="reason" rows="6"></textarea><br>
<center>
<input type="submit" value="退会する">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})