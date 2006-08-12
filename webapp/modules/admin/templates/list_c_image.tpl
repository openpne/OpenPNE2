({$inc_header|smarty:nodefaults})

<h2>画像リスト</h2>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_image')})">
表示件数：
<select name="page_size">
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
<option value="500"({if $pager.page_size==500}) selected="selected"({/if})>500件</option>
</select>
<input type="submit" class="submit" value="変更">
<div class="caution">※表示件数を多くすると処理が重くなり、サーバーに負荷がかかります。</div>
</form>

<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">次へ</a>
({/if})
</div>
<!-- pager_end -->


<table>
({foreach name=c_image from=$c_image_list item=item})
({if $smarty.foreach.c_image.iteration % 5 == 1})<tr>({/if})

<td style="font-size:10pt">
({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})
<div style="width:120px; height:120px">
<a href="({t_img_url filename=$item.filename})" target="_blank"
><img src="({t_img_url filename=$item.filename w=120 h=120})"
></a></div>
({$item.filename})<br>
({if strpos($item.filename, 'skin_') !== 0 && strpos($item.filename, 'no_') !== 0})
[<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_image_confirm')})&amp;target_c_image_id=({$item.c_image_id})">削除</a>]
({/if})
</td>

({if $smarty.foreach.c_image.iteration % 5 == 0})</tr>({/if})
({/foreach})
</table>


<!-- pager_begin -->
<div class="pager">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
<br>
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">次へ</a>
({/if})
</div>
<!-- pager_end -->

<hr>

<h3>画像管理</h3>
<p><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">画像管理ページへ</a></p>

({$inc_footer|smarty:nodefaults})