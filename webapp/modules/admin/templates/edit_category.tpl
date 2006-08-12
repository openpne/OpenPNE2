({$inc_header|smarty:nodefaults})

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<h2>中カテゴリ一覧</h2>

<table>
<tr>
<th>項目名</th>
<th>並び順<br>(昇順)</th>
<th colspan="2">操作</th>
<th>小カテゴリ</th>
</tr>
({foreach from=$c_commu_category_parent_list item=item})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_category_parent','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})">
<input type="text" name="name" value="({$item.name})" size="20"></td>
<td><input type="text" name="sort_order" value="({$item.sort_order})" size="5"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu_category_parent','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})">
<input type="submit" class="submit" value="削除">
</td>
</form>
<td><a href="#opt_({$item.name})">一覧</a></td>
</tr>
({/foreach})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_commu_category_parent','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="text" name="name" value="" size="20"></td>
<td><input type="text" name="sort_order" value="" size="5"></td>
<td colspan="2"><input type="submit" class="submit" value="項目追加"></td>
<td>&nbsp;</td>
</form>
</tr>
</table>

<hr>

<h2>小カテゴリ一覧</h2>

({foreach from=$c_commu_category_parent_list item=item})
<h3><a name="opt_({$item.name})">({$item.name})</a></h3>

<table>
<tr>
<th>項目名</th>
<th>並び順</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$c_commu_category_list[$item.c_commu_category_parent_id] item=option})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_category','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_category_id" value="({$option.c_commu_category_id})">
<input type="text" name="name" value="({$option.name})" size="20"></td>
<td><input type="text" name="sort_order" value="({$option.sort_order})" size="5"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu_category','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_category_id" value="({$option.c_commu_category_id})">
<input type="submit" class="submit" value="削除">
</td>
</form>
</tr>
({/foreach})
<tr>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_commu_category','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})">
<input type="text" name="name" value="" size="20"></td>
<td><input type="text" name="sort_order" value="" size="5"></td>
<td colspan="2"><input type="submit" class="submit" value="項目追加"></td>
</form>
</tr>
</table>

({/foreach})

({$inc_footer|smarty:nodefaults})