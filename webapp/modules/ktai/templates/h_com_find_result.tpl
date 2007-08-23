({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ｺﾐｭﾆﾃｨ検索結果</a></font><br>
</td></tr></table>

<center>
({if $search_word})
「({$search_word})」の検索結果
({/if})
<font color="#999966">(({$count_total})件)</font>
</center>
<table width="100%">
<tr><td>
<hr color="#b3ceef">
</td></tr>
({foreach from=$c_commu_search_result item=commu})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;({$tail})">({$commu.name|t_truncate:30:""})(({$commu.count_commu_member}))</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_find_result})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})&amp;target_c_commu_category_parent_id=({$target_c_commu_category_parent_id})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_find_result})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})&amp;target_c_commu_category_parent_id=({$target_c_commu_category_parent_id})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
<table width="100%">
<tr><td bgcolor="#dddddd" align="center">
ｺﾐｭﾆﾃｨ検索<br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">ｷｰﾜｰﾄﾞ：</font><br>
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
<hr color="#0d6ddf">
&#xE6DA;<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">ｺﾐｭﾆﾃｨ検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})