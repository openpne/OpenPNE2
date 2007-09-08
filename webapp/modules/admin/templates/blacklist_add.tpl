({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="ブラックリスト設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ブラックリスト追加</h2>
<div class="contents">
ブラックリストに追加された個体識別番号を持つユーザは、ログイン・新規登録が制限されます。
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_add_confirm','page')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>個体識別番号</th>
<td><input name="easy_access_id" type="text" class="basic" value="({$easy_access_id})" size="38" /></td>
</tr>
<tr>
<th>備考</th>
<td><textarea class="basic" name="info" cols="30" rows="3"></textarea></td>
</tr>
<tr>
<th>&nbsp;</th>
<td><p class="textBtn"><input type="submit" class="submit" value=" 追　加 " /></p></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
