({$inc_header|smarty:nodefaults})
<h2>フリーページ管理</h2>
({if $msg})
<p class="caution">({$msg})</p>
({/if})
<p>★<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_free_page')})">フリーページ追加</a></p>

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

<table>
<tr>
<th>ID</th>
<th colspan=2>操作</th>
</tr>
({foreach from=$c_free_page_list item=item})
({if $item})
<tr>
<td><a href="({t_url _absolute=1 m=pc a=page_h_free_page})&amp;c_free_page_id=({$item.c_free_page_id})" target="_blank">({$item.c_free_page_id})</a></td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_free_page','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>編集</a></td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_free_page_confirm','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>削除</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="3">フリーページが登録されていません</td>
</tr>
({/foreach})
</table>

({if $pager && $pager.total_num > 0})
<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</div>
<!-- pager_end -->
({/if})

({$inc_footer|smarty:nodefaults})
