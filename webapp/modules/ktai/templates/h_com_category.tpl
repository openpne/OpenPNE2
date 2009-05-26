({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ｶﾃｺﾞﾘ検索</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｶﾃｺﾞﾘ：({$c_commu_category_name})</font><br>
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
({foreach from=$c_commu_list item=c_commu})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name|t_truncate:50:""})(({$c_commu.count_commu_member}))</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$c_commu_category_id})&amp;page=({$page-1})&amp;({$tail})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})" accesskey="4">[i:128]前を表示</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$c_commu_category_id})&amp;page=({$page+1})&amp;({$tail})&amp;search_word=({$search_word|to_sjis|escape:url|smarty:nodefaults})" accesskey="6">[i:130]次を表示</a>({/if})
</center>
({/if})
<br>

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.color_27})" align="center">
<font color="#({$ktai_color_config.color_28})">ｶﾃｺﾞﾘ内から検索</font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_category})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_category_id" value="({$c_commu_category_id})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="search_word" maxlength="64" value="({$search_word})"><br>
<input type="submit" value="検索">
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">({$WORD_COMMUNITY_HALF})検索に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})