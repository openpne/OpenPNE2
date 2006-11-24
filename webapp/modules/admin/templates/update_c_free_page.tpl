({$inc_header|smarty:nodefaults})
<h2>フリーページ編集</h2>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_free_page_id" value="({$c_free_page.c_free_page_id})">
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_free_page.body})</textarea><br>
<input type="submit" class="submit" value="編集">
</form><br>

<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">戻る</a>
({$inc_footer|smarty:nodefaults})
