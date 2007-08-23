({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ｶﾃｺﾞﾘ検索</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｶﾃｺﾞﾘ：({$c_commu_category_name})<br>
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
({foreach from=$c_commu_list item=c_commu})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name|t_truncate:50:""})(({$c_commu.count_commu_member}))</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$c_commu_category_id})&amp;page=({$page-1})&amp;({$tail})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})" accesskey="4">&#xE6E5;前を表示</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$c_commu_category_id})&amp;page=({$page+1})&amp;({$tail})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})" accesskey="6">&#xE6E7;次を表示</a>({/if})
</center>
({/if})
<br>

<table width="100%">
<tr><td bgcolor="#dddddd" align="center">
ｶﾃｺﾞﾘ内から検索<br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_category})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_category_id" value="({$c_commu_category_id})">
<font color="#999966">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="search_word" maxlength="64" value="({$search_word})"><br>
<input type="submit" value="検索">
</form>
<hr color="#0d6ddf">
&#xE697;<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">ｺﾐｭﾆﾃｨ検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})