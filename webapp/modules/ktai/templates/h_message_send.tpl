({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ﾒｯｾｰｼﾞの送信</a></font><br>
</td></tr></table>

({t_form m=ktai a=do_h_message_send_insert_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<font color=red>({if $msg})({$msg})<br>({/if})</font>
<font color="#999966">宛先：</font><br>
<select name="target_c_member_id">
({foreach from=$c_friend_list item=c_friend})
<option value="({$c_friend.c_member_id_to})">({$c_friend.nickname})
({/foreach})
</select>
<br>
<font color="#999966">※宛先の選択肢はﾗﾝﾀﾞﾑとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ここ</a>を押して画面を更新してください。</font><br>
<br>
<font color="#999966">件名：</font><br>
<input type="text" name="subject"><br>
<br>
<font color="#999966">本文：</font><br>
<textarea name="body"></textarea><br>
<center>
<input type="submit" value="ﾒｯｾｰｼﾞを送る">
</center>
</form>
<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})">ﾒｯｾｰｼﾞﾎﾞｯｸｽ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
