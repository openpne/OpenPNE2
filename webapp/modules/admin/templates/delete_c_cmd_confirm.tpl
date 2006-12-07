({$inc_header|smarty:nodefaults})
<h2>CMD削除確認画面</h2>

<table>
<tr>
<th>ID</th>
<td>({$c_cmd.c_cmd_id})</td>
</tr>
<tr>
<th>URL</th>
<td>({$c_cmd.name})</td>
</tr>
<tr>
<th>使用範囲</th>
<td>
({foreach from=$permit_list key=key item=name})
({$name}) : ({if $c_cmd.permit[$name] == 1})可({else})不可({/if})<br>
({/foreach})
</td>
</tr>

</table>

本当に削除してもよろしいですか？<br>
<br>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_cmd','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id})">
<input type="submit" class="submit" value=" は　い ">
</form>
<br>

<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})">戻る</a>
({$inc_footer|smarty:nodefaults})
