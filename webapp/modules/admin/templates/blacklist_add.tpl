({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="携帯個体識別番号のブラックリスト追加"})
({assign var="parent_page_name" value="ブラックリスト管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>携帯個体識別番号のブラックリスト追加</h2>
<div class="contents">

<p>携帯個体識別番号(暗号化済)と備考を入力してください。</p>
<p>携帯個体識別番号(暗号化済)は<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member','page')})">メンバーリスト</a>で確認することができます。</p>
<p class="caution">※ブラックリストに追加されたメンバーは、ログイン・新規登録が制限されます。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_add_confirm','page')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>携帯個体識別番号(暗号化済)</th>
<td><input name="easy_access_id" type="text" class="basic" value="({$requests.easy_access_id})" size="38" /></td>
</tr>
<tr>
<th>備考</th>
<td><textarea class="basic" name="info" cols="30" rows="3">({$requests.info})</textarea></td>
</tr>
</tbody>
</table>

<p class="textBtn"><input type="submit" class="submit" value="確認画面へ" /></p>
</form>

({$inc_footer|smarty:nodefaults})
