({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="CSVダウンロード"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>CSVダウンロード</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p class="caution">※全件ダウンロードすると処理が重くなり、サーバーに負荷がかかる場合があります。</p>

<h3 class="item">全件ダウンロード</h3>
<p>全てのメンバーの情報をCSV形式でダウンロードします。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="start_id" value="0" />
<input type="hidden" name="end_id" value="0" />
<input type="hidden" name="allflag" value="1" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />
<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>

<h3 class="item">メンバーIDを指定してダウンロード</h3>
<p>メンバーIDが指定された範囲内のメンバーの情報をCSV形式でダウンロードします。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input class="basic" type="text" name="start_id" value="" size="5" />　～　<input class="basic" type="text" name="end_id" value="" size="5" />
<input type="hidden" name="allflag" value="0" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />
<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>

({$inc_footer|smarty:nodefaults})
