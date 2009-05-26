({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="ポイント・ランク設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})({/capture})

({assign var="page_name" value="ランク削除確認画面"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})
<h2>ランク削除確認画面</h2>
<div class="contents">

<table class="basicType2">
<tbody>
<tr>
<th>ID</th>
<td>({$c_rank.c_rank_id})</td>
</tr>
<tr>
<th>ランク名</th>
<td>({$c_rank.name})</td>
</tr>
<tr>
<th>ランク画像</th>
<td><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a></td>
</tr>
<tr>
<th>到達ポイント</th>
<td>({$c_rank.point})</td>
</tr>
</tbody>
</table>

<p>本当に削除してもよろしいですか？</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_rank','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_rank_id" value="({$c_rank.c_rank_id})">
<p class="textBtn"><input type="submit" value="　は　い　">　<input type="button" value="　いいえ　" onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})'"></p>
</form>


({$inc_footer|smarty:nodefaults})
