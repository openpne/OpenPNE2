({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_designCustomize.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;デザインカスタマイズ：<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定</a>&nbsp;＞&nbsp;プロフィール項目削除</div>
</div>

({*ここまで:navi*})
<h2>ランク削除確認画面</h2>
<div class="contents">

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
