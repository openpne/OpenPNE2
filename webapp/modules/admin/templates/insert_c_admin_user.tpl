({$inc_header|smarty:nodefaults})

<h2>アカウント追加</h2>

<p>管理画面用のアカウントを追加することができます。</p>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<form action="./" method="post">
<table>
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_admin_user','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
ユーザ名</th>
<td><input type="text" name="username" value="" size="20"></td>
</tr>
<tr>
<th>パスワード</th>
<td><input type="password" name="password" value="" size="15"></td>
</tr>
<tr>
<th>パスワード(確認)</th>
<td><input type="password" name="password2" value="" size="15"></td>
</tr>
<tr>
<th>権限</th>
<td><select name="auth_type">
<option value="all">全権限</option>
<option value="">メンバーリスト以外全て</option>
<option value="normal">SNS設定のみ</option>
</select></td>
</tr>
<tr>
<th>&nbsp;</th>
<td><input type="submit" class="submit" value="追加"></td>
</tr>
</table>
</form>

<p><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})">アカウント管理へもどる</a></p>

({$inc_footer|smarty:nodefaults})