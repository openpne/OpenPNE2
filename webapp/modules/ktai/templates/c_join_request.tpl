({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨに参加</font></center>
<hr>
このｺﾐｭﾆﾃｨに参加するには、ｺﾐｭﾆﾃｨ管理者の承認が必要です。<br>
<br>
ｺﾐｭﾆﾃｨ管理者への参加希望ﾒｯｾｰｼﾞを送信し、承諾を受けてください<br>
<hr>
({if $msg})
<font color="red">({$msg})</font><br>
({/if})
({t_form m=ktai a=do_c_join_request_insert_c_commu_member_confirm})
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
ﾒｯｾｰｼﾞ<br>
<textarea name="body"></textarea><br>
<input type="submit" value="送信">
</form>
<hr>

<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})