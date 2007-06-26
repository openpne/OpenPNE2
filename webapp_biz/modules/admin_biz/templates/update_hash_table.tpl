({$inc_header|smarty:nodefaults})

<h2>管理画面のページ名ランダム生成</h2>

<p>管理画面のページ名を推測できないようにランダム文字列で置換します。<br>
ページ名が既にランダム文字列の状態で再度実行すると、別の文字列で置換されます。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_hash_table','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="submit" class="submit" value="　実 行　">
</form>

<p>ページ名を元の状態に戻します。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_hash_table','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="submit" class="submit" value="　リセット　">
</form>

({$inc_footer|smarty:nodefaults})
