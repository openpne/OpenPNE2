({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">あしあとお知らせﾒｰﾙ設定</font><br>
</td></tr></table>
ここで指定したｱｸｾｽ数に達したとき、お知らせﾒｰﾙが届きます。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=do_h_config_mail_ashiato_update})
<font color="#({$ktai_color_config.font_06})">あしあとお知らせﾒｰﾙ：</font><br>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="ashiato_mail_num" value="({$c_member.ashiato_mail_num})" size="6" maxlength="10" istyle="4" mode="numeric">ｱｸｾｽ目にﾒｰﾙを受け取る<br>
<center>
<input type="submit" value="変更"><br>
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">

[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
