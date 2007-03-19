({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})

({assign var="page_name" value="ブラックリスト登録"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>ブラックリスト登録</h2>

<div class="contents">

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

({if $pager && $pager.total_num > 0})
({capture name="pager"})
<div class="listControl">
<p class="display">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
</p>
<p class="listMove">
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_black_list')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</p>
</div>({*/div class="listControl"*})
({/capture})

({$smarty.capture.pager|smarty:nodefaults})
({/if})

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>アドレス</th>
<th>登録日</th>
<th>備考</th>
<th>操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_black_list_list item=c_black_list})
<tr>
<td>({$c_black_list.c_black_list_id})</td>
<td>({$c_black_list.address})</td>
<td>({$c_black_list.r_datetime|date_format:"%y-%m-%d"})</td>
<td>({$c_black_list.memo})</td>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_black_list')})&amp;c_black_list_id=({$c_black_list.c_black_list_id})">編集</a>&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_black_list_confirm')})&amp;c_black_list_id=({$c_black_list.c_black_list_id})">削除</a>
</td>
</tr>
({foreachelse})
<tr>
<td colspan="4">ブラックリストが登録されていません</td>
</tr>
({/foreach})
</tbody>
</table>

({if $pager && $pager.total_num > 0})
({$smarty.capture.pager|smarty:nodefaults})
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_black_list','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table class="basicType2">
<tr>
<th>アドレス</th>
<th>備考</th>
<th>操作</th>
</tr>
<tr>
<td>
<input type="text" class="basic" name="address">
</td>
<td>
<input type="text" class="basic" name="memo">
</td>
<td>
<span class="textBtnS"><input type="submit" class="submit" value="追加する"></span>
</td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})