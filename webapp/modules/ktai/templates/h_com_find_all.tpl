({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">ｺﾐｭﾆﾃｨ検索</a></font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_02})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="search_word" value=""><br>
<select name="target_c_commu_category_id">
<option value="all">すべてのｶﾃｺﾞﾘ
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})">({$item.name})
({/foreach})
</select>
<center>
<input type="submit" value="検索">
</center>
</form>
<hr color="#({$ktai_color_config.border_02})">
<font color="#({$ktai_color_config.font_03})">⇒</font><a href="({t_url m=ktai a=page_h_com_add})&amp;({$tail})">ｺﾐｭﾆﾃｨ作成</a><br>
<font color="#({$ktai_color_config.font_03})">⇒</font><a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;({$tail})">ﾄﾋﾟｯｸ検索</a><br>
<hr color="#({$ktai_color_config.border_01})">
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ｶﾃｺﾞﾘ別に表示<br>
</td></tr>
({foreach from=$c_commu_category_parent_list item=ccpl})
<tr><td>
<font color="#({$ktai_color_config.font_02})">({$ccpl.name})：</font><br>
<tr><td>
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({foreach from=$c_commu_category_list item=cccl})
({if $ccpl.c_commu_category_parent_id == $cccl.c_commu_category_parent_id })
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_05`,`$ktai_color_config.bg_08`"})">
<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$cccl.c_commu_category_id})&amp;({$tail})">({$cccl.name|t_truncate:50:""})</a><br>
</td></tr>
({/if})
({/foreach})
<tr><td>
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
<br>

({$inc_ktai_footer|smarty:nodefaults})