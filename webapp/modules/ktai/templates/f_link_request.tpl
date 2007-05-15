({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({$target_c_member.nickname})さんを({$WORD_FRIEND_HALF})に加える</font></center>
<hr>
({$WORD_FRIEND_HALF})リンク要請ﾒｯｾｰｼﾞを送信し、承認を受けてください
<hr>
({if $msg})({$msg})<br>({/if})
({t_form m=ktai a=do_f_link_request_insert_c_friend_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})">
ﾒｯｾｰｼﾞ<br>
<textarea name="body"></textarea><br>
<input type="submit" value="送信">
</form>

<hr>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})