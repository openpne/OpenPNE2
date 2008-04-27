({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_event.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｲﾍﾞﾝﾄ参加者ﾘｽﾄ</font><br>
</td></tr></table>
({if $count_member})
<center>
({$pager.start})件～({$pager.end})件を表示
</center>

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_event_member_list item=c_member})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({else})
ｲﾍﾞﾝﾄへの参加者がいません。
({/if})
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄに戻る</a><br>
[i:90]<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">ｲﾍﾞﾝﾄﾘｽﾄに戻る</a><br>
[i:90]<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
