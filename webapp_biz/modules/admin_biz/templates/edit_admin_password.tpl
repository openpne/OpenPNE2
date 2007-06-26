({$inc_header|smarty:nodefaults})

<h2>管理用パスワード変更</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<p>管理画面用のパスワードを変更することができます。</p>

<ul>
<li class="caution">パスワードは6～12文字の半角英数で入力してください。</li>
</ul>

<form action="./" method="post">
<table>
<tr>
<th>
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_user_password','do')})">
現在のパスワード</th>
<td><input type="password" name="old_password" value=""></td>
</tr>
<tr>
<th>新しいパスワード</th>
<td><input type="password" name="new_password" value=""></td>
</tr>
<tr>
<th>新しいパスワード(確認)</th>
<td><input type="password" name="new_password2" value=""></td>
</tr>
<tr>
<th>&nbsp;</th>
<td><input type="submit" value="変更" class="submit"></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})