({$inc_header|smarty:nodefaults})
<h2>ランク一覧</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

<table>
<tr>
<th>ID</th>
<th>項目名</th>
<th>画像</th>
<th>到達ポイント</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$c_rank_list item=c_rank})
<tr>
<td class="idnumber">({$c_rank.c_rank_id})</td>
<td>({$c_rank.name})</td>
<td  align="center"><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a></td>
<td>({$c_rank.point})</td>
<td><a href="?m=({$module_name})&amp;a=({$hash_tbl->hash('page_update_c_rank')})&amp;c_rank_id=({$c_rank.c_rank_id})">変更</a></td>
<td><a href="?m=({$module_name})&amp;a=({$hash_tbl->hash('page_delete_c_rank_confirm')})&amp;c_rank_id=({$c_rank.c_rank_id})">削除</a></td>
</tr>
({foreachelse})
<tr>
<td colspan="6">ランクが登録されていません</td>
</tr>
({/foreach})
<tr>
<form action="./" method="post" enctype="multipart/form-data">
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_rank','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
</td>
<td><input type="text" name="name" value="" size="5"></td>
<td><input type="file" name="image_upfile" value="" size="20"></td>
<td><input type="text" name="point" value="" size="5"></td>
<td colspan="2"><input type="submit" class="submit" value="項目追加"></td>
</form>
</tr>
</table>

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

({$inc_footer|smarty:nodefaults})