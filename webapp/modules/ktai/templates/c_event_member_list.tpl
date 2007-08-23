({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_event.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｲﾍﾞﾝﾄ参加者ﾘｽﾄ<br>
</td></tr></table>
({if $count_member})
<center>
({$pager.start})件～({$pager.end})件を表示
</center>

<hr color="#b3ceef">
<table width="100%">
({foreach from=$c_event_member_list item=c_member})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
({else})
ｲﾍﾞﾝﾄへの参加者がいません。
({/if})
<hr color="#0d6ddf">
%%i117%%<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄに戻る</a><br>
%%i117%%<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">ｲﾍﾞﾝﾄﾘｽﾄに戻る</a><br>
%%i117%%<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
