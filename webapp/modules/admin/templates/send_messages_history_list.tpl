({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="一括メッセージ／Eメール送信履歴一覧"})
({assign var="parent_page_name" value="メンバーリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>
({*ここまで:navi*})

<h2>一括メッセージ／Eメール送信履歴一覧</h2>
<div class="contents">

({if $pager})
({capture name="pager"})
<div class="listControl">
<p class="display">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
</p>
<p class="listMove">
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_messages_history_list')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_messages_history_list')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_messages_history_list')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</p>
</div>({*/div class="listControl"*})
({/capture})

({$smarty.capture.pager|smarty:nodefaults})
({/if})

<table class="basicType2">
<thead>
<tr>
<th>送信日時</th>
<th>送信種別</th>
<th>送信数</th>
<th>操作</th>
</tr>
</thead>
<tbody>
({foreach from=$history_list item=history})
({if $history})
<tr>
<td>({$history.r_datetime|date_format:"%Y-%m-%d %H:%M"})</td>
<td align=center>({if $history.type == mail})Eメール({else})メッセージ({/if})</td>
<td align=center>({$history.send_num})</td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_messages_history_detail')})&amp;target_c_send_messages_history_id=({$history.c_send_messages_history_id})'>詳細</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="4" align=center>送信履歴がありません</td>
</tr>
({/foreach})
</tbody>
</table>

({if $pager})
({$smarty.capture.pager|smarty:nodefaults})
({/if})


({$inc_footer|smarty:nodefaults})