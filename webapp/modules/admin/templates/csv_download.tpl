({$inc_header|smarty:nodefaults})

<h2>CSVダウンロード</h2>
({if $msg})
<div class="caution">({$msg})</div>
({/if})
<br>


<div class="caution">※全件ダウンロードすると処理が重くなり、サーバーに負荷がかかる場合があります。</div>
<br>


メンバー情報CSV　<a href="?m=({$module_name})&a=do_({$hash_tbl->hash('csv_member','do')})&sessid=({$PHPSESSID})">全件ダウンロード</a><br>
<br>

<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_member','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
メンバーIDを指定してダウンロード<br>
<input type="text" name="start_id" value="" size="5">　～　<input type="text" name="end_id" value="" size="5">
<input type="submit" value="ダウンロード">
</form>

({$inc_footer|smarty:nodefaults})
