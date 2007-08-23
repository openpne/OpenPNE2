({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ管理<br>
</td></tr></table>

({$target_c_member.nickname})さんをｺﾐｭﾆﾃｨから本当に退会させますか?<br>

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_c_edit_member_delete_c_commu_member})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">
<input type="submit" value="は　い">
</form>

({t_form m=ktai a=page_c_edit_member})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<input type="submit" value="いいえ">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
