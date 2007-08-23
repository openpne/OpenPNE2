({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｲﾍﾞﾝﾄ一括ﾒｯｾｰｼﾞ送信<br>
</td></tr></table>

以下の内容で送信します。よろしいですか?<br>

<hr color="#0d6ddf">
<font color="#999966">ﾆｯｸﾈｰﾑ：</font><br>
({foreach from=$c_mail_member item=c_member})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
({/foreach})
<br>
<font color="#999966">ﾒｯｾｰｼﾞ：</font><br>
({$body|nl2br})<br>

<hr color="#0d6ddf">
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

({t_form m=ktai a=page_c_event_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="　いいえ　">
</form>
</center>
({$inc_ktai_footer|smarty:nodefaults})
