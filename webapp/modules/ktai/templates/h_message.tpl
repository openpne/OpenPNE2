({$inc_ktai_header|smarty:nodefaults})

ﾒｯｾｰｼﾞBOX<br>
<hr>
({if $prev_c_message_id})
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$prev_c_message_id})&amp;({$tail})">前を表示</a>
({/if})
({if $next_c_message_id})
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$next_c_message_id})&amp;({$tail})">次を表示</a>
({/if})
<br>
({$c_message.r_datetime|date_format:"%y/%m/%d %H:%M"})<br>
({if $c_message.c_member_id_to==$u})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_from})&amp;({$tail})">({$c_message.c_member_nickname_from})</a>
({else})({$c_message.c_member_nickname_from})
({/if})
＞＞
({if $c_message.c_member_id_to==$u})({$c_message.c_member_nickname_to})
({else})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_to})&amp;({$tail})">({$c_message.c_member_nickname_to})</a>
({/if})
<br>
<br>
({$c_message.subject})<br>
<br>
({$c_message.body|nl2br})
({if $com_url})<a href="({$com_url})">ｺﾐｭﾆﾃｨﾍﾟｰｼﾞ</a>({/if})
({if $friend_url})<a href="({$friend_url})">ﾒﾝﾊﾞｰのﾍﾟｰｼﾞ</a>({/if})
<br>
({if $c_message.is_syoudaku})
<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})">承認待ちﾘｽﾄ</a><br>
({/if})
({if $c_message.c_member_id_to==$u})
<hr>
■返信を書く<br>
({t_form m=ktai a=do_h_message_insert_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id" value="({$c_message.c_message_id})">
<input type="hidden" name="target_c_member_id" value="({$c_message.c_member_id_from})">
<font color=red>({if $msg})({$msg})<br>({/if})</font>
ﾀｲﾄﾙ:<br>
<input type="text" name="subject" value="Re:({$c_message.subject})" size="14"><br>
本文:<br>
<textarea cols="14" rows="6" name="body"></textarea><br>
<br>
<input type="submit" value="送信">
</form>
({/if})
<hr>
<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})">ﾒｯｾｰｼﾞﾎﾞｯｸｽ</a><br>

({$inc_ktai_footer|smarty:nodefaults})