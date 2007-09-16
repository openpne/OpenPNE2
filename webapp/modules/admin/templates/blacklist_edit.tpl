({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="ブラックリストメンバー編集"})
({assign var="parent_page_name" value="ブラックリストメンバー管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})

({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ブラックリストメンバー編集</h2>
<div class="contents">
<p>暗号化された個体識別番号と備考を入力してください。</p>
<p>暗号化された個体識別番号は<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member','page')})">メンバーリスト</a>で確認することが出来ます。</p>
<p class="caution">※ブラックリストメンバーに追加された個体識別番号を持つメンバーは、ログイン・新規登録が制限されます。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_edit_confirm','page')})" />
<input type="hidden" name="target_c_blacklist_id" value="({$blacklist.c_blacklist_id})" />

<table class="basicType2">
<tbody>
<tr>
<th>個体識別番号<br />※暗号化されたもの</th>
<td><input name="easy_access_id" type="text" class="basic" value="({$blacklist.easy_access_id})" size="38" /></td>
</tr>
<tr>
<th>メモ</th>
<td><textarea class="basic" name="info" cols="30" rows="3">({$blacklist.info})</textarea>
<br />
アクセス制限理由などを記入してください。
</td>
</tr>
<tr>
<th>&nbsp;</th>
<td><p class="textBtn"><input type="submit" class="submit" value=" 編　集 " /></p></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
