({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="招待メールドメイン制限"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>招待メールドメイン制限</h2>
<div class="contents">
<p>招待メールの送信先メールアドレスのドメインを制限できる機能です。</p>
<p>ドメインを指定した場合は、そのドメインのメールアドレス以外には招待メールを送信することができなくなります。<br />
指定なしの場合は、全てのメールアドレスを許可します。(デフォルト設定)</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_limit_domain','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>許可ドメイン1</th>
<td><input name="LIMIT_DOMAIN1" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN1})" size="30"><br>
</td>
</tr>
<tr>
<th>許可ドメイン2</th>
<td><input name="LIMIT_DOMAIN2" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN2})" size="30"><br>
</td>
</tr>
<tr>
<th>許可ドメイン3</th>
<td><input name="LIMIT_DOMAIN3" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN3})" size="30"><br>
</td>
</tr>
<tr>
<th>許可ドメイン4</th>
<td><input name="LIMIT_DOMAIN4" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN4})" size="30"><br>
</td>
</tr>
<tr>
<th>許可ドメイン5</th>
<td><input name="LIMIT_DOMAIN5" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN5})" size="30"><br>
</td>
</tr>
<tr>
<th>&nbsp;</th>
<td><p class="textBtn"><input type="submit" class="submit" value=" 更　新 "></p></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
