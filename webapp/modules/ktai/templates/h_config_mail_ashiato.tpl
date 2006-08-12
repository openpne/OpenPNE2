({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">あしあとお知らせメール設定</font></center>
<hr>
ここで指定したｱｸｾｽ数に達したとき、お知らせﾒｰﾙが届きます。<br>
<br>
({t_form m=ktai a=do_h_config_mail_ashiato_update})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="ashiato_mail_num" value="({$c_member.ashiato_mail_num})" size="6" maxlength="10">ｱｸｾｽ目にﾒｰﾙを受け取る<br>
<input type="submit" value="変更"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
