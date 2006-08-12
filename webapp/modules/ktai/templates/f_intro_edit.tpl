({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">紹介文を作成する</font></center>
<hr>
({$target_member.nickname})さんの紹介文を書いてください<br>

({if $msg})<font color="red">({$msg})</a><br>({/if})
({t_form m=ktai a=do_f_intro_edit_update_c_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<textarea name="body" rows="6" cols="14" >({$intro_body})</textarea><br>
<input type="submit" value="送信">
</form>

<hr>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">({$target_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
