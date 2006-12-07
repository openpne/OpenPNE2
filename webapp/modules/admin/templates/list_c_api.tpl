({$inc_header|smarty:nodefaults})
<h2>OPENPNE API設定一覧</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

<p class="caution">
※許容IPアドレス記述例<br>
10進のIPアドレス表記（1件）：XXX.XXX.XXX.XXX<br>
半角アスタリスク（全てのサーバからのアクセスを許容）：*<br>
API未使用：空
</p>

<table>
<tr>
<th>ID</th>
<th>API名称</th>
<th>許容IPアドレス</th>
</tr>

({if $c_api_list})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_api','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
({/if})

({foreach from=$c_api_list item=c_api})
<tr>
<td class="idnumber">({$c_api.c_api_id})</td>
<td>({$c_api.name})</td>

<input type="hidden" name="c_api_id[]" value="({$c_api.c_api_id})">
<input type="hidden" name="name[]" value="({$c_api.name})">

<td><input type="text" name="ip[]" value="({$c_api.ip})" size="30"></td>

</tr>
({foreachelse})
<tr>
<td colspan="3">APIが登録されていません</td>
</tr>
({/foreach})

({if $c_api_list})
<td colspan=3 align=right><input type="submit" class="submit" value="変更"></td>
</form>
({/if})

</table>

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

({$inc_footer|smarty:nodefaults})