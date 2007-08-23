({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
あしあとお知らせﾒｰﾙ設定<br>
</td></tr></table>
ここで指定したｱｸｾｽ数に達したとき、お知らせﾒｰﾙが届きます。
<hr color="#0d6ddf">
({t_form m=ktai a=do_h_config_mail_ashiato_update})
<font color="#999966">あしあとお知らせﾒｰﾙ：</font><br>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="ashiato_mail_num" value="({$c_member.ashiato_mail_num})" size="6" maxlength="10">ｱｸｾｽ目にﾒｰﾙを受け取る<br>
<center>
<input type="submit" value="変更"><br>
</center>
</form>

<hr color="#0d6ddf">

%%i90%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
