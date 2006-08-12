({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｲﾍﾞﾝﾄ参加ﾒﾝﾊﾞｰ(({$count_member}))</font></center>
<hr>
({foreach from=$c_event_member_list item=c_member })
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
({/foreach})

({if $is_prev || $is_next})
<br>
({if $is_prev})<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})">次へ</a>({/if})
({/if})

<hr>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
