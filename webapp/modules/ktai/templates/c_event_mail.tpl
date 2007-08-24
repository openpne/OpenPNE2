({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｲﾍﾞﾝﾄ一括ﾒｯｾｰｼﾞ送信<br>
</td></tr></table>
({if $c_event_member_list})
({t_form m=ktai a=page_c_event_mail_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">宛先：</font><br>
<hr color="#b3ceef">
<table width="100%">
({foreach from=$c_event_member_list item=c_member})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<input type="checkbox" name="c_member_id[]" value="({$c_member.c_member_id})" checked="checked">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>

<font color="#999966">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6"></textarea><br>
<input type="submit" value="確認画面">
</form>
({else})
送信するﾒﾝﾊﾞｰがいません。
({/if})

<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
