({$inc_header|smarty:nodefaults})
<h2>フリーページ削除確認画面</h2>

---<br>
({$c_free_page.body|smarty:nodefaults|nl2br})<br>
---<br>

本当に削除してもよろしいですか？<br>
<br>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_free_page_id" value="({$c_free_page.c_free_page_id})">
<input type="submit" class="submit" value=" は　い ">
</form>
<br>

<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">戻る</a>
({$inc_footer|smarty:nodefaults})
