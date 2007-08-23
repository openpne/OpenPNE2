({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｲﾍﾞﾝﾄﾘｽﾄ<br>
</td></tr></table>

<center>
({$start_num})件～({$end_num})件を表示
</center>

<hr color="#b3ceef">
<table width="100%">
({foreach from=$c_topic_list item=item})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})
({if $item.is_c_topic_admin ==$u || $c_commu.c_member_id_admin == $u})
[<a href="({t_url m=ktai a=page_c_event_edit})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">編集</a>]
({/if})<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:50:""})(({$item.write_num}))</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})

<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
