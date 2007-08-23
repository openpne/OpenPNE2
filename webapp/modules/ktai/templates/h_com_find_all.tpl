({$inc_ktai_header|smarty:nodefaults})

<center>ｺﾐｭﾆﾃｨ</center>
<hr>
最新書き込み<br>
({foreach from=$c_commu_list_lastupdated item=item})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})&amp;({$tail})">({$item.name})</a><br>
({/foreach})
<hr>
ｺﾐｭﾆﾃｨ名で探す
({t_form _method=get m=ktai a=page_h_com_find_result})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="search_word" value="">
<br>
<select name="target_c_commu_category_id">
<option value="all">すべてのｶﾃｺﾞﾘ
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})">({$item.name})
({/foreach})
</select>
<br>
<input type="submit" value="検索">
</form>
<hr>
ｶﾃｺﾞﾘ別<br>

({foreach from=$c_commu_category_parent_list item=ccpl})
<hr>
【({$ccpl.name})】<br>

({foreach from=$c_commu_category_list item=cccl})

({if $ccpl.c_commu_category_parent_id == $cccl.c_commu_category_parent_id })

({$cccl.icon})<a href="({t_url m=ktai a=page_h_com_category})&amp;target_c_commu_category_id=({$cccl.c_commu_category_id})&amp;({$tail})">({$cccl.name})</a><br>

({/if})

({/foreach})
<br>
({/foreach})

<hr>
<a href="({t_url m=ktai a=page_h_com_add})&amp;({$tail})">ｺﾐｭﾆﾃｨ作成</a><br>
<a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;({$tail})">ﾄﾋﾟｯｸ検索</a>

<hr>

({$inc_ktai_footer|smarty:nodefaults})