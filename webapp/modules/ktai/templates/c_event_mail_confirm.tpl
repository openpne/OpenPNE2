({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｲﾍﾞﾝﾄ一括ﾒｯｾｰｼﾞ送信</font><br>
</td></tr></table>

以下の内容で送信します。よろしいですか?<br>

<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><br>
({foreach from=$c_mail_member item=c_member})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
({/foreach})
<br>
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
({$body|nl2br})<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_c_event_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_id" value="({$c_commu_id})">
<input type="hidden" name="c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="hidden" name="c_member_ids" value="({$c_member_ids})">
<input type="hidden" name="body" value="({$body})">
({foreach from=$c_mail_member item=c_member})
<input type="hidden" name="c_member_ids[]" value="({$c_member.c_member_id})">
({/foreach})
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_c_event_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
