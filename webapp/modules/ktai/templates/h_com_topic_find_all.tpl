({$inc_ktai_header|smarty:nodefaults})

<center>ﾄﾋﾟｯｸ検索</center>
<hr>
({if $keyword})
「({$keyword})」の検索結果<br>
({/if})
(({$total_num})件)<br>
<br>

({foreach from=$c_commu_topic_search_list item=topic})
({$topic.max_datetime|date_format:"%m/%d"}) (({$topic.commu_name}))<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$topic.c_commu_topic_id})&amp;({$tail})">({$topic.name})</a>(({$topic.max_number}))<br>
({/foreach})

({if $is_prev || $is_next})
<br>
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;c_commu_id=({$c_commu_id})&amp;type=({$search_val_list.type})&amp;page=({$page-1})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;c_commu_id=({$c_commu_id})&amp;type=({$search_val_list.type})&amp;page=({$page+1})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})

<hr>
ﾄﾋﾟｯｸ検索<br>

({t_form _method=get m=ktai a=page_h_com_topic_find_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="keyword" value="({$keyword})"><br>
<select name="type">
<option value="all"({if $requests.type == 'all'}) selected({/if})>すべて
<option value="topic"({if $requests.type == 'topic'}) selected({/if})>ﾄﾋﾟｯｸ
<option value="event"({if $requests.type == 'event'}) selected({/if})>ｲﾍﾞﾝﾄ
</select><br>
<input type="submit" value="検索">
</form>

<hr>
<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">ｺﾐｭﾆﾃｨ検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
