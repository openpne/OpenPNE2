({$inc_header|smarty:nodefaults})

<h2>アカウント管理</h2>

<p>管理用アカウントを設定することができます。</p>

({if $msg})<p class="caution">({$msg})</p>({/if})

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table style="font-size:small">

({capture name="table_header"})
<tr>
<th>ID</th>
<th>アカウント名</th>
<th>権限</th>
<th>操作</th>
</tr>
({/capture})

<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tfoot>
({$smarty.capture.table_header|smarty:nodefaults})
</tfoot>
<tbody>
({foreach from=$user_list item=item})
<tr>
<td class="idnumber">({$item.c_admin_user_id})</td>
<td>({$item.username})</td>
<td>({$item.auth_type})</td>
<td>({if $item.c_admin_user_id != 1})<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_c_admin_user','do')})&amp;target_id=({$item.c_admin_user_id})&amp;sessid=({$PHPSESSID})">削除</a>({else})&nbsp;({/if})</td>
</tr>
({/foreach})
</tbody>

</table>

<p><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_admin_user')})">アカウント追加</a></p>

({$inc_footer|smarty:nodefaults})
