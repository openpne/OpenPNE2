({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">一括メッセージ</font></center>
<hr>

({if $c_event_member_list})
({t_form m=ktai a=page_c_event_mail_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
送信先<br>
({foreach from=$c_event_member_list item=c_member})
<input type="checkbox" name="c_member_id[]" value="({$c_member.c_member_id})" checked="checked">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
({/foreach})
メッセージ<br>
<textarea name="body"></textarea><br>
<input type="submit" value="確認画面">
</form>
({else})
送信するメンバーがいません。
({/if})

<hr>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
