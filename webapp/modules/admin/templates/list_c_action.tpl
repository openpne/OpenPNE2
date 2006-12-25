({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="アクション一覧"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2>アクション一覧</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})


<table>
<tr>
<th>ID</th>
<th>項目名</th>
<th>設定ポイント</th>
<th>操作</th>
</tr>
({foreach from=$c_action_list item=c_action})
<tr>
<td class="idnumber">({$c_action.c_action_id})</td>
<td>({$c_action.name})</td>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_action','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_action_id" value="({$c_action.c_action_id})">
<input type="hidden" name="name" value="({$c_action.name})">
<td><input type="text" name="point" value="({$c_action.point})" size="30"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>

</tr>
({foreachelse})
<tr>
<td colspan="4">アクションが登録されていません</td>
</tr>
({/foreach})
</table>

({$inc_footer|smarty:nodefaults})