({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;セキュリティ管理：パスワード変更</div>
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>パスワード変更</h2>
<div class="contents">
<p class="info">管理ページ用のパスワードを変更します。</p>
<p class="caution" id="c01">※パスワードは6～12文字の半角英数で入力してください。</p>
<form action="./" method="post">
<table class="basicType1">
<tr>
<th>
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_user_password','do')})" />
現在のパスワード</th>
<td><input class="basic" type="password" name="old_password" value="" /></td>
</tr>
<tr>
<th>新しいパスワード</th>
<td><input class="basic" type="password" name="new_password" value="" /></td>
</tr>
<tr>
<th>新しいパスワード(確認)</th>
<td><input class="basic" type="password" name="new_password2" value="" /></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="変更する"></p>
</form>

</div>
({$inc_footer|smarty:nodefaults})
