({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({if $keyword})({$WORD_DIARY_HALF})検索結果({else})最新({$WORD_DIARY_HALF})({/if})</a></font><br>
</td></tr></table>
<center>
({if $keyword})
「({$keyword})」の検索結果
({/if})
<font color="#({$ktai_color_config.font_06})">(({$c_diary_search_list_count|default:"0"})件)</font><br>
</center>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>

({foreach from=$new_diary_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:28:""})(({$item.num_comment}))</a>(({$item.c_member.nickname|t_truncate:17:""}))
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
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
({if $is_prev})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.color_27})" align="center">
<font color="#({$ktai_color_config.color_28})">({$WORD_DIARY_HALF})検索</font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_diary_list_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="keyword" value="({$keyword})">
<center>
<input type="submit" value="検索">
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
({if $keyword})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">最新({$WORD_DIARY_HALF})</a><br>({/if})

({$inc_ktai_footer|smarty:nodefaults})
