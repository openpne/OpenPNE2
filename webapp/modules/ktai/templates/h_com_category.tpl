({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨ：({$c_commu_category_name})</font></center>
<hr>
({if $search_word})
「({$search_word})」の検索結果<br>
({/if})
(({$count_total})件)<br>

({foreach from=$c_commu_list item=c_commu})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name})</a>(({$c_commu.count_commu_member}))<br>
({/foreach})
<br>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$c_commu_category_id})&amp;page=({$page-1})&amp;({$tail})&amp;search_word=({$search_word|to_sjis|escape:"url"})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$c_commu_category_id})&amp;page=({$page+1})&amp;({$tail})&amp;search_word=({$search_word|to_sjis|escape:"url"})">次へ</a>({/if})

<br>

({t_form _method=get m=ktai a=page_h_com_category})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_category_id" value="({$c_commu_category_id})">
ｶﾃｺﾞﾘ内から検索<br>
<input type="text" name="search_word" maxlength="64" value="({$search_word})"><br>
<input type="submit" value="検索">
</form>

<hr>

<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">ｺﾐｭﾆﾃｨ検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})