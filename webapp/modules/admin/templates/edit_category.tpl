({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="`$WORD_COMMUNITY`カテゴリ設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$WORD_COMMUNITY})カテゴリ設定</h2>
<div class="contents">
<table>
<tr>
<td class="middle">
<h3 class="item">中カテゴリ一覧</h3>
<table class="basicType2">
<thead>
<tr class="smallCtgTable">
<th>項目名</th>
<th>並び順<br />(昇順))</th>
<th colspan="2">操作</th>
<th>小カテゴリ</th>
</tr>
</thead>
<tbody>
({foreach from=$c_commu_category_parent_list item=item})
<tr>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_category_parent','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})" />
<input class="basic" type="text" name="name" value="({$item.name})" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="({$item.sort_order})" size="5" /></td>
<td><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu_category_parent','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
({/strip})</td>
</form>
<td><a href="#opt_({$item.name})">一覧</a></td>
</tr>
({/foreach})
<tr class="add">
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_commu_category_parent','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input class="basic" type="text" name="name" value="" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="" size="5" /></td>
<td colspan="3"><span class="textBtnS"><input type="submit" value="項目追加" /></span></td>
</form>
</tr>
</tbody>
</table>
</td>
<td class="small">
<h3 class="item">小カテゴリ一覧</h3>
({foreach from=$c_commu_category_parent_list item=item})
<table class="basicType2">
<thead>
<tr class="smallCtgItem"><th colspan="5"><a name="opt_({$item.name})">({$item.name})</a></th></tr>
<tr class="smallCtgTable">
<th>項目名</th>
<th>並び順</th>
<th>作成</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_commu_category_list[$item.c_commu_category_parent_id] item=option})
<tr>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_category','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_id" value="({$option.c_commu_category_id})" />
<input class="basic" type="text" name="name" value="({$option.name})" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="({$option.sort_order})" size="5" /></td>
<td><select class="basic" name="is_create_commu">
<option value="1"({if $option.is_create_commu}) selected="selected"({/if})>可</option>
<option value="0"({if !$option.is_create_commu}) selected="selected"({/if})>不可</option>
</select></td>
<td><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu_category','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_id" value="({$option.c_commu_category_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
({/strip})</td>
</form>
</tr>
({/foreach})
<tr class="add">
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_commu_category','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})" />
<input class="basic" type="text" name="name" value="" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="" size="5" /></td>
<td><select class="basic" name="is_create_commu">
<option value="1" selected>可</option>
<option value="0">不可</option>
</select></td>
<td colspan="2"><span class="textBtnS"><input type="submit" value="項目追加" /></span></td>
</form>
</tr>
</tbody>
</table>
({/foreach})
</td>
</tr>
</table>
({$inc_footer|smarty:nodefaults})
