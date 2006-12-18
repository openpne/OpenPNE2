({$inc_header|smarty:nodefaults})
<h2>アクション一覧</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
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

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

({$inc_footer|smarty:nodefaults})