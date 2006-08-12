({$inc_header|smarty:nodefaults})

<h2>バナー修正</h2>

<form action="./" method="post" enctype="multipart/form-data">
<table>
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_banner','do')})">
<input type="hidden" name="c_banner_id" value="({$c_banner.c_banner_id})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
画像</th>
<td>
<a href="({t_img_url filename=$c_banner.image_filename})" target="_blank"><img src="({t_img_url filename=$c_banner.image_filename w=180 h=180})"></a><br>
<input type="file" name="upfile"></td>
</tr>
<tr>
<th>
リンク先</th>
<td><input type="text" name="a_href" value="({$c_banner.a_href})" size="40"></td>
</tr>
<tr>
<th>表示位置</th>
<td>
<select name="type">
<option value="TOP"({if $c_banner.type=="TOP"}) selected="selected"({/if})>TOP</option>
<option value="SIDE"({if $c_banner.type=="SIDE"}) selected="selected"({/if})>SIDE</option>
</select>
</td>
</tr>
<tr>
<th>バナー名</th>
<td><input type="text" name="nickname" value="({$c_banner.nickname})" size="20"></td>
</tr>
<tr>
<th>表示設定（ログイン前）</th>
<td>
<select name="is_hidden_before">
<option value="0"({if !$c_banner.is_hidden_before}) selected="selected"({/if})>表示する</option>
<option value="1"({if $c_banner.is_hidden_before}) selected="selected"({/if})>表示しない</option>
</select>
</tr>
<tr>
<th>表示設定（ログイン後）</th>
<td>
<select name="is_hidden_after">
<option value="0"({if !$c_banner.is_hidden_after}) selected="selected"({/if})>表示する</option>
<option value="1"({if $c_banner.is_hidden_after}) selected="selected"({/if})>表示しない</option>
</select>
</tr>
<tr>
<th>&nbsp;</th>
<td><input type="submit" class="submit" value="変更"></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})
