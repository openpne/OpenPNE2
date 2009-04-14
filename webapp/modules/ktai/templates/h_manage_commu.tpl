({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_COMMUNITY_HALF})管理</a></font><br>
</td></tr></table>

({if !$c_commu_list})
({$WORD_COMMUNITY_HALF})がありません。
({else})
<center>
({$pager.start_num})～({$pager.end_num})件目を表示
</center>
({if $msg})
({foreach from=$msg item=item})
<font color="#({$ktai_color_config.font_09})">({$item})</font></br>
<br>
({/foreach})
({/if})

<table width="100%">
({foreach from=$c_commu_list item=commu})
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})：</font><br>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;({$tail})">({$commu.name})</a><br>
<br>
({if $commu.is_display_topic_home})
<a href="({t_url m=ktai a=do_h_commu_update_is_display_topic_home page=$page})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;target_is_display_topic_home=0&amp;({$tail})">({$WORD_COMMUNITY_HALF})最新書き込みを表示しない</a>
({else})
<a href="({t_url m=ktai a=do_h_commu_update_is_display_topic_home page=$page})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;target_is_display_topic_home=1&amp;({$tail})">({$WORD_COMMUNITY_HALF})最新書き込みを表示する</a>
({/if})
<br></td></tr>
({/foreach})
</table>

({if $pager.prev_page || $pager.next_page})
<hr color="#({$ktai_color_config.border_02})">
<center>
({if $pager.prev_page})<a href="({t_url m=ktai a=page_h_manage_commu})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $pager.prev_page && $pager.next_page})&nbsp;({/if})
({if $pager.next_page})<a href="({t_url m=ktai a=page_h_manage_commu})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({/if})
<hr color="#({$ktai_color_config.border_01})">
[i:140]<a href="({t_url m=ktai a=page_fh_com_list})&amp;({$tail})">参加({$WORD_COMMUNITY_HALF})ﾘｽﾄ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
