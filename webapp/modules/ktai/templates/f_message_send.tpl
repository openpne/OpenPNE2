({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({$target_c_member.nickname})さんにﾒｯｾｰｼﾞを送る</font></center>
<hr>
<font color=red>({if $msg})({$msg})<br>({/if})</font>
({t_form m=ktai a=do_f_message_send_insert_c_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_member_id_to" value="({$target_c_member.c_member_id})">
ﾀｲﾄﾙ<br>
<input type="text" name="subject"><br>
本文<br>
<textarea name="body"></textarea><br>
<input type="submit" value="送信">
</form>

<hr>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})