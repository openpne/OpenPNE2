({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_COMMUNITY_HALF})検索結果</a></font><br>
</td></tr></table>

<center>
({if $search_word})
「({$search_word})」の検索結果
({/if})
<font color="#({$ktai_color_config.font_06})">(({$count_total})件)</font>
</center>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({foreach from=$c_commu_search_result item=commu})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;({$tail})">({$commu.name|t_truncate:30:""})(({$commu.count_commu_member}))</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_find_result})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})&amp;target_c_commu_category_id=({$target_c_commu_category_id})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_find_result})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})&amp;target_c_commu_category_id=({$target_c_commu_category_id})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.color_27})" align="center">
<font color="#({$ktai_color_config.color_28})">({$WORD_COMMUNITY_HALF})検索</font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="search_word" value="({$search_word})">
<br>
<select name="target_c_commu_category_id">
<option value="all">すべてのｶﾃｺﾞﾘ
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})" ({if $target_c_commu_category_id==$item.c_commu_category_id})selected({/if})>({$item.name})
({/foreach})
</select>
<center>
<input type="submit" value="検索">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">({$WORD_COMMUNITY_HALF})検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})