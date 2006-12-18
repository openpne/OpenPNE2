({$inc_header|smarty:nodefaults})
<h2>ランク削除確認画面</h2>

<table>
<tr>
<th>ID</th>
<td>({$c_rank.c_rank_id})</td>
</tr>
<tr>
<th>項目名</th>
<td>({$c_rank.name})</td>
</tr>
<tr>
<th>画像</th>
<td><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a></td>
</tr>
<tr>
<th>到達ポイント</th>
<td>({$c_rank.point})</td>
</tr>

</table>

本当に削除してもよろしいですか？<br>
<br>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_rank','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_rank_id" value="({$c_rank.c_rank_id})">
<input type="submit" class="submit" value=" は　い ">
</form>
<br>

<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">戻る</a>
({$inc_footer|smarty:nodefaults})
