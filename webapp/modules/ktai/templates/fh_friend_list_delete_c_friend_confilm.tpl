({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_MY_FRIEND_HALF})から外す</font><br>
</td></tr></table>

({$target_c_member.nickname})さんを({$WORD_MY_FRIEND_HALF})から本当に外しますか?<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_fh_friend_list_delete_c_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_h_manage_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
