({$inc_header|smarty:nodefaults})

<h2>一括メッセージ送信履歴詳細</h2>

({if $history})
<table>

<tr>
<th>送信日時</th>
<td>({$history.r_datetime|date_format:"%Y/%m/%d"})</td>
</tr>

<tr>
<th>送信数</th>
<td>({$history.send_num})</td>
</tr>

<tr>
<th>タイトル    </th>
<td>({$history.subject|nl2br})</td>
</tr>

<tr>
<th>本文</th>
<td>({$history.body|nl2br})</td>
</tr>


<tr>
<th>送信先<br>ユーザーID</th>
<td>
<textarea name="body" cols="6" rows="10" readonly="readonly">({foreach from=$history.c_member_ids item=c_member_id})({$c_member_id})
({/foreach})</textarea>
</td>
</tr>

</table>

({else})
送信履歴がありません<br>
({/if})

<br>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_messages_history_list')})">戻る</a>

<br>

({$inc_footer|smarty:nodefaults})