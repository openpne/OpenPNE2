({ext_include file="inc_header.tpl"})

<p>必ず下記の設定をおこなってからセットアップを実行してください。</p>
<ul>
<li>setup/sql/xxx/install/install-2.14-create_tables.sql の実行</li>
<li>setup/sql/xxx/install/install-2.14-insert_data.sql の実行</li>
<li>config.php の設定</li>
</ul>
<p>一度、セットアップを実行した後でこのページを表示することはできません。<br>
セットアップをやり直したい場合はデータベースを空にしてからこのページへアクセスしてください。</p>

({if $errors})
<ul class="caution">
({foreach from=$errors item=item})
<li>({$item})</li>
({/foreach})
</ul>
({/if})

({t_form m=setup a=do_setup})

<table>
<tr>
<th colspan="2">SNS名</th>
</tr>
<tr>
<th>SNS名</th>
<td><input type="text" name="SNS_NAME" value="({$requests.SNS_NAME})" size="30"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th colspan="2">初期メンバー</th>
</tr>
<tr>
<td colspan="2" style="background-color: #ffc">初期メンバーのログイン情報の設定をします。<br>
プロフィールやその他の設定項目はログイン後に設定してください。</td>
</tr>
<tr>
<th>PCメールアドレス</th>
<td><input type="text" name="pc_address" value="({$requests.pc_address})" size="30"></td>
</tr>
({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
<tr>
<th>
ログインID
</th>
<td><input type="text" name="username" value="({$requests.username})" size="30"></td>
</tr>
({/if})
<tr>
<th>パスワード</th>
<td><input type="password" name="password" value="" size="15"></td>
</tr>
({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})
<tr>
<th>パスワード(確認)</th>
<td><input type="password" name="password2" value="" size="15"></td>
</tr>
({/if})

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th colspan="2">管理用アカウント</th>
</tr>
<tr>
<td colspan="2" style="background-color: #ffc">管理画面へのログイン用アカウントの設定をします。</td>
</tr>
<tr>
<th>管理用アカウント名</th>
<td><input type="text" name="admin_username" value="({$requests.admin_username})" size="20"></td>
</tr>
<tr>
<th>管理用パスワード</th>
<td><input type="password" name="admin_password" value="" size="15"></td>
</tr>
<tr>
<th>管理用パスワード(確認)</th>
<td><input type="password" name="admin_password2" value="" size="15"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>&nbsp;</th>
<td><input type="submit" value="セットアップ実行"></td>
</tr>
</table>
</form>

({ext_include file="inc_footer.tpl"})
