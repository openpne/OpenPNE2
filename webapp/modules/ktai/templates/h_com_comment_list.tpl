({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_COMMUNITY_HALF})最新書き込み</a></font><br>
</td></tr></table>
({if !$h_com_comment_list})
({$WORD_COMMUNITY_HALF})最新書き込みはありません。
({else})
<center>
({$pager.start})～({$pager.end})件目を表示
</center>
<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$h_com_comment_list item=each_topic})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$each_topic.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$each_topic.c_commu_topic_id})&amp;({$tail})">({$each_topic.c_commu_topic_name|t_truncate:50:""})(({$each_topic.number}))</a>
(({$each_topic.c_commu_name|t_truncate:17:""}))
({if $each_topic.image_filename1 || $each_topic.image_filename2 || $each_topic.image_filename3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
({/if})

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_comment_list})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_comment_list})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
<br>
({$inc_ktai_footer|smarty:nodefaults})
