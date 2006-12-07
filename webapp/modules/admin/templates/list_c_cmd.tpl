({$inc_header|smarty:nodefaults})
<h2>CMD一覧</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

<p class="caution">※URL記述例 : ファイル名から拡張子を取り除いたもの<br>youtube.js → youtube</p>

<table>
<tr>
<th>ID</th>
<th>URL</th>
<th>使用範囲</th>
<th colspan='2'>操作</th>
</tr>

({foreach from=$c_cmd_list item=c_cmd})
<tr>
<td class="idnumber">({$c_cmd.c_cmd_id})</td>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})">

<td><input type="text" name="name" value="({$c_cmd.name})"></td>
<td>

({foreach from=$permit_list key=key item=name})
<input name="permit[]" type="checkbox" value="({$key})"({if $c_cmd.permit[$name] == 1}) checked="checked"({/if})>({$name})
({/foreach})

</td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<td>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_c_cmd_confirm','page')})">
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})">
<input type="submit" class="submit" value="削除">
</form>

</td>
</tr>
({foreachelse})
<tr>
<td colspan="5">APIが登録されていません</td>
</tr>
({/foreach})

<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<td class="idnumber"></td>
<td><input type="text" name="name"></td>
<td>
({foreach from=$permit_list key=key item=name})
<input name="permit[]" type="checkbox" value="({$key})" checked="checked">({$name})
({/foreach})
</td>
<td colspan='2' align='center'><input type="submit" class="submit" value="追加"></td>
</tr>
</form>

</table>

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

({$inc_footer|smarty:nodefaults})