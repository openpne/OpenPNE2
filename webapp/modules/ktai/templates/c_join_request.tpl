({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｺﾐｭﾆﾃｨに参加<br>
</td></tr></table>

ｺﾐｭﾆﾃｨ管理者への参加希望ﾒｯｾｰｼﾞを送信し、承諾を受けてください。<br>
({if $msg})
<font color="#ff0000">({$msg})</font><br>
({/if})
({t_form m=ktai a=do_c_join_request_insert_c_commu_member_confirm})
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body"></textarea><br>
<center>
<input type="submit" value="参加を希望する">
</center>
</form>
<hr　color="#0d6ddf">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">({$c_commu.name})ﾄｯﾌﾟ</a><br>
({$inc_ktai_footer|smarty:nodefaults})