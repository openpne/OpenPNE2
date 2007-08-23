({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
({$WORD_MY_FRIEND_HALF})から外す<br>
</td></tr></table>

({$target_c_member.nickname})さんを({$WORD_MY_FRIEND_HALF})から本当に外しますか?<br>

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_fh_friend_list_delete_c_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form m=ktai a=page_h_manage_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
