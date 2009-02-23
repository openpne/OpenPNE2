({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_COMMUNITY_HALF})検索</a></font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
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
({if $c_commu_category_is_create_commu})
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_com_add})&amp;({$tail})">({$WORD_COMMUNITY_HALF})作成</a><br>
({/if})
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;({$tail})">ﾄﾋﾟｯｸ検索</a><br>
<hr color="#({$ktai_color_config.border_01})">
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.color_27})" align="center">
<font color="#({$ktai_color_config.color_28})">ｶﾃｺﾞﾘ別に表示</font><br>
</td></tr>
({foreach from=$c_commu_category_parent_list item=ccpl})
<tr><td>
<font color="#({$ktai_color_config.font_06})">({$ccpl.name})：</font><br>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({foreach from=$c_commu_category_list item=cccl})
({if $ccpl.c_commu_category_parent_id == $cccl.c_commu_category_parent_id })
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$cccl.c_commu_category_id})&amp;({$tail})">({$cccl.name|t_truncate:50:""})</a><br>
</td></tr>
({/if})
({/foreach})
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
<br>

({$inc_ktai_footer|smarty:nodefaults})
