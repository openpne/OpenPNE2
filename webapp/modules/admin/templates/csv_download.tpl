({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;CSVダウンロード</div>
</div>

({*ここまで:navi*})

<h2>CSVダウンロード</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p class="caution">※全件ダウンロードすると処理が重くなり、サーバーに負荷がかかる場合があります。</p>

<h3 class="item">全件ダウンロード</h3>
<p>全てのメンバー情報CSVをダウンロードします。</p>
<p class="textBtn"><input type="button" value="ダウンロード" onClick="location.href='?m=({$module_name})&a=do_({$hash_tbl->hash('csv_member','do')})&sessid=({$PHPSESSID})'"></p>

<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_member','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<h3 class="item">メンバーIDを指定してダウンロード</h3>
<p>メンバーIDの範囲を指定してCSVをダウンロードします。</p>
<input class="basic" type="text" name="start_id" value="" size="5">　～　<input class="basic" type="text" name="end_id" value="" size="5">
<p class="textBtn"><input type="submit" value="ダウンロード"></p>
</form>
</div>
({$inc_footer|smarty:nodefaults})
