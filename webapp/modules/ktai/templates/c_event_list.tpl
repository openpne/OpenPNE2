({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｲﾍﾞﾝﾄﾘｽﾄ</font><br>
</td></tr></table>

({if !$c_topic_list})
ｲﾍﾞﾝﾄはありません。
({else})

<center>
({$start_num})件～({$end_num})件を表示
</center>

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_topic_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$item.u_datetime|date_format:"%Y/%m/%d %H:%M"})
({if $item.is_c_topic_admin ==$u || $c_commu.c_member_id_admin == $u})
[<a href="({t_url m=ktai a=page_c_event_edit})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">編集</a>]
({/if})<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:50:""})(({$item.write_num}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})

({/if})

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})に戻る</a><br>
({$inc_ktai_footer|smarty:nodefaults})
