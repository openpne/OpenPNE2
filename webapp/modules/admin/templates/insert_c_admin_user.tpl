({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="parent_page_name" value="アカウント管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})({/capture})

({assign var="page_name" value="アカウント追加"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})


({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>アカウント追加</h2>
<div class="contents">

<p>管理用アカウントを追加することができます。</p>
<p class="caution" id="c01">※パスワードは6～12文字の半角英数で入力してください</p>

<form action="./" method="post">
<table class="basicType1">
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_admin_user','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
アカウント名</th>
<td><input class="basic" type="text" name="username" value="" size="20" /></td>
</tr>
<tr>
<th>パスワード</th>
<td><input class="basic" type="password" name="password" value="" size="15" /></td>
</tr>
<tr>
<th>パスワード(確認)</th>
<td><input class="basic" type="password" name="password2" value="" size="15" /></td>
</tr>
<tr>
<th>権限</th>
<td><select class="basic" name="auth_type">
<option value="all">全権限</option>
<option value="">「メンバーリスト関連部分」以外全て</option>
<option value="normal">「メンバー管理」「SNS内データ閲覧部分」以外全て</option>
</select></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="追加する"></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})">アカウント管理へ戻る</a></p>
({$inc_footer|smarty:nodefaults})
