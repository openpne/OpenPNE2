({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾒｯｾｰｼﾞの送信</font><br>
</td></tr></table>

({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})

<font color="#({$ktai_color_config.font_06})">宛先：</font><a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})</a><br>
({t_form m=ktai a=do_f_message_send_insert_c_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_member_id_to" value="({$target_c_member.c_member_id})">
<font color="#({$ktai_color_config.font_06})">件名：</font><br>
<input type="text" name="subject" value="({$form_val.subject})"><br>
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6">({$form_val.body})</textarea>
<center>
<input type="submit" value="ﾒｯｾｰｼﾞを送る">
<input type="submit" name="save" value="下書き保存">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
