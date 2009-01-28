({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_DIARY_HALF})ｺﾒﾝﾄ記入履歴</a></font><br>
</td></tr></table>

({if !$c_diary_my_comment_list})
({$WORD_DIARY_HALF})ｺﾒﾝﾄ記入履歴はありません。
({else})
<center>
({$pager.start})～({$pager.end})件を表示
</center>

<hr color="#({$ktai_color_config.border_02})">

<table width="100%">
({foreach from=$c_diary_my_comment_list item=each_diary name=c_diary_my_comment_list_name})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$each_diary.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$each_diary.c_diary_id})&amp;({$tail})">({$each_diary.subject|t_truncate:28:""})(({$each_diary.num_comment}))
</a>
(({$each_diary.nickname|t_truncate:17:""}))
({if $each_diary.image_filename_1 || $each_diary.image_filename_2 || $each_diary.image_filename_3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
<br>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_diary_comment_list})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_diary_comment_list})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
({/if})
({$inc_ktai_footer|smarty:nodefaults})
