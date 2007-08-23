({$inc_ktai_header|smarty:nodefaults})

<center>ｺﾐｭﾆﾃｨ検索結果</center>
<hr>
({if $search_word})
「({$search_word})」の検索結果<br>
({/if})
(({$count_total})件)<br>

({foreach from=$c_commu_search_result item=commu})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;({$tail})">({$commu.name})</a>(({$commu.count_commu_member}))<br>
({/foreach})

({if $is_prev || $is_next})
<br>
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_find_result})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})&amp;target_c_commu_category_parent_id=({$target_c_commu_category_parent_id})&amp;({$tail})" accesskey="4">&#xE6E5;前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_find_result})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})&amp;target_c_commu_category_parent_id=({$target_c_commu_category_parent_id})&amp;({$tail})" accesskey="6">&#xE6E7;次を表示</a>({/if})
<br>
</center>
({/if})

({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="search_word" value="({$search_word})">
<br>
<select name="target_c_commu_category_id">
<option value="all">すべてのｶﾃｺﾞﾘ
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})" ({if $target_c_commu_category_id==$item.c_commu_category_id})selected({/if})>({$item.name})
({/foreach})
</select>
<br>
<input type="submit" value="検索">
</form>
<hr>
<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">ｺﾐｭﾆﾃｨ検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})