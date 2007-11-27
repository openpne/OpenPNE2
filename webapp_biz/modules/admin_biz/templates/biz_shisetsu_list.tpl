({$inc_header|smarty:nodefaults})

<h2>施設管理</h2>

({if $msg})<p class="caution">({$msg})</p>({/if})

<table>
({foreach name=shisetsu_list from=$shisetsu_list item=item})
({if $smarty.foreach.shisetsu_list.iteration % 4 == 1})<tr>({/if})

<td style="font-size:10pt">
<div style="width:200px; height:200px">

<a href="({t_img_url filename=$item.image_filename w=180 h=180 noimg=no_image})" target="_blank"
><img src="({t_img_url filename=$item.image_filename w=180 h=180 noimg=no_image})"></a>
</div>
({$item.name})<br>
<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('biz_edit_shisetsu','page')})&biz_shisetsu_id=({$item.biz_shisetsu_id})">[編集]</a>　<a href="?m=({$module_name})&a=do_({$hash_tbl->hash('biz_admin_delete_shisetsu','do')})&sessid=({$PHPSESSID})&biz_shisetsu_id=({$item.biz_shisetsu_id})">[削除]</a>
</td>

({if $smarty.foreach.shisetsu_list.iteration %4 == 0})</tr>({/if})
({/foreach})
</table>

<hr>

<h2>施設新規作成</h2>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('biz_admin_add_shisetsu','do')})">

<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table>
<tr>
	<th>施設名</th>
	<td><input type="text" name="name" value=""></td>
</tr>
<tr>
	<th>施設写真</th>
	<td><input type="file" size="40" name="image_filename"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="　作　成　"></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})