({$inc_header|smarty:nodefaults})

<h2>施設編集</h2>

({if $msg})<p class="caution">({$msg})</p>({/if})

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('biz_admin_edit_shisetsu','do')})">

<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="biz_shisetsu_id" value="({$shisetsu.biz_shisetsu_id})">
<input type="hidden" name="image_filename" value="({$shisetsu.image_filename})">
<table>
<tr>
	<th>施設名</th>
	<td><input type="text" name="name" value="({$shisetsu.name})"></td>
</tr>
<tr>
	<th>施設写真</th>
	<td>
({if $shisetsu.image_filename})
<img src="img.php?filename=({$shisetsu.image_filename})&w=76&h=76"><br>
この写真を削除<br>
({/if})

	<input type="file" size="40" name="image_filename"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="　編　集　"></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})