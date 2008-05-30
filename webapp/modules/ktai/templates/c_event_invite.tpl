({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu_topic.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｲﾍﾞﾝﾄ紹介</font><br>
</td></tr></table>

({if $c_friend_list})

このｲﾍﾞﾝﾄを紹介したい({$WORD_MY_FRIEND_HALF})を選び、紹介ﾒｯｾｰｼﾞを書いてください。
<br>

({t_form m=ktai a=do_c_event_invite})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic.c_commu_topic_id})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<font color="#({$ktai_color_config.font_06})">紹介先：</font><br>
<select name="c_member_id">
({foreach from=$c_friend_list item=c_friend})
<option value="({$c_friend.c_member_id_to})">({$c_friend.nickname})
({/foreach})
</select>
<br>
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6"></textarea><br>
<br>
<input type="submit" value="ﾒｯｾｰｼﾞを送信する">
</form>

<br>
※紹介先の選択肢はﾗﾝﾀﾞﾑとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_c_event_invite})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})&amp;({$tail})">ここ</a>を押して画面を更新してください
({else})
紹介できる({$WORD_MY_FRIEND_HALF})がいません。
({/if})

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})ﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
