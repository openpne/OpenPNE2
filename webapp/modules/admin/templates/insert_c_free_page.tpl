({$inc_header|smarty:nodefaults})
<h2>フリーページ追加</h2>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})"></textarea><br>
<input type="submit" class="submit" value="追加">
</form><br>

<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">戻る</a>
({$inc_footer|smarty:nodefaults})
