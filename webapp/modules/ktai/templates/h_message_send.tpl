({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ﾒｯｾｰｼﾞを送る</font></center>
<hr>
({t_form m=ktai a=do_h_message_send_insert_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<font color=red>({if $msg})({$msg})<br>({/if})</font>
送信先<br>
<select name="target_c_member_id">
({foreach from=$c_friend_list item=c_friend})
<option value="({$c_friend.c_member_id_to})">({$c_friend.nickname})
({/foreach})
</select>
<br>
ﾀｲﾄﾙ<br>
<input type="text" name="subject"><br>
本文<br>
<textarea name="body"></textarea><br>
<input type="submit" value="送信">
</form>
送信先の選択肢はランダムとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ここ</a>を押して画面を更新してください
<hr>

<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})">ﾒｯｾｰｼﾞﾎﾞｯｸｽ</a><br>

({$inc_ktai_footer|smarty:nodefaults})