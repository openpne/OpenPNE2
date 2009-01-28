({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="プロフィール項目削除"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>プロフィール項目削除</h2>
<div class="contents">

<p class="caution" id="c01"><strong>本当に削除してもよろしいですか？</strong><br />※この項目に対するメンバーの入力値も失われます。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_profile','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_id" value="({$requests.c_profile_id})" />
<p class="textBtn"><input type="submit" value="削除する" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定へ戻る</a></p>
({$inc_footer|smarty:nodefaults})
