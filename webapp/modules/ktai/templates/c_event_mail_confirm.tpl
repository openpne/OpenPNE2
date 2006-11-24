({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">一括ﾒｯｾｰｼﾞ</font></center>
<hr>

名前<br>
({foreach from=$c_mail_member item=c_member})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
({/foreach})
ﾒｯｾｰｼﾞ<br>
({$body|nl2br})<br>
({t_form m=ktai a=do_c_event_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_id" value="({$c_commu_id})">
<input type="hidden" name="c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="hidden" name="c_member_ids" value="({$c_member_ids})">
<input type="hidden" name="body" value="({$body})">
({foreach from=$c_mail_member item=c_member})
<input type="hidden" name="c_member_ids[]" value="({$c_member.c_member_id})">
({/foreach})
<input type="submit" value="送信"><br>
</form>

({t_form m=ktai a=page_c_event_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="ｷｬﾝｾﾙ">
</form>

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu_topic.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
