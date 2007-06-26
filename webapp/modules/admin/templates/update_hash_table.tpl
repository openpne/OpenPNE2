({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="page_name" value="ページ名ランダム生成"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>ページ名ランダム生成</h2>
<div class="contents">
<p class="info">管理画面のページ名を推測できないようにランダム文字列で置換します。</p>
<ul class="caution" id="c01">
	<li>ページ名が既にランダム文字列の状態で再度ランダム生成を実行すると、別の文字列で置換されます。</li>
	<li>ランダム生成したページ名を初期の状態に戻すには「ページ名を初期化する」ボタンを押してください。</li>
</ul>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_hash_table','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p class="textBtn"><input type="submit" value="ランダム生成を実行する"></p>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_hash_table','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p class="textBtnS" id="reset"><input type="submit" value="ページ名を初期化する"></p>
</form>
({$inc_footer|smarty:nodefaults})
