({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="アップロードファイルリスト"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2 id="ttl01">アップロードファイルリスト</h2>
<div class="contents">
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_file')})" />
<strong>表示件数</strong>：
<select class="basic" name="page_size">
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
<option value="500"({if $pager.page_size==500}) selected="selected"({/if})>500件</option>
</select>
<span class="textBtnS"><input type="submit" value="　変　更　" /></span><span class="btnCaution">※表示件数を多くすると処理が重くなり、サーバーに負荷がかかります。</span>
</p>
</form>


<div class="listControl" id="pager01">
<p class="display">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています</p>
({capture name="pager"})
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">次へ</a>({/if})
</p>
({/capture})

({$smarty.capture.pager|smarty:nodefaults})
</div>({*/div class="listControl"*})

<table class="basicType2">
<thead>
<tr>
	<th>ID</th>
	<th>ファイル名</th>
	<th>元ファイル名</th>
	<th>作成日</th>
	<th>ファイルサイズ</th>
	<th>&nbsp;</th>
</tr>
</thead>
<tbody>
({foreach from=$c_file_list item=item})
({****})
<tr>
<td class="type1">
({$item.c_file_id})
</td>
({****})
<td>
<a href="./?m=({$module_name})&amp;a=do_({$hash_tbl->hash('file_download','do')})&amp;filename=({$item.filename})&amp;sessid=({$PHPSESSID})&amp;({$smarty.now})">
({$item.filename})
</a>
</td>
({****})
<td>
({$item.original_filename})
</td>
({****})
<td>
({$item.r_datetime})
</td>
({****})
<td>
({$item.size|number_format}) Bytes
</td>
({****})
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_file_confirm')})&amp;target_c_file_id=({$item.c_file_id})">削除</a>
</td>
({****})
({/foreach})
</tbody>
</table>

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
<p class="display">({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています</p>
</div>({*/div class="listControlBtm"*})

({$inc_footer|smarty:nodefaults})
