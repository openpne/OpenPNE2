({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾄﾋﾟｯｸ検索</a></font><br>
</td></tr></table>
<center>
({if $keyword})
「({$keyword})」の検索結果
({/if})
<font color="#({$ktai_color_config.font_06})">(({$total_num})件)</font><br>
</center>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({foreach from=$c_commu_topic_search_list item=topic})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$topic.max_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$topic.c_commu_topic_id})&amp;({$tail})">({$topic.name|t_truncate:50:""})(({$topic.max_number}))</a>(({$topic.commu_name|t_truncate:17:""}))({if $topic.image_filename1 || $topic.image_filename2 || $topic.image_filename3})
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
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;c_commu_id=({$c_commu_id})&amp;type=({$search_val_list.type})&amp;page=({$page-1})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;c_commu_id=({$c_commu_id})&amp;type=({$search_val_list.type})&amp;page=({$page+1})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.color_27})" align="center">
<font color="#({$ktai_color_config.color_28})">ﾄﾋﾟｯｸ検索</font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_topic_find_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="keyword" value="({$keyword})"><br>
<select name="type">
<option value="all"({if $requests.type == 'all'}) selected({/if})>すべて
<option value="topic"({if $requests.type == 'topic'}) selected({/if})>ﾄﾋﾟｯｸ
<option value="event"({if $requests.type == 'event'}) selected({/if})>ｲﾍﾞﾝﾄ
</select><br>
<input type="submit" value="検索">
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">({$WORD_COMMUNITY_HALF})検索に戻る</a><br>
({$inc_ktai_footer|smarty:nodefaults})
