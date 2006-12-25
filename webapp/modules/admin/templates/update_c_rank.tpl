({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="ランク編集"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2>ランク編集</h2>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_rank','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_rank_id" value="({$c_rank.c_rank_id})">

<table>
<tr>
<th>ID</th>
<td>({$c_rank.c_rank_id})</td>
</tr>
<tr>
<th>項目名</th>
<td><input type="text" name="name" value="({$c_rank.name})" size="20"></td>
</tr>
<tr>
<th>画像</th>
<td><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a><br>
<input type="file" name="image_upfile" size="20"></td>
</tr>
<tr>
<th>到達ポイント</th>
<td><input type="text" name="point" value="({$c_rank.point})" size="20"></td>
</tr>
<tr>
<th></th>
<td align=center><input type="submit" class="submit" value="編集"></td>
</tr>
</table>

</form>
<br>

<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">戻る</a>
({$inc_footer|smarty:nodefaults})
