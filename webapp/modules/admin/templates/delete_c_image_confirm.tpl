({$inc_header|smarty:nodefaults})

<h2>画像削除</h2>

<p>本当に削除してもよろしいですか？</p>

<p><a href="({t_img_url filename=$c_image.filename})" target="_blank"
><img src="({t_img_url filename=$c_image.filename w=120 h=120})"></a>
</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_image4c_image_id','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_image_id" value="({$requests.target_c_image_id})">
<input type="submit" class="submit" value="削除">
</form>

<p><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">画像一覧にもどる</a></p>

({$inc_footer|smarty:nodefaults})
