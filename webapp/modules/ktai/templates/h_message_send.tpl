({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾒｯｾｰｼﾞの送信</a></font><br>
</td></tr></table>

({t_form m=ktai a=do_h_message_send_insert_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})">
<input type="hidden" name="hensinmoto_c_message_id" value="({$form_val.hensinmoto_c_message_id})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<font color="#({$ktai_color_config.font_06})">宛先：</font>
({if $target_c_member})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})</a><br>
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})">
({else})
<br>
<select name="target_c_member_id">
({if $form_val.target_c_member_id})<option value="({$form_val.target_c_member_id})" selected="selected">({$form_val.target_c_member.nickname})({/if})
({foreach from=$c_friend_list item=c_friend})
({if $c_friend.c_member_id_to != $form_val.target_c_member_id})<option value="({$c_friend.c_member_id_to})">({$c_friend.nickname})({/if})
({/foreach})
</select>
<br>
<font color="#({$ktai_color_config.font_06})">※宛先の選択肢はﾗﾝﾀﾞﾑとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ここ</a>を押して画面を更新してください。</font><br>
({/if})
<br>
<font color="#({$ktai_color_config.font_06})">件名：</font><br>
<input type="text" name="subject" value="({$form_val.subject})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">本文：</font><br>
<textarea name="body" rows="6">({$form_val.body})</textarea><br>
<center>
<input type="submit" value="ﾒｯｾｰｼﾞを送る">
<input type="submit" name="save" value="下書き保存">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})">ﾒｯｾｰｼﾞﾎﾞｯｸｽ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
