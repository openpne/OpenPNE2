({$inc_header|smarty:nodefaults})

<h2>初期コミュニティ管理</h2>
({if $msg})
<p class="caution">({$msg})</p>
({/if})

<h3>新規登録時に参加させるコミュニティ</h3>

<p>ユーザ新規登録時に以下で設定したコミュニティに自動的に参加させることができます。</p>
<p>参加させたいコミュニティのIDを入力して「追加」ボタンを押してください。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_is_regist_join' ,'do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="value" value="1">
<p>
ID：<input type="text" name="target_c_commu_id" value="({$requests.target_c_commu_id})" size="6">
<input type="submit" class="submit" value=" 追 加 ">
</p>
</form>

<table>
<tr>
<th>ID</th>
<th>コミュニティ名</th>
<th>管理者名</th>
<th>操作</th>
</tr>
({foreach from=$c_commu_list item=item})
({if $item})
<tr>
<td>({$item.c_commu_id})</td>
<td><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" target="_blank">({$item.name})</a></td>
<td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})" target="_blank">({$item.c_member_admin.nickname})</a></td>
<td><a href='?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_c_commu_is_regist_join','do')})&amp;target_c_commu_id=({$item.c_commu_id})&amp;value=0&amp;sessid=({$PHPSESSID})'>削除</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="4">コミュニティが登録されていません</td>
</tr>
({/foreach})
</table>

({$inc_footer|smarty:nodefaults})
