({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="アルバム写真削除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>アルバム写真削除の確認</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>本当に削除しますか？</p>

({foreach from=$album_image_list item=album_image})
<table class="basicType2 album">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$album_image.c_album_image_id})
</td>
</tr>
({****})
<tr>
<th>写真</th>
<td>
<img src="({if $album_image.image_filename})({t_img_url filename=$album_image.image_filename w=120 h=120})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})">
</td>
</tr>
({****})
<tr>
<th>説明文</th>
<td class="textbody">
({$album_image.image_description|nl2br})
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$album_image.r_datetime})
</td>
</tr>
({****})
</tbody>
</table>
({/foreach})

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_album_image_selected','do')})" />
<input type="hidden" name="target_c_album_image_ids" value="({$target_c_album_image_ids})" />
<span class="textBtnS"><input type="submit" value="すべて削除する" /></span>
</form>

({$inc_footer|smarty:nodefaults})
