({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ｺﾐｭﾆﾃｨ検索</a></font><br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">ｷｰﾜｰﾄﾞ：</font><br>
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
<hr color="#b3ceef">
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_h_com_add})&amp;({$tail})">ｺﾐｭﾆﾃｨ作成</a><br>
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;({$tail})">ﾄﾋﾟｯｸ検索</a><br>
<hr color="#0d6ddf">
<br>
<table width="100%"><tr><td bgcolor="#dddddd" align="center">
ｶﾃｺﾞﾘ別に表示<br>
</td></tr>
({foreach from=$c_commu_category_parent_list item=ccpl})
<tr><td>
<font color="#999966">({$ccpl.name})：</font><br>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({foreach from=$c_commu_category_list item=cccl})
({if $ccpl.c_commu_category_parent_id == $cccl.c_commu_category_parent_id })
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$cccl.c_commu_category_id})&amp;({$tail})">({$cccl.name|t_truncate:50:""})</a><br>
</td></tr>
({/if})
({/foreach})
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>
<br>

({$inc_ktai_footer|smarty:nodefaults})